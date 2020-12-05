package kr.spring.board.tl.service;

import java.util.List;

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
}
