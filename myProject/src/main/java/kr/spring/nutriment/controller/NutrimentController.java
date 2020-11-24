package kr.spring.nutriment.controller;

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

@Controller
public class NutrimentController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
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

	
	//영양성분 검색 페이지 검색버튼 onClick event
	@RequestMapping(value="/nutriment/nutrimentSearch.do", method=RequestMethod.GET)
	public String nutriSearch(@RequestParam String foodName, Model model){
		
		
		//@RequestParma 으로 request에서 foodName 받아옴, 받아서 select문 돌린 후 
		//selectNutriment의 리턴값인 nutrimentVO를 변수에 저장
		NutrimentVO nutrimentVO = (NutrimentVO)nutrimentService.selectNutriment(foodName);
		
		if(log.isDebugEnabled()) { log.debug("<<영양성분 검색>> :" + nutrimentVO);}

		
		/*if(nutriDetail != null) {//검색 결과 있을 시
			
			//모델에 자바빈 add 후 view 리턴
			model.addAttribute("nutriDetail",nutriDetail);
			*/
			return "nutrimentDetail";
		/*	
		} else {//검색 결과 없을 시
			
		
			model.addAttribute("message", "검색 결과가 없습니다.");
			model.addAttribute("url","nutriList.do");
			
			return "common/result";
			
		}
	*/
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
			
			//login.do 왜 호출 안되는지,, 해결하기,,,,
			/*model.addAttribute("message", "로그인 후 이용가능한 페이지 입니다.");
			model.addAttribute("url", "${pageContext.request.contextPath}/member/login.do");*/
			
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
	@RequestMapping(value="/nutriment/nutriCal.do", method=RequestMethod.GET)
	public String nutriCalForm() {
			
		return "nutriICal";
	}

	//탄단지 계산기 결과 호출
	@RequestMapping(value="/nutriment/nutriCal.do", method=RequestMethod.POST)
	public ModelAndView nutriCalSubmit() {
		
		//DB처리 없이 java or java-script로 계산	
		return null;
	}
}
