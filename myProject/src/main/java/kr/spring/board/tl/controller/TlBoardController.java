package kr.spring.board.tl.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;

@Controller
public class TlBoardController {
 
	//로그 처리
		private Logger log = Logger.getLogger(this.getClass());

		@Resource
		private MemberService memberService;

		//자바빈(VO) 초기화
		//서버 유효성 체크시 필수로 필요
		@ModelAttribute
		public MemberVO initCommand() {
			return new MemberVO();
		}
		
		
		//트레이너리스트를 눌렀을경우 들어올 페이지
		//트레이너리스트를 호출
		@RequestMapping("/trainerList/trainerList.do")
		public String formUserType() {
			
			//비 로그인 상태일 경우 팔로우한 트레이너 리스트는 볼 수 없음
			//로그인 상태일 경우 자신이 팔로우한 트레이너 리스트를 상단에 표시
			
			
			//definition 설정명을 호출
			return "trainerList";
		}
		
		//트레이너 상세정보페이지를 보여줄 메서드
		@RequestMapping(value="/trainerList/trainerListDetail.do", method=RequestMethod.GET)
		public String formMemberRegister() {
			
			//definition 설정명을 호출
			return "trainerListDetail";//이 뷰에서 일반회원의 회원정보를 기입할 수 있게 해준다
		}
		
	
}
