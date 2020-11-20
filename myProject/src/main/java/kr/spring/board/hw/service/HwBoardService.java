package kr.spring.board.hw.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.board.hw.vo.HwBoardVO;

public interface HwBoardService {
	
	public String hwList(@RequestParam String part);
	public ModelAndView hwDetailView(@RequestParam int hwboard_num);
	public String hwBoardWriteForm(@RequestParam int hwBoard_num, Model model);
	public String submitHwBoardWrite(@Valid HwBoardVO hwBoardVO, BindingResult result, HttpServletRequest request,HttpSession session);
	public String hwBoardUpdateForm(@RequestParam int hwBoard_num, Model model);
	public String submitHwBoardUpdate(@Valid HwBoardVO hwBoardVO, BindingResult result, HttpServletRequest request,HttpSession session, Model model);
	public String submitHwBoardDelete(@Valid int hwBoard_num, BindingResult result, HttpServletRequest request, Model model);
	

}
