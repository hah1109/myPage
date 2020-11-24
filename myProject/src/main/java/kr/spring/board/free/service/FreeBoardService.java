package kr.spring.board.free.service;

import java.util.List;
import java.util.Map;

import kr.spring.board.free.vo.FreeBoardVO;

public interface FreeBoardService {
	
	
	public List<FreeBoardVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertBoardFree(FreeBoardVO freeBoardVO);
	public FreeBoardVO selectBoardFree(Integer free_num);
	public void updateHitBoardFree(Integer free_num);
	public void updateBoardFree(FreeBoardVO boardFree);
	public void deleteBoardFree(Integer free_num);

}
