package kr.spring.board.tl.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.board.tl.vo.TlBoardVO;

public interface TlBoardMapper {
	//트레이너 리스트를 불러올 메서드
	@Select("select * from trainer_detail")
	public List<TlBoardVO> selectTrainerList();
	
	//트레이너 리스트의 개수를 불러올 메서드
	@Select("select count(*) from trainer_detail")
	public int selectTrainerRowCount();
	
	//트레이너의 상세정보를 보여줄 메서드
	@Select("select * from trainer_detail where mem_num=#{mem_num}")
	public TlBoardVO selectTrainerDetail(Integer mem_num);
	
	//트레이너의 프로필 사진을 업로드처리를 해줄 메서드
	@Update("update trainer_detail set mem_pic=#{mem_pic},mem_picName=#{mem_picName} where mem_num=#{mem_num}")
	public void updateTrainerProfile(TlBoardVO tlBoardVO);
	
	//트레이너의 간략 자기소개를 수정해줄 메서드
	@Update("update trainer_detail set mem_intro=#{mem_intro} where mem_num=#{mem_num}")
	public void updateIntro(TlBoardVO tlBoardVO);
	
	//회원이 지금 매칭된 트레이너가 있는지 확인하기 위한 메서드
	@Select("Select t_num FROM member_detail WHERE mem_num=#{member_num}")
	public int checkTnum(Integer member_num);
	
	//시퀀스 번호를 가저올 메서드
	@Select("select mat_seq.nextval from dual") 
	public int selectMat_num();
	
	//매칭 테이블에 정보 입력
	@Insert("insert into matching values(#{mat_num},#{member_num},#{trainer_num})")
	public void insertMatching(Map<String, Object> map);
	
	//트레이너의 myPage에 매칭 신청 내역 표시
	@Select("select * from(select a.*, rownum rnum from (select * from matching where mat_to=#{mem_num})a) where rnum>=#{start} and rnum <= #{end}")
	public List<TlBoardVO> matchingList(Map<String,Object> map);
	
	//매칭 신청 내역 카운트
	@Select("select count(*) from matching where mat_to=#{mem_num}")
	public int matchingCount(int mem_num);
}
