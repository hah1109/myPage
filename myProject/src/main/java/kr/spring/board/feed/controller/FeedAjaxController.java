package kr.spring.board.feed.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.board.feed.service.FeedService2;
import kr.spring.comment.feed.vo.FeedCommentVO;
import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;

@Controller
public class FeedAjaxController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private MemberService memberService;
	@Resource
	private FeedService2 feedService;
	
	//=============사진 업로드하기================
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
	
	//==============나의 한마디 업로드하기 ====================
	@RequestMapping("/boardFeed/updateIntro.do")
	@ResponseBody
	public Map<String, String> processIntro(HttpServletRequest req, HttpSession session){
		Map<String, String> map = new HashMap<String, String>();
		System.out.println("진입");
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			//로그인 되지 않은 경우
			map.put("result", "logout");
		}else {
			//로그인이 된 경우
			MemberVO memberVO = new MemberVO();
			memberVO.setMem_num(user.getMem_num());
			memberVO.setMem_intro(req.getParameter("af_intro"));
			System.out.println(memberVO);
			feedService.updateIntro(memberVO);
			
			//이미지를 업로드 한 후 세션에 저장된 회원 정보의 이미지 이름 교체
			user.setMem_intro(memberVO.getMem_intro());
			map.put("result", "success");
		}
		return map;
	}
	
	//=============댓글달아주기=======================

	@RequestMapping("/boardFeed/list_feedcomment.do")
	@ResponseBody
	public List<FeedCommentVO> list(@RequestParam int feed_num){		
		return feedService.selectListFeedComment(feed_num);
	}
	
	@RequestMapping("/boardFeed/submit_feedcomment.do")
	@ResponseBody
	public int Commentprocess(@RequestParam String comment,
						@RequestParam int feed_num,
						@RequestParam int mem_num){
		
		if(log.isDebugEnabled()) log.debug("<<자유게시판 댓글등록>> : " + feed_num + ":" + comment);
				
		FeedCommentVO feed_comment = new FeedCommentVO();
		feed_comment.setFeedc_comment(comment);
		feed_comment.setFeed_num(feed_num);		
		feed_comment.setMem_num(mem_num);
				
		return feedService.insertFeedComment(feed_comment);		
	}
	
	//==============댓글 수정하기 =====================
	@RequestMapping("/boardFeed/update_feedcomment.do")
	@ResponseBody
	public int updateComment(@RequestParam int feedc_num,@RequestParam String update_comment) {
		if(log.isDebugEnabled()) log.debug("<<자유게시판 댓글수정>> : " + feedc_num);
		FeedCommentVO feed_comment = feedService.selectFeedComment(feedc_num);
		feed_comment.setFeedc_comment(update_comment);
		return feedService.updateFeedComment(feed_comment);
	}
	
	//===========댓글 지우기==============
	@RequestMapping("/boardFeed/delete_feedcomment.do")
	@ResponseBody
	public int deleteComment(@RequestParam int feedc_num) {
		if(log.isDebugEnabled()) log.debug("<<자유게시판 댓글 삭제>> : " + feedc_num);
		return feedService.deleteFeedComment(feedc_num);
	}
	
	
}
