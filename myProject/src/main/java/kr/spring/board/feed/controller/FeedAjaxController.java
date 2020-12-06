package kr.spring.board.feed.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.board.feed.service.FeedService2;
import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;

@Controller
public class FeedAjaxController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private MemberService memberService;
	@Resource
	private FeedService2 feedService;
	
	
	
	@RequestMapping("/boardFeed/updateMyPhoto.do")
	@ResponseBody
	public Map<String, String> processProfile(MemberVO memberVO, HttpSession session){
		Map<String, String> map = new HashMap<String, String>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");

		System.out.println("프로필 수정 진입");
		if(user==null) {
			//로그인 되지 않은 경우
			map.put("result", "logout");
		}else {
			//로그인이 된 경우
			memberVO.setMem_num(user.getMem_num());
			System.out.println(memberVO);
			feedService.updateProfile(memberVO);
			
			//이미지를 업로드 한 후 세션에 저장된 회원 정보의 이미지 이름 교체
			user.setMem_picName(memberVO.getMem_picName());
			map.put("result", "success");
		}
		return map;
	}
	
	@RequestMapping("/boardFeed/updateIntro.do")
	@ResponseBody
	public Map<String, String> processIntro(MemberVO memberVO, HttpSession session){
		Map<String, String> map = new HashMap<String, String>();
		System.out.println("진입");
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			//로그인 되지 않은 경우
			map.put("result", "logout");
		}else {
			//로그인이 된 경우
			memberVO.setMem_num(user.getMem_num());
			System.out.println(memberVO.getMem_intro() + memberVO.getMem_name() + memberVO.getMem_num());
			feedService.updateIntro(memberVO);
			
			//이미지를 업로드 한 후 세션에 저장된 회원 정보의 이미지 이름 교체
			user.setMem_intro(memberVO.getMem_intro());
			map.put("result", "success");
		}
		return map;
	}
}
