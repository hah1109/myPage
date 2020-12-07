package kr.spring.board.notice.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.board.notice.service.NoticeService;
import kr.spring.board.notice.vo.NoticeVO;

@Controller
public class NoticeAjaxController {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	NoticeService noticeService;
	
	@RequestMapping("/boardNotice/update_checkdate.do")
	@ResponseBody
	public void updateComment(@RequestParam int board_num, @RequestParam int writer_memnum) {
		if(log.isDebugEnabled()) log.debug("<<알림 확인>> : " + board_num);
		NoticeVO notice = new NoticeVO();
		notice.setBoard_num(board_num);
		notice.setWriter_memnum(writer_memnum);
		noticeService.updateNoticeCheckdate(notice);	
	}
	
	
}