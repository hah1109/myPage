package kr.spring.board.feed.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.board.feed.dao.FeedMapper2;
import kr.spring.board.feed.vo.FeedVO;
import kr.spring.member.vo.MemberVO;

//조재희
@Service("FeedService2")
public class FeedService2Impl implements FeedService2{
	
	@Resource
	FeedMapper2 feedMapper;

	@Override
	public List<FeedVO> myPersnolList(Integer mem_num) {
		return feedMapper.myPersnolList(mem_num);
	}
	
	@Override
	public int countingFeedList(Integer mem_num) {
		return feedMapper.countingFeedList(mem_num);
	}

	@Override
	public void insertFeedBoard(FeedVO feedBoard) {
		feedMapper.insertFeedBoard(feedBoard);
	}

	@Override
	public FeedVO selectFeedBoard(Integer feedBoard_num) {
		return feedMapper.selectFeedBoard(feedBoard_num);
	}

	@Override
	public void updateFeedBoard(FeedVO feedBoard) {
		feedMapper.updateFeedBoard(feedBoard);
	}

	@Override
	public void deleteFeedBoard(Integer feedBoard_num) {
		feedMapper.deleteFeedBoard(feedBoard_num);
	}

	
	//============회원정보 
	
	@Override
	public void updateProfile(MemberVO member) {
		feedMapper.updateProfile(member);
	}

	@Override
	public void updateIntro(MemberVO member) {
		feedMapper.updateIntro(member);
		
	}

	@Override
	public FeedVO selectFeedDetail(Integer mem_num) {
		
		return feedMapper.selectFeedDetail(mem_num);
	}
 
}
