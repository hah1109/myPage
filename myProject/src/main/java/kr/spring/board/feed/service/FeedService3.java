package kr.spring.board.feed.service;

import java.util.List;
import java.util.Map;

import kr.spring.board.feed.vo.FeedVO;

public interface FeedService3 {
	
	
	//전체 피드 리스트 받아오기
	public List<FeedVO> selectFeedList(Map<String,Object> map);
	//전체 피드의 수 카운트
	public int selectFeedCount(Map<String,Object> map);
	
	//(트레이너)내회원의 피드 리스트 받아오기
	public List<FeedVO> selectMyMemberFeedList(Map<String,Object> map);
	//전체 피드의 수 카운트
	public int selectMyMemberFeedCount(Map<String,Object> map);
	
	
}
