package kr.spring.nutriment.vo;

public class NutrimentVO {
	
	private int foodNum; //음식 넘버(PK)
	private String foodName; //음식 이름
	private int foodWeight; //음식 중량
	private int kcal; //칼로리
	private int fat; //총지방
	private int col; //콜레스테롤
	private int na; //나트륨
	private int carb; //총 탄수량
	private int dietaryFiber; //식이섬유
	private int sugars; // 당
	private int protein; //단백질
	
	public int getFoodNum() {
		return foodNum;
	}
	public void setFoodNum(int foodNum) {
		this.foodNum = foodNum;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public int getFoodWeight() {
		return foodWeight;
	}
	public void setFoodWeight(int foodWeight) {
		this.foodWeight = foodWeight;
	}
	public int getKcal() {
		return kcal;
	}
	public void setKcal(int kcal) {
		this.kcal = kcal;
	}
	public int getFat() {
		return fat;
	}
	public void setFat(int fat) {
		this.fat = fat;
	}
	public int getCol() {
		return col;
	}
	public void setCol(int col) {
		this.col = col;
	}
	public int getNa() {
		return na;
	}
	public void setNa(int na) {
		this.na = na;
	}
	public int getCarb() {
		return carb;
	}
	public void setCarb(int carb) {
		this.carb = carb;
	}
	public int getDietaryFiber() {
		return dietaryFiber;
	}
	public void setDietaryFiber(int dietaryFiber) {
		this.dietaryFiber = dietaryFiber;
	}
	public int getSugars() {
		return sugars;
	}
	public void setSugars(int sugars) {
		this.sugars = sugars;
	}
	public int getProtein() {
		return protein;
	}
	public void setProtein(int protein) {
		this.protein = protein;
	}
	
	
	
}
