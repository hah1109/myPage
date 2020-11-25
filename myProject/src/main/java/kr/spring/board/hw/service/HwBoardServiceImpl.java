package kr.spring.board.hw.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.board.hw.dao.HwBoardMapper;
import kr.spring.board.hw.vo.HwBoardVO;

@Service("hwBoardService")
public class HwBoardServiceImpl implements HwBoardService {

	@Resource
	HwBoardMapper hwBoardMapper;

	@Override
	public List<HwBoardVO> hwSelectList(Map<String, Object> map) {
		return hwBoardMapper.selectHwList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return hwBoardMapper.selectRowCount(map);
	}

	@Override
	public void insertHwBoard(HwBoardVO hwBoardVO) {
		hwBoardMapper.insertBoard(hwBoardVO);
	}

	@Override
	public HwBoardVO selectHwBoard(Integer hwBoard_num) {
		return hwBoardMapper.selectHwBoard(hwBoard_num);
	}

	@Override
	public void updateHwBoard(HwBoardVO hwBoardVO) {
		hwBoardMapper.updateHwBoard(hwBoardVO);
	}

	@Override
	public void deleteHwBoard(Integer hwBoard_num) {
		hwBoardMapper.deleteHwBoard(hwBoard_num);
	}

}
