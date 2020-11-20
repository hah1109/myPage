package kr.spring.board.hw.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.board.hw.vo.HwBoardVO;

@Controller
public class HwBoardController {
	
	//list 호출
	@RequestMapping(value="/hwboard/boardlist.do", method=RequestMethod.GET)
	public String hwList(@RequestParam String part) {
		// 트레이닝 화면을 호출해주는 부분
		//조건에 따라 view에 노출되는 동영상, 메인 글씨 변경(조건은 부위를 조건으로)
		//검색버튼이 눌렸을 경우에도 여기로 호출
		return "";
	}

	//글 상세페이지 호출
	@RequestMapping(value="/hwboard/hwdetail.do", method=RequestMethod.GET)
	public ModelAndView hwDetailView(@RequestParam int hwboard_num) {

		return new ModelAndView();
	}

	//관리자만 등록할 수 있는 버튼이눌렸을 경우 글 등록 폼 호출
	@RequestMapping(value="/hwboard/hwboardwrite.do", method=RequestMethod.GET)
	public String hwBoardWriteForm(@RequestParam int hwBoard_num, Model model) {

		return "";
	}
	
	//등록 폼에서 글 등록(Submit)
	@RequestMapping(value="/hwboard/hwboardupdate.do", method=RequestMethod.POST)
	public String submitHwBoardWrite(@Valid HwBoardVO hwBoardVO, BindingResult result, HttpServletRequest request,HttpSession session) {

		return "";//hwlist 호출
	}

	//관리자만 수행 할 수있는 게시판 수정(이건 상세페이지의버튼)
	@RequestMapping(value="/hwboard/hwboardupdate.do", method=RequestMethod.GET)
	public String hwBoardUpdateForm(@RequestParam int hwBoard_num, Model model) {

		return "";
	}

	//수정 페이지에서 submit했을 때
	@RequestMapping(value="/hwboard/hwboardupdate.do", method=RequestMethod.POST)
	public String submitHwBoardUpdate(@Valid HwBoardVO hwBoardVO, BindingResult result, HttpServletRequest request,HttpSession session, Model model) {

		return "";//hwlist 호출
	}

	//삭제
	@RequestMapping(value="/hwboard/hwboardupdate.do", method=RequestMethod.POST)
	public String submitHwBoardDelete(@Valid int hwBoard_num, BindingResult result, HttpServletRequest request, Model model) {

		return "";//hwlist 호출
	}
}
