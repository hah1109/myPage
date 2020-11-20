package kr.spring.board.free.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.spring.board.free.vo.FreeBoardVO;

@Service("freeBoardService")
public class FreeBoardServiceImpl implements FreeBoardService{

	@Override
	public List<FreeBoardVO> selectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertBoardFree(FreeBoardVO boardFree) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public FreeBoardVO selectBoardFree(Integer free_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateHitBoardFree(Integer free_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateBoardFree(FreeBoardVO boardFree) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoardFree(Integer board_num) {
		// TODO Auto-generated method stub
		
	}

}
