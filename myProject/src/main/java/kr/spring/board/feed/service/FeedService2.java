package kr.spring.board.feed.service;

import java.util.List;

import kr.spring.board.feed.vo.FeedVO;

//조재희
public interface FeedService2 {
	public List<FeedVO> myPersnolList(Integer mem_num);
	public int countingFeedList(Integer mem_num);
	public void insertFeedBoard(FeedVO feedBoard);
	public FeedVO selectFeedBoard(Integer feedBoard_num);
	public void updateFeedBoard(FeedVO feedBoard);
	public void deleteFeedBoard(Integer feedBoard_num);

	//public void insertFollow(FeedVO feedVO);
	//public void deleteFollow();
}
