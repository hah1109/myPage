package kr.spring.board.free.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.board.free.service.FreeBoardService;
import kr.spring.board.free.vo.FreeBoardVO;

@Controller
public class FreeBoardController {
	
	
	private Logger log = Logger.getLogger(this.getClass());

	@Resource
	FreeBoardService FreeBoardService;

	//자바빈(VO) 초기화
	@ModelAttribute
	public FreeBoardVO initCommand() {
		return new FreeBoardVO();
	}

	//게시판 목록
	@RequestMapping("/boardFree/list.do")
	public ModelAndView process(
			@RequestParam(value="pageNum",defaultValue="1")
			int currentPage,
			@RequestParam(value="keyfield",defaultValue="")
			String keyfield,
			@RequestParam(value="keyword",defaultValue="")
			String keyword) {

		ModelAndView mav = new ModelAndView();

		return mav;
	}
	//글 등록 폼
	@RequestMapping(value="/boardFree/write.do",method=RequestMethod.GET)
	public String form() {
		return "common/result";
	}

	//글 등록 처리
	@RequestMapping(value="/boardFree/write.do",method=RequestMethod.POST)
	public String submit(@Valid FreeBoardVO freeBoardVO, BindingResult result, HttpServletRequest request, HttpSession session) {
		return "boardFreeList";
	}

	//글 상세
	@RequestMapping("/boardFree/detail.do")
	public String process(@RequestParam int free_num, Model model) {

		return "boardFreeView";
	}

	//이미지 출력
	@RequestMapping("/boardFree/imageView.do")
	public ModelAndView viewImage(@RequestParam int free_num) {

		FreeBoardVO freeBoardVO = FreeBoardService.selectBoardFree(free_num);		
		ModelAndView mav = new ModelAndView();

		return mav;
	}

	//글 수정 폼 호출
	@RequestMapping(value="/boardFree/update.do",method=RequestMethod.GET)
	public String updateForm(@RequestParam int free_num, Model model) {
		return "boardFreeUpdate";
	}
	//글 수정
	@RequestMapping(value="/boardFree/update.do", method=RequestMethod.POST)
	public String submitUpdate(@Valid FreeBoardVO freeBoardVO, BindingResult result, HttpServletRequest request, HttpSession session, Model model) {
		return "common/result";
	}

	//글 삭제
	@RequestMapping("/boardFree/delete.do")
	public String submitDelete(@RequestParam int board_num, Model model, HttpServletRequest request) {
		return "common/result";
	}
}
