package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.model.OrderDetial;
import com.model.Orders;

public interface OrderMapper {

	public List<Orders> findOrders(Orders orders);
	
	public Orders selectFoodById(int oId);
	
	
	public int add(@Param("id")String id,@Param("price")String price);
}
