package kr.spring.nutriment.service;

import org.springframework.stereotype.Service;

import kr.spring.nutriment.dao.NutrimentMapper;
import kr.spring.nutriment.vo.NutrimentVO;

@Service("nutrimentService")
public class NutrimentServiceImpl implements NutrimentService{

	NutrimentMapper nutrimentMapper;
	
	@Override
	public NutrimentVO selectNutriment(String foodName) {
		
		return nutrimentMapper.selectNutriment(foodName);
	}

	@Override
	public void insertNutriment(NutrimentVO nutrimentVO) {
		
		nutrimentMapper.insertNutriment(nutrimentVO);
	}

}
