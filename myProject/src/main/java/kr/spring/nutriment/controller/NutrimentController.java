package kr.spring.nutriment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.nutriment.service.NutrimentService;
import kr.spring.nutriment.vo.NutrimentVO;

@Controller
public class NutrimentController {
	
	NutrimentService nutrimentService;
	
	//식단 버튼 - > 식단 가이드 페이지 호출 (무슨 컨트롤러에 넣어놔야할지 모르겠음 ㅎ)
	@RequestMapping("/board/nutriment.do")
	public String getNutrimentGuide(){
		
		return "board/nutriment/guide";
	}

	//영양성분 검색 페이지 호출
	@RequestMapping(value="/board/nutrimentSearch.do", method=RequestMethod.GET)
	public String nutriList() {
		// 조건체크해서 session에 로그인 되있는 아이디의 auth값 받아서 
		//음식 등록 버튼 노출 여부 체크 하기
		
		return "nutriList";
	}

	//영양성분 검색 페이지 검색버튼 onClick event
	@RequestMapping(value="/board/nutrimentSearch.do", method=RequestMethod.POST)
	public ModelAndView nutriSearch(@RequestParam String foodName){

		NutrimentVO nutri = nutrimentService.selectNutriment(foodName);

		return new ModelAndView("nutriDetail","nutriDetail",nutri);
	}

	//영양성분 등록 폼 호출
	@RequestMapping(value="/board/nutrimentInsert.do", method=RequestMethod.GET)
	public String nutriInsertform() {
			
		return "nutriInsert";
	}

	//영양성분 등록 처리
	@RequestMapping(value="/board/nutrimentInsert.do", method=RequestMethod.POST)
	public String nutriSubmit(){
		
		return "";
	}

	//탄단지 계산기 폼 호출
	@RequestMapping(value="/board/nutriCal.do", method=RequestMethod.GET)
	public String nutriCalForm() {
			
		return "nutriICal";
	}

	//탄단지 계산기 결과 호출
	@RequestMapping(value="/board/nutriCal.do", method=RequestMethod.POST)
	public ModelAndView nutriCalSubmit() {
		
		//DB처리 없이 java or java-script로 계산	
		return null;
	}
}
