package kr.spring.board.free.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.board.free.vo.FreeBoardVO;

public interface FreeBoardMapper {
	
	//Mapper
	public List<FreeBoardVO> selectList(Map<String,Object> map);
	
	//Mapper
	public int selectRowCount(Map<String,Object> map);
	
	@Insert("INSERT INTO board_free (free_num,free_title,free_content,free_file,free_filename,free_ip,free_type,mem_num) VALUES (board_free_seq.nextval,#{free_title},#{free_content},#{free_file},#{free_filename},#{free_ip},#{free_type},#{mem_num})")
	public void insertBoardFree(FreeBoardVO freeBoardVO);
	
	@Select("SELECT * FROM board_free b JOIN member m USING(mem_num) WHERE free_num = #{free_num}")
	public FreeBoardVO selectBoardFree(Integer free_num);
	
	@Update("UPDATE board_free SET free_hit=free_hit+1 WHERE free_num=#{free_num}")
	public void updateHitBoardFree(Integer free_num);

	//Mapper
	public void updateBoardFree(FreeBoardVO boardFree);
	
	@Delete("DELETE FROM board_free WHERE free_num=#{free_num}")
	public void deleteBoardFree(Integer free_num);
	
}
