package kr.spring.board.sysqna.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.board.sysqna.service.SysQnABoardService;
import kr.spring.comment.sysqnac.vo.SysQnABoardCommentVO;

@Controller
public class SysQnAAjaxController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	SysQnABoardService sysQnABoardService;
	
	//댓글 리스트 불러오기
	@RequestMapping("/boardSysqna/list_comment.do")
	@ResponseBody
	public List<SysQnABoardCommentVO> list(@RequestParam int sq_num){		
		return sysQnABoardService.selectListSysqnaComment(sq_num);
	}
	
	//댓글 입력
	@RequestMapping("/boardSysqna/submit_sqcomment.do")
	@ResponseBody
	public int process(@RequestParam String comment,
					   @RequestParam int sq_num,
					   @RequestParam int mem_num){

		if(log.isDebugEnabled()) log.debug("<<자유게시판 댓글등록>> : " + sq_num + ":" + comment);
				
		SysQnABoardCommentVO sq_comment = new SysQnABoardCommentVO();
		sq_comment.setSq_comment(comment);
		sq_comment.setSq_num(sq_num);		
		sq_comment.setMem_num(mem_num);
				
		return sysQnABoardService.insertSysqnaComment(sq_comment);		
	}
	
	@RequestMapping("/boardSysqna/update_sqcomment.do")
	@ResponseBody
	public int updateComment(@RequestParam int sqc_num,@RequestParam String update_comment) {
		if(log.isDebugEnabled()) log.debug("<<자유게시판 댓글수정>> : " + sqc_num);
		SysQnABoardCommentVO sq_comment = sysQnABoardService.selectOneSysqnaComment(sqc_num);
		sq_comment.setSq_comment(update_comment);
		return sysQnABoardService.updateSysqnaComment(sq_comment);
	}
	
	@RequestMapping("/boardSysqna/delete_sqcomment.do")
	@ResponseBody
	public int deleteComment(@RequestParam int sqc_num) {
		if(log.isDebugEnabled()) log.debug("<<자유게시판 댓글 삭제>> : " + sqc_num);
		return sysQnABoardService.deleteSysqnaComment(sqc_num);
	}
	
}
