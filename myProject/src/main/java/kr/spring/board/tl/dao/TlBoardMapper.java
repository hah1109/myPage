package kr.spring.board.tl.dao;

import java.util.List;

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
 
}
