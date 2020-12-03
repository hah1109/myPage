package kr.spring.board.feed.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.board.feed.service.FeedService3;
import kr.spring.board.feed.vo.FeedVO;

@Controller
public class FeedController3 {
	
	//로거 생성
	private Logger log = Logger.getLogger(this.getClass());
	
	//Service
	@Resource
	FeedService3 feedService3;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public FeedVO initCommand() {
		return new FeedVO();
	}
	
	

	//전체 피드 리스트
	@RequestMapping("/boardFeed/myFeed.do")
	public ModelAndView getMyFeed() {
		
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	
	//(트레이너)내 회원 피드 리스트 받아오기
	
}
