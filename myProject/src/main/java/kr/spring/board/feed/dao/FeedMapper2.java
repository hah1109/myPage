package kr.spring.board.feed.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.board.feed.vo.FeedVO;

//조재희
public interface FeedMapper2 {
	//퍼스널게시판을 클릭한 경우 
	public List<FeedVO> myPersnolList(/**/);
	@Insert("")
	public void insertFeedBoard(FeedVO feedBoard);
	@Select("")
	public FeedVO selectFeedBoard(Integer feedBoard_num);
	//mapper
	public void updateFeedBoard(FeedVO feedBoard);
	public void deleteFeedBoard(Integer feedBoard_num);
} 
