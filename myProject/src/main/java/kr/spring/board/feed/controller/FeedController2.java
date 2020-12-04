package kr.spring.board.feed.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.xml.ws.Response;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.board.feed.service.FeedService2;
import kr.spring.board.feed.vo.FeedVO;
import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;

//조재희
@Controller
public class FeedController2 {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	FeedService2 feedService;
	
	@Resource
	MemberService memberService;
	
	//자바빈 초기화
	@ModelAttribute
	public FeedVO initCommand() {
		return new FeedVO();
	}
	
	@ModelAttribute
	public MemberVO initCmd() {
		return new MemberVO();
	}
	
	/*게시물 목록(현재 로그인된 아이디와 클릭된 아이디의 관계 파악하여 list 목록을 호출)
	 * 	session_num과 profile_num이 같은 경우
	  	=> 나만보기, 팔로우공개, 트레이너공개, 전체공개가 보여진다
		본인이 본인 프로필 사진을 누를 경우
		session_num과 profile_num이 다르면서 following이 아닌 경우
		다른 사람의 프로필 사진을 누르면서 following이 아닌 경우 => 전체공개만 보여진다
		session_num과 profile_num이 다르면서 following이 맞는 경우
		다른 사람의 프로필 사진을 누르면서 following이 맞는 경우 => 팔로우공개, 전체공개가 보여진다
		session_num과 profile_num이 다르면서 training이 아닌 경우
		다른 사람의 프로필 사진을 누르면서 training이 아닌 경우 => 전체공개만 보여진다
		session_num과 profile_num이 다르면서 training이 맞는 경우
		다른 사람의 프로필 사진을 누르면서 training이 아닌 경우 => 팔로우공개, 트레이너공개, 전체공개가 보여진다
	 */
	@RequestMapping(value="/boardFeed/feedList.do",method=RequestMethod.GET)
	public ModelAndView feedList(HttpSession session) {

		//회원번호를 얻기위해 세션에 저장된 회원 정보를 반환
	    MemberVO vo = (MemberVO)session.getAttribute("user");
	    MemberVO memberVO = memberService.selectMember_detail(vo.getMem_num());
	    int count = feedService.countingFeedList(memberVO.getMem_num());
		
		if(log.isDebugEnabled()) {
			log.debug("<<FeedCount>>" + count);
		}
		
		List<FeedVO> list = null;
		
		if(count>0) {
			list = feedService.myPersnolList(memberVO.getMem_num());
			
			if(log.isDebugEnabled()) {
				log.debug("<<피드 목록>> : " + list);
			}
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPersonalList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("member", memberVO);
		
		return mav;
	}
	
	//게시물 등록 폼
	@RequestMapping(value="/boardFeed/feedWrite.do", method=RequestMethod.GET)
	public String feedWriteForm(){
		if(log.isDebugEnabled()) log.debug("<<피드 글쓰기 폼 진입 시도>>" );
		return "feedWrite";
		
	}

	//게시물 등록 처리
	@RequestMapping(value="/boardFeed/feedWrite.do",method=RequestMethod.POST)
	public String feedWriteSubmit(@Valid FeedVO feedVO, 
			BindingResult result, 
			HttpServletRequest request,
			HttpSession session,
			Model model) {

		if(log.isDebugEnabled()) log.debug("<<마이 퍼스널 게시판 글 저장>> :" + feedVO);

		if(result.hasErrors()) return "feedWrite";
		//회원번호, ID 셋팅
		MemberVO member = (MemberVO)session.getAttribute("user");
		feedVO.setMem_num(member.getMem_num());
		feedVO.setMem_id(member.getMem_id());
		
		//ip 셋팅
		feedVO.setFeed_ip(request.getRemoteAddr());
		
		//글쓰기
		feedService.insertFeedBoard(feedVO);

		model.addAttribute("message", "운동일지가 등록되었습니다.");
		model.addAttribute("url",request.getContextPath() + "/boardFree/list.do");

		return "common/result";
	}	

	//게시물 수정 폼

	//게시물 수정 처리

	//이미지 출력
	@RequestMapping("/boardFeed/photoView.do")
	public ModelAndView viewImage(HttpSession session)	{

		MemberVO user = (MemberVO)session.getAttribute("user");
		MemberVO memberVO = memberService.selectMember_detail(user.getMem_num());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile", memberVO.getMem_pic());
		//mav.addObject("filename", memberVO.getMem_name());

		return mav;

	}



}
