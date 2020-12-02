package kr.spring.board.feed.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.spring.board.feed.service.FeedService2;
import kr.spring.board.feed.vo.FeedVO;

//조재희
@Controller
public class FeedController2 {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	FeedService2 FeedService;
	
	//자바빈 초기화
	@ModelAttribute
	public FeedVO initCommand() {
		return new FeedVO();
	}
	
	/*게시물 목록(현재 로그인된 아이디와 클릭된 아이디의 관계 파악하여 list 목록을 호출)
	 * 	session_num과 profile_num이 같은 경우
	  	=> 나만보기, 팔로우공개, 트레이너공개, 전체공개가 보여진다
		본인이 본인 프로필 사진을 누를 경우
		session_num과 profile_num이 다르면서 following이 아닌 경우
		다른 사람의 프로필 사진을 누르면서 following이 아닌 경우 => 전체공개만 보여진다
		session_num과 profile_num이 다르면서 following이 맞는 경우
		다른 사람의 프로필 사진을 누르면서 following이 맞는 경우 => 팔로우공개, 전체공개가 보여진다
		session_num과 profile_num이 다르면서 training이 아닌 경우
		다른 사람의 프로필 사진을 누르면서 training이 아닌 경우 => 전체공개만 보여진다
		session_num과 profile_num이 다르면서 training이 맞는 경우
		다른 사람의 프로필 사진을 누르면서 training이 아닌 경우 => 팔로우공개, 트레이너공개, 전체공개가 보여진다
	 */
	
	//게시물 등록 폼
	
	//게시물 등록 처리
	
	//게시물 수정 폼
	
	//게시물 수정 처리

	//이미지 출력
	
	
	
 
}
