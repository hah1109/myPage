package kr.spring.board.feed.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import kr.spring.board.feed.vo.FeedVO;

//홍아현
public interface FeedMapper3 {
	
	//SQL문 전부 .xml에 기재
	
	//전체 피드 리스트 받아오기(팔로워의 팔로워 공개 이상 글 + 내가 쓴 글 중 팔로워 공개 이상 글)
	public List<FeedVO> selectFeedList(Map<String,Object> map);
	//전체 피드의 수 카운트
	public int selectFeedCount(Map<String,Object> map);

	//(트레이너)내회원의 피드 리스트 받아오기
	public List<FeedVO> selectMyMemberFeedList(Map<String,Object> map);
	//전체 피드의 수 카운트
	public int selectMyMemberFeedCount(Map<String,Object> map);
	
}
