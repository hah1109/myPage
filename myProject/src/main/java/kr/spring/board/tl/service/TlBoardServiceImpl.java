package kr.spring.board.tl.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.board.tl.dao.TlBoardMapper;
import kr.spring.board.tl.vo.TlBoardVO;


@Service("TlBoardService")
public class TlBoardServiceImpl implements TlBoardService {
	
	@Resource
	TlBoardMapper tlmapper;

	@Override
	public List<TlBoardVO> selectTrainerList() {
		return tlmapper.selectTrainerList();
	}

	@Override
	public int selectTrainerRowCount() {
		return tlmapper.selectTrainerRowCount();
	}
	
	@Override
	public TlBoardVO selectTrainerDetail(Integer mem_num) {
		return tlmapper.selectTrainerDetail(mem_num);
	}

	@Override
	public void updateTrainerProfile(TlBoardVO tlboardVO) {
		tlmapper.updateTrainerProfile(tlboardVO);
	}

	@Override
	public void updateIntro(TlBoardVO tlBoardVO) {
		tlmapper.updateIntro(tlBoardVO);	
	}

	
	@Override
	public void insertMatching(Map<String, Object> map) {
		map.put("mat_num", tlmapper.selectMat_num()); 
		tlmapper.insertMatching(map);
	}
 
}
