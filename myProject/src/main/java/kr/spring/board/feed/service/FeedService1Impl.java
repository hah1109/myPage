package kr.spring.board.feed.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.board.feed.dao.FeedMapper1;
import kr.spring.board.feed.vo.FeedVO1;

@Service("FeedService1")
public class FeedService1Impl implements FeedService1{

	@Resource
	FeedMapper1 feedMapper;

	@Override
	public List<FeedVO1> selectRecoList(Map<String, Object> map) {
		return feedMapper.selectRecoList(map);
	}

	@Override
	public int selectCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void selectRecoBoard(FeedVO1 feed) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertFollow(FeedVO1 feed) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFollow(FeedVO1 feed) {
		// TODO Auto-generated method stub
		
	}
	
	
 
}
