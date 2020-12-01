package kr.spring.board.feed.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.board.feed.vo.FeedVO1;

//조재희
public interface FeedMapper2 {
	//퍼스널게시판을 클릭한 경우 
	public List<FeedVO1> myPersnolList(/**/);
	@Insert("")
	public void insertFeedBoard(FeedVO1 feedBoard);
	@Select("")
	public FeedVO1 selectFeedBoard(Integer feedBoard_num);
	//mapper
	public void updateFeedBoard(FeedVO1 feedBoard);
	public void deleteFeedBoard(Integer feedBoard_num);
} 
