package kr.spring.nutriment.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.nutriment.vo.NutrimentVO;

public interface NutrimentMapper {

	public List<NutrimentVO> selectNutriment(Map<String,Object> map);
	
	@Select("SELECT COUNT(*) FROM nutriment WHERE food_name like '%'||#{foodName}||'%'")
	public int count(Map<String,Object> map);	

	@Insert("INSERT INTO nutriment (food_num,food_name,food_g,food_kcal,food_fat,food_col,food_na,food_carb,food_df,food_sugars,food_protein)"+ 
		"VALUES (nutriment_seq.nextval,#{foodName}, #{foodWeight},#{kcal},#{fat},#{col},#{na},#{carb},#{dietaryFiber},#{sugars},#{protein})")
	public void insertNutriment(NutrimentVO nutrimentVO);
		
}
