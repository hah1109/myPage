package kr.spring.nutriment.service;

import kr.spring.nutriment.vo.NutrimentVO;

public interface NutrimentService {
	
	public NutrimentVO selectNutriment(String foodName);
	public void insertNutriment(NutrimentVO vo);

}
