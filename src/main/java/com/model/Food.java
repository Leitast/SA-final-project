package com.model;


public class Food {
	
	private Integer fId;
	private String foodName;
	private FoodType foodType;
	private double price;
	private double mprice;
	private String remark;
	private String img;
	
	public Integer getfId() {
		return fId;
	}
	public void setfId(Integer fId) {
		this.fId = fId;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public FoodType getFoodType() {
		return foodType;
	}
	public void setFoodType(FoodType foodType) {
		this.foodType = foodType;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getMprice() {
		return mprice;
	}
	public void setMprice(double mprice) {
		this.mprice = mprice;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	public Food(String foodName, FoodType foodType, double price, double mprice, String remark, String img) {
		super();
		this.foodName = foodName;
		this.foodType = foodType;
		this.price = price;
		this.mprice = mprice;
		this.remark = remark;
		this.img = img;
	}
	public Food(Integer fId, String foodName, FoodType foodType, double price, double mprice, String remark, String img) {
		super();
		this.fId = fId;
		this.foodName = foodName;
		this.foodType = foodType;
		this.price = price;
		this.mprice = mprice;
		this.remark = remark;
		this.img = img;
	
	}
	public Food() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return String.format(
				"Food [fId=%s, foodName=%s, foodType=%s, price=%s, mprice=%s, remark=%s, img=%s]", fId,
				foodName, foodType, price, mprice, remark, img);
	}
	
	

}
