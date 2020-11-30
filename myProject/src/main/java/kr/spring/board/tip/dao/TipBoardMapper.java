package kr.spring.board.tip.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.board.free.vo.FreeBoardVO;
import kr.spring.comment.freec.vo.FreeBoardCommentReplyVO;
import kr.spring.comment.freec.vo.FreeBoardCommentVO;

public interface TipBoardMapper {

	//Mapper
	public List<FreeBoardVO> selectList(Map<String,Object> map);
		
	//Mapper
	public int selectRowCount(Map<String,Object> map);
	
	//Mapper
	public FreeBoardVO selectBoardFree(Integer free_num);
	
	@Insert("INSERT INTO board_free (free_num,free_title,free_content,free_file,free_filename,free_ip,free_type,mem_num) VALUES (board_free_seq.nextval,#{free_title},#{free_content},#{free_file},#{free_filename},#{free_ip},#{free_type},#{mem_num})")
	public void insertBoardTip(FreeBoardVO freeBoard);
	
	//Mapper
	public void updateHitBoardFree(Integer free_num);
	
	//Mapper
	public void updateBoardFree(FreeBoardVO boardFree);
			
	//Mapper
	public void updateBoardFreeExImg(FreeBoardVO boardFree);
	
	@Delete("DELETE FROM board_free WHERE free_num=#{free_num}")
	public void deleteBoardFree(Integer free_num);
	
	//댓글부분
	//Mapper
	public List<FreeBoardCommentVO> selectListFreeComment(Integer free_num);
	
	@Insert("INSERT INTO board_free_comment (freec_num, free_comment, free_num, mem_num) VALUES (freec_num_seq.nextval,#{free_comment},#{free_num},#{mem_num})")
	public int insertFreeComment(FreeBoardCommentVO free_comment);
	
	@Select("SELECT * FROM board_free_comment c JOIN member m USING(mem_num) WHERE c.freec_num = #{freec_num}")
	public FreeBoardCommentVO selectOneFreeComment(Integer freec_num);
	
	@Update("UPDATE board_free_comment SET free_comment = #{free_comment}, freec_modify_date = SYSDATE  WHERE freec_num = #{freec_num}")
	public int updateFreeComment(FreeBoardCommentVO free_comment);
	
	@Delete("DELETE FROM board_free_comment WHERE freec_num = #{freec_num}")
	public int deleteFreeComment(int freec_num);
	
	//댓글의댓글부분
	//Mapper
	public List<FreeBoardCommentReplyVO> selectReplyComment(Integer freec_num);
	
	//Mapper
	public int inserReplyComment(FreeBoardCommentReplyVO replyComment);
	
	//Mapper
	public int deleteReplyComment(int rfreec_num);
	
	

}
