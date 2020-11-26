package kr.spring.board.hw.service;

import java.util.List;
import java.util.Map;

import kr.spring.board.hw.vo.HwBoardVO;

public interface HwBoardService {
	
	public List<HwBoardVO> hwSelectList(Map<String, Object> map);
	public int selectHwRowCount(Map<String, Object> map);
	public void insertHwBoard(HwBoardVO hwBoardVO);
	public HwBoardVO selectHwBoard(Integer hwBoard_num);
	public void updateHwBoard(HwBoardVO hwBoardVO);
	public void deleteHwBoard(Integer hwBoard_num);;
	

}
