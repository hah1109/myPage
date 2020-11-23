package kr.spring.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/main/main.do")
	public String getMain() {
		return "/main/main";
	}
	
	/*@RequestMapping("/homeTraining/hwList.do")
	public String getHometraining() {
		return "hwList";
	}*/
	
	@RequestMapping("/nutriment/nutrimentGuide.do")
	public String getNutrimentGuide() {
		return "nutrimentGuide";
	}
	
	/*@RequestMapping("")
	public String getTrainingDiary() {
		
		//임시 링크 추후 수정할 것. 리퀘스트 맵핑도
		return "";
	}*/
	
	/*@RequestMapping("boardFree/list.do")
	public String getBoard() {
		//return "list";
	}*/
	
	/*@RequestMapping("")
	public String geTrainer() {
		//return "";
	}*/
	
}





