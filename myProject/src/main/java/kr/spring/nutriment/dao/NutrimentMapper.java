package kr.spring.nutriment.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.nutriment.vo.NutrimentVO;

public interface NutrimentMapper {

	@Select("SELECT * FROM nutriment WHERE food_name=#{foodName}")
	public NutrimentVO selectNutriment(String foodName);

	@Insert("INSERT INTO nutriment (food_num,food_name,food_g,food_kcal,food_fat,food_col,food_na,food_carb,food_df,food_sugars,food_protein)"+ 
		"VALUES (nutriment_seq.nextval,#{foodName}, #{foodWeight},#{kcal},#{fat},#{col},#{na},#{carb},#{dietaryFiber},#{sugars},#{protein})")
	public void insertNutriment(NutrimentVO nutrimentVO);
		
}
