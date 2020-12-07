package kr.spring.board.tl.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;

import kr.spring.board.tl.vo.TlBoardVO;

public interface TlBoardService {
	//트레이너 리스트를 불러올 메서드
	public List<TlBoardVO> selectTrainerList();

	//트레이너 리스트의 개수를 불러올 메서드
	public int selectTrainerRowCount();
	
	//트레이너의 상세정보를 보여줄 메서드
	public TlBoardVO selectTrainerDetail(Integer mem_num);

	//트레이너의 프로필 사진을 업로드처리를 해줄 메서드
	public void updateTrainerProfile(TlBoardVO tlboardVO);
	
	//트레이너의 간략 자기소개를 수정해줄 메서드
	public void updateIntro(TlBoardVO tlBoardVO);
	
	/*----------------트랜젝션 처리 예정---------------------------------------*/
	//시퀀스 가져올 메서드
	//public int selectMat_num();
	
	//테이블에 트레이닝 신청 내역 저장할 메서드
	public void insertMatching(Map<String, Object> map);
	/*-------------------------------------------------------*/
	
	//트레이너의 myPage에 매칭 신청 내역 표시
	public List<TlBoardVO> matchingList(Map<String,Object> map);
	
	//매칭 내역 카운트
	public int matchingCount(int mem_num);
	
	//매칭 신청할 일반회원의 정보를 가져올 메서드
	public TlBoardVO selectMemberDetail(Integer mem_num);
	
	//매칭 신청온걸 거절할 메서드
	@Delete("delete from matching where mat_from = #{mem_num}")
	public void deleteMatchingCancle(Integer mem_num);

	
}
