package com.service;

import java.util.List;

import com.model.Orders;


public interface OrderService {
	  //查询订单
	public List<Orders> findOrders(Orders orders);
	
	public Orders selectFoodById(int id);
	
	
}
