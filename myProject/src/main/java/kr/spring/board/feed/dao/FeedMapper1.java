package kr.spring.board.feed.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.board.feed.vo.FeedVO1;

public interface FeedMapper1 {
	
	//추천게시판 클릭한 경우
	public List<FeedVO1> selectRecoList(Map<String,Object> map);
	public int selectCount(Map<String,Object> map);
	
	//추천게시판에서 글상세 들어갈 경우
	@Select("SELECT * FROM feed WHERE feed_num=#{feed_num}")
	public void selectRecoBoard(FeedVO1 feed);
	
	//팔로우 버튼 눌렀을 경우
	@Insert("INSERT INTO follower (follower_num, mem_num, follower_to) VALUES(#{follower_num}, #{mem_num}, #{follower_to})")
	public void insertFollow(FeedVO1 feed);
	
	//팔로우 취소 버튼 눌렀을 경우
	@Delete("DELETE FROM follower WHERE (mem_num=#{mem_num} AND follower_to=#{follower_to})")
	public void deleteFollow(FeedVO1 feed);
} 
