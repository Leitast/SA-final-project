package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.OrderMapper;
import com.model.Orders;
import com.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	@Override
	public List<Orders> findOrders(Orders orders) {
		// TODO Auto-generated method stub
		return this.orderMapper.findOrders(orders);
	}

	@Override
	public Orders selectFoodById(int id) {
		// TODO Auto-generated method stub
	 return this.orderMapper.selectFoodById(id);
	}

	

}
