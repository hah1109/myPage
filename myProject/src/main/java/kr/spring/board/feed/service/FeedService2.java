package kr.spring.board.feed.service;

import java.util.List;

import kr.spring.board.feed.vo.FeedVO1;

//조재희
public interface FeedService2 {
	public List<FeedVO1> myPersnolList(/**/);
	public void insertFeedBoard(FeedVO1 feedBoard);
	public FeedVO1 selectFeedBoard(Integer feedBoard_num);
	public void updateFeedBoard(FeedVO1 feedBoard);
	public void deleteFeedBoard(Integer feedBoard_num);
}
