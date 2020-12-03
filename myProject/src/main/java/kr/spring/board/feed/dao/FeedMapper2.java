package kr.spring.board.feed.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.board.feed.vo.FeedVO;
import kr.spring.member.vo.MemberVO;

//조재희
public interface FeedMapper2 {
	@Select("SELECT * FROM feed where mem_num=#{mem_num}")
	public List<FeedVO> myPersnolList(Integer mem_num);
	//내가 쓴 글의 갯수 구하기
	@Select("select count(*) from feed where mem_num=#{mem_num}")
	public int countingFeedList(Integer mem_num);

	//피드등록
		@Insert("Insert into feed (feed_num, feed_type, feed_content, feed_file, feed_filename, feed_ip, mem_num, mem_id, feed_auth, feed_reg_date)"
				+" values(feed_num.nextval, #{feed_type}, #{feed_content}, #{feed_file}, #{feed_filename}, #{feed_ip}, #{mem_num}, #{mem_id}, #{feed_auth}, SYSDATE)")
		public void insertFeedBoard(FeedVO feedBoard);
	//피드선택(상세글)
	@Select("SELECT * FROM feed b JOIN member m USING(mem_num) WHERE feed_num = #{feed_num}")
	public FeedVO selectFeedBoard(Integer feedBoard_num);
	//mapper 피드 수정
	public void updateFeedBoard(FeedVO feedBoard);
	@Delete("DELETE FROM feed WHERE feed_num=#{feed_num}")
	public void deleteFeedBoard(Integer feedBoard_num);
	
	//==============================================
	//팔로우하기
	/*@Insert("Insert into follower (follower_num, mem_num,follower_to)"+
	" values(follower_number.nextval, #{mem_num}, #{follower_to}")
	public void insertFollow(FeedVO feedVO);
	//팔로우끊기
	@Delete("delete from follower where follower_to = #{follower_to}")
	public void deleteFollow();*/
	//=========================회원정보======
	@Update("update spmember_detail set mem_pic=#{mem_pic} where mem_num=#{mem_num}")
	public void updateProfile(MemberVO member);
	@Update("update spmember_detail set mem_intro=#{mem_intro} where mem_num=#{mem_num}")
	public void updateIntro(MemberVO member);
	
	
} 
