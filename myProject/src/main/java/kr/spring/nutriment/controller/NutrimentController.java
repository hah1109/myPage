package kr.spring.nutriment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.vo.MemberVO;
import kr.spring.nutriment.service.NutrimentService;
import kr.spring.nutriment.vo.NutrimentVO;
import kr.spring.util.PagingUtil;

@Controller
public class NutrimentController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	NutrimentService nutrimentService;
	
	//자바빈 초기화
	@ModelAttribute
	public NutrimentVO initCommand() {
		return new NutrimentVO();
	}
	

	//영양성분 검색 페이지 호출
	@RequestMapping(value="/nutriment/nutriList.do", method=RequestMethod.GET)
	public ModelAndView nutriList(HttpSession session) {
		
		// session에 로그인 되어 있는 아이디의 auth값 받기
		MemberVO memberVO = (MemberVO)session.getAttribute("user");
		
		
		if(memberVO != null) { //로그인 상태일 시
			
			//auth 값만 request에 넘기기 위해 변수에 따로 저장
			int auth = memberVO.getMem_auth();
			
			//nutriList 뷰 리턴, 서버에 auth 값 리턴 -> script로 버튼 노출 처리
			return new ModelAndView("nutriList","auth",auth);
		
		} else {
			
			//비로그인 상태일시 auth값 없이 view만 리턴
			return new ModelAndView("nutriList");
		}
		
	}

	
	//영양성분 검색 페이지 검색
	@RequestMapping(value="/nutriment/nutrimentSearch.do")
	public ModelAndView nutriSearch(@RequestParam String foodName,
									@RequestParam(value="pageNum",defaultValue="1") int currentPage){
	
		
		/*****************paging 처리*************/
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("foodName", foodName);
		
		//검색된 자바빈의 개수
		int count = nutrimentService.count(map);
		if(log.isDebugEnabled()) { log.debug("<<검색된 영양성분 갯수>> : " + count); }
		
		PagingUtil page = new PagingUtil(currentPage,count,10,10,"nutrimentSearch.do","&foodName="+foodName);
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());

		List<NutrimentVO> list = null;
		
		if(count > 0) { //검색결과 있을 시 
			
			list = nutrimentService.selectNutriment(map);
			if(log.isDebugEnabled()) { log.debug("<<검색된 영양성분 목록>> : " + list); }
			
		} else  {
			
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("message", "검색 결과가 없습니다.");
			mav.addObject("url","nutriList.do");
			mav.setViewName("common/result");
			
			return mav;
		}
		
		
		ModelAndView mav = new ModelAndView();
		
		
		mav.addObject("list", list);
		mav.addObject("count", count);
		mav.addObject("pagingHtml", page.getPagingHtml());
		mav.setViewName("nutrimentSearchResult");
		
		return mav;
		
	}

	

	//영양성분 등록 폼 호출
	@RequestMapping(value="/nutriment/nutrimentInsertForm.do", method=RequestMethod.GET)
	public String nutriInsertform(HttpSession session, Model model) {
		
		//관리자 로그인 확인 체크 (버튼으로 접근이 아닌 주소로 접근할 때를 위해)
		//session에 로그인 되어 있는 아이디의 auth값 받기
		MemberVO memberVO = (MemberVO)session.getAttribute("user");
		
		if(memberVO != null) { //로그인 상태일 시
			
			
			if(memberVO.getMem_auth() == 0) {//로그인 된 id의 auth 값이 0(관리자 일 때)
				
				//insert form 호출
				return "nutrimentInsertForm";
				
			} else { //로그인 된 id가 일반회원/트레이너 일 경우
				
				//model에 값 2개 넘긴 후 result.jsp 리턴
				model.addAttribute("message", "관리자 전용 페이지 입니다.");
				model.addAttribute("url", "nutriList.do");
				

				return "common/result";
			}
			
		
		} else { //비로그인 상태 일시
			
			model.addAttribute("message", "관리자 전용 페이지 입니다.");
			model.addAttribute("url", "nutriList.do");
			
			
			//model에 값 2개 넘긴 후 result.jsp 리턴
			return "common/result";
		}

	}

	
	
	//영양성분 등록 처리
	@RequestMapping(value="/nutriment/nutrimentInsertForm.do", method=RequestMethod.POST)
	public String nutriSubmit(@Valid NutrimentVO nutrimentVO, BindingResult result, HttpSession session, Model model){
		
		//유효성 체크 결과 에러가 있으면 InsertForm 호출
		if(result.hasErrors()) { return "nutriInsertForm"; }
		
		if(log.isDebugEnabled()) { log.debug("<<영양성분 등록>> :" + nutrimentVO);}
		
		//영양성분 등록
		nutrimentService.insertNutriment(nutrimentVO);
		
		//result 페이지 셋팅
		model.addAttribute("message", "등록이 완료되었습니다.");
		model.addAttribute("url", "nutriList.do");
		
		return "common/result";
		
	}

	//탄단지 계산기 폼 호출
	@RequestMapping(value="/nutriment/nutrimentCal.do", method=RequestMethod.GET)
	public String nutriCalForm() {
			
		return "nutrimentCal";
	}

	//탄단지 계산기 결과 호출
	@RequestMapping(value="/nutriment/nutrimentCal.do", method=RequestMethod.POST)
	public ModelAndView nutriCalSubmit(@RequestParam(value="height") int height,
								 @RequestParam(value="weight") int weight,
								 @RequestParam(value="age") int age,
								 @RequestParam(value="gender") String gender,
								 @RequestParam(value="type") String type){
		
		
		ModelAndView mav = new ModelAndView();
		
		//view에 넘길 값
		int carb = 0;
		int protein = 0;
		int fat = 0;
		
		//기초대사량 계산
		int bmr = 0;
		int dayCal = 0; //일일 권장 섭취량
		
		if(gender.equals("f")) {//여성일때
			bmr = (int)(665.1 + (9.56 * weight) + (1.85 * height) - (4.68 * age));
			dayCal = bmr+200;
		} else { //남성일떄
			bmr = (int)(66.5 + (13.7 * weight) + (5.0 * height) - (6.8 * age));
			dayCal = bmr+200;
		}
		
		mav.addObject("bmr",bmr);
		mav.addObject("dayCal",dayCal);
		
		//권장 섭취량 계산
		if(type.equals("fast")) {//빠른 체중감량 탄3단5지2
			
			carb = (int) (dayCal * 0.3 /4);
			protein = (int) (dayCal * 0.5 /4);
			fat = (int) (dayCal * 0.2 /9);
			
		} else if(type.equals("normal")) {//적당한 체중 감량 탄4단4지2
			
			carb = (int) (dayCal * 0.4 /4);
			protein = (int) (dayCal * 0.4 /4);
			fat = (int) (dayCal * 0.2 /9);
			
		} else if(type.equals("healthy")) {//건강한 식습관 탄5단3지2
			
			carb = (int) (dayCal * 0.5 /4);
			protein = (int) (dayCal * 0.3 /4);
			fat = (int) (dayCal * 0.2 /9);
			
		} else if(type.equals("low")) {//저강도 운동 탄 3 단백질:몸무게*1.5 지 2
			
			carb = (int) (dayCal * 0.3 /4);
			protein = (int) (weight * 1.5 /4);
			fat = (int) (dayCal * 0.2 /9);
			
		} else if(type.equals("high")) {//고강도 운동 탄4 단백질:몸무게*2.0 지2
			
			carb = (int) (dayCal * 0.4 /4);
			protein = (int) (weight * 2 /4);
			fat = (int) (dayCal * 0.2 /9);
		}
		
		mav.addObject("type",type);
		mav.addObject("carb",carb);
		mav.addObject("protein",protein);
		mav.addObject("fat",fat);
		
		
		System.out.println(carb+protein+fat);
		mav.setViewName("nutrimentCal");
		
		return mav;
	}
	
	
}
