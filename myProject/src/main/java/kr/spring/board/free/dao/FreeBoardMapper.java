package kr.spring.board.free.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.board.free.vo.FreeBoardVO;

public interface FreeBoardMapper {
	
	@Select("")
	public List<FreeBoardVO> selectList(Map<String,Object> map);
	@Select("")
	public int selectRowCount(Map<String,Object> map);
	@Insert("")
	public void insertBoardFree(FreeBoardVO boardFree);
	@Select("")
	public FreeBoardVO selectBoardFree(Integer free_num);
	@Update("")
	public void updateHitBoardFree(Integer free_num);
	@Update("")
	public void updateBoardFree(FreeBoardVO boardFree);
	@Delete("")
	public void deleteBoardFree(Integer board_num);
	
}
