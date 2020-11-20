package kr.spring.board.hw.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.board.hw.vo.HwBoardVO;

public interface HwBoardMapper {

	//ListView
	@Select("")
	public List<HwBoardVO> selectList(Map<String, Object> map);

	//페이지 넘버
	@Select("")
	public int selectRowCount(Map<String, Object> map);

	//글등록
	@Insert("")
	public void insertBoard(HwBoardVO hwBoard_);

	//상세페이지
	@Select("")
	public HwBoardVO selectHwBoard(Integer hwBoard_num);

	//글 수정
	@Update("")
	public void updateHwBoard(HwBoardVO hwBoard);

	//글 삭제
	@Delete("")
	public void deleteHwBoard(Integer hwBoard_num);

}
