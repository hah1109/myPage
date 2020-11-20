package kr.spring.board.hw.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.board.hw.vo.HwBoardVO;

public class HwBoardServiceImpl implements HwBoardService{

	@Override
	public String hwList(String part) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView hwDetailView(int hwboard_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String hwBoardWriteForm(int hwBoard_num, Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String submitHwBoardWrite(HwBoardVO hwBoardVO, BindingResult result, HttpServletRequest request,
			HttpSession session) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String hwBoardUpdateForm(int hwBoard_num, Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String submitHwBoardUpdate(HwBoardVO hwBoardVO, BindingResult result, HttpServletRequest request,
			HttpSession session, Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String submitHwBoardDelete(int hwBoard_num, BindingResult result, HttpServletRequest request, Model model) {
		// TODO Auto-generated method stub
		return null;
	}

}
