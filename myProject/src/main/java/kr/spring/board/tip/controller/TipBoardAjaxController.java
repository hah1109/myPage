package kr.spring.board.tip.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.board.tip.service.TipBoardService;
import kr.spring.comment.freec.vo.FreeBoardCommentReplyVO;
import kr.spring.comment.freec.vo.FreeBoardCommentVO;

@Controller
public class TipBoardAjaxController {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	TipBoardService tipBoardService;
	
	//댓글부분
	@RequestMapping("/boardTip/list_comment.do")
	@ResponseBody
	public List<FreeBoardCommentVO> list(@RequestParam int free_num){
		return tipBoardService.selectListFreeComment(free_num);
	}
	
	@RequestMapping("/boardTip/submit_freecomment.do")
	@ResponseBody
	public int process(@RequestParam String comment,
						@RequestParam int free_num,
						@RequestParam int mem_num){
		
		if(log.isDebugEnabled()) log.debug("<<자유게시판 댓글등록>> : " + free_num + ":" + comment);
				
		FreeBoardCommentVO free_comment = new FreeBoardCommentVO();
		free_comment.setFree_comment(comment);
		free_comment.setFree_num(free_num);		
		free_comment.setMem_num(mem_num);
				
		return tipBoardService.insertFreeComment(free_comment);		
	}
	
	@RequestMapping("/boardTip/update_freecomment.do")
	@ResponseBody
	public int updateComment(@RequestParam int freec_num,@RequestParam String update_comment) {
		if(log.isDebugEnabled()) log.debug("<<자유게시판 댓글수정>> : " + freec_num);
		FreeBoardCommentVO free_comment = tipBoardService.selectOneFreeComment(freec_num);
		free_comment.setFree_comment(update_comment);		
		return tipBoardService.updateFreeComment(free_comment);
	}
	
	@RequestMapping("/boardTip/delete_freecomment.do")
	@ResponseBody
	public int deleteComment(@RequestParam int freec_num) {
		if(log.isDebugEnabled()) log.debug("<<자유게시판 댓글 삭제>> : " + freec_num);
		return tipBoardService.deleteFreeComment(freec_num);
	}
	
	//댓글의 댓글
	@RequestMapping("/boardTip/list_boardCofC.do")
	@ResponseBody
	public List<FreeBoardCommentReplyVO> selectListCofC(@RequestParam int freec_num){
		if(log.isDebugEnabled()) log.debug("<<댓글의 댓글>> : " + freec_num);
		List<FreeBoardCommentReplyVO> list = tipBoardService.selectReplyComment(freec_num);
		System.out.println(list);
		return list;
	}	
	
}
