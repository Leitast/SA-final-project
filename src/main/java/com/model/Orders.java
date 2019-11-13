package com.model;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class Orders {
	
	private int oId;
	private DinnerTable tableId;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date orderTime;
	private double totalPrice;
	private int orderStatus;
	private List<OrderDetial> orderDetails;
	public int getoId() {
		return oId;
	}
	public void setoId(int oId) {
		this.oId = oId;
	}
	public DinnerTable getTableId() {
		return tableId;
	}
	public void setTableId(DinnerTable tableId) {
		this.tableId = tableId;
	}
	public Date getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}
	public List<OrderDetial> getOrderDetails() {
		return orderDetails;
	}
	public void setOrderDetails(List<OrderDetial> orderDetails) {
		this.orderDetails = orderDetails;
	}
	public Orders(int oId, DinnerTable tableId, Date orderTime, double totalPrice, int orderStatus,
			List<OrderDetial> orderDetails) {
		super();
		this.oId = oId;
		this.tableId = tableId;
		this.orderTime = orderTime;
		this.totalPrice = totalPrice;
		this.orderStatus = orderStatus;
		this.orderDetails = orderDetails;
	}
	public Orders() {
		super();
	}
	public Orders(DinnerTable tableId, Date orderTime, double totalPrice, int orderStatus,
			List<OrderDetial> orderDetails) {
		super();
		this.tableId = tableId;
		this.orderTime = orderTime;
		this.totalPrice = totalPrice;
		this.orderStatus = orderStatus;
		this.orderDetails = orderDetails;
	}
	@Override
	public String toString() {
		return "Orders [oId=" + oId + ", tableId=" + tableId + ", orderTime=" + orderTime + ", totalPrice=" + totalPrice
				+ ", orderStatus=" + orderStatus + ", orderDetails=" + orderDetails + "]";
	}   
	
	

}
