package com.model;

public class OrderDetial {
	private int odetailId;
	private Integer orderId;
	private Food foodId;
	private int foodCount;
	
	public int getOdetailId() {
		return odetailId;
	}
	public void setOdetailId(int odetailId) {
		this.odetailId = odetailId;
	}
	
	public Food getFoodId() {
		return foodId;
	}
	public void setFoodId(Food foodId) {
		this.foodId = foodId;
	}
	public int getFoodCount() {
		return foodCount;
	}
	public void setFoodCount(int foodCount) {
		this.foodCount = foodCount;
	}
	
	public OrderDetial() {
		super();
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public OrderDetial(int odetailId, Integer orderId, Food foodId, int foodCount) {
		super();
		this.odetailId = odetailId;
		this.orderId = orderId;
		this.foodId = foodId;
		this.foodCount = foodCount;
	}
	@Override
	public String toString() {
		return "OrderDetial [odetailId=" + odetailId + ", orderId=" + orderId + ", foodId=" + foodId + ", foodCount="
				+ foodCount + "]";
	}
	
	
	
	
}
