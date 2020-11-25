package kr.spring.comment.freec.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.spring.comment.freec.vo.FreeBoardCommentVO;

@Controller
public class FreeBoardCommentController {
	
	@RequestMapping(value="/boardFree/commentWrite.do",
					method=RequestMethod.POST)
	public String submit(@Valid FreeBoardCommentVO freeBoardCommentVO) {
		return "boardFreeView";
	}

}
