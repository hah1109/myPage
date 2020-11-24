package kr.spring.nutriment.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.vo.MemberVO;
import kr.spring.nutriment.service.NutrimentService;
import kr.spring.nutriment.vo.NutrimentVO;

@Controller
public class NutrimentController {
	
	NutrimentService nutrimentService;
	

	//영양성분 검색 페이지 호출
	@RequestMapping(value="/nutriment/nutriList.do", method=RequestMethod.GET)
	public ModelAndView nutriList(HttpSession session) {
		
		// 조건체크해서 session에 로그인 되어 있는 아이디의 auth값 받기
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
	public ModelAndView nutriSearch(@RequestParam(value="foodName") String foodName){
		
		//@RequestParma 으로 request에서 foodName 받아옴, 받아서 select문 돌린 후 
		//selectNutriment의 리턴값인 nutriment 자바빈 변수에 저장
		NutrimentVO nutriDetail = nutrimentService.selectNutriment(foodName);

		//뷰이름 nutriDetail 서비스에서 리턴 받은 자바빈이름 nutriDetail 리턴  nutriDetail뷰에서 상세정보 보여줌.
		return new ModelAndView("nutriDetail","nutriDetail",nutriDetail);
	
	}

	//영양성분 등록 폼 호출
	@RequestMapping(value="/nutriment/nutrimentInsert.do", method=RequestMethod.GET)
	public String nutriInsertform() {
			
		return "nutriInsert";
	}

	//영양성분 등록 처리
	@RequestMapping(value="/nutriment/nutrimentInsert.do", method=RequestMethod.POST)
	public String nutriSubmit(){
		
		return "";
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
