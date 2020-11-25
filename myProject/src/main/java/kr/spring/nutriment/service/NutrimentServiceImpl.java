package kr.spring.nutriment.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.nutriment.dao.NutrimentMapper;
import kr.spring.nutriment.vo.NutrimentVO;

@Service("nutrimentService")
public class NutrimentServiceImpl implements NutrimentService{

	@Resource
	NutrimentMapper nutrimentMapper;
	
	@Override
	public List<NutrimentVO> selectNutriment(Map<String,Object> map) {
		
		return nutrimentMapper.selectNutriment(map);
	}
	
	@Override
	public int count(Map<String,Object> map) {
		
		return nutrimentMapper.count(map);
	}

	@Override
	public void insertNutriment(NutrimentVO nutrimentVO) {
		
		nutrimentMapper.insertNutriment(nutrimentVO);
	}

	

}
