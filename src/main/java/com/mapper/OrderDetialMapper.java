package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.model.OrderDetial;
import com.model.Orders;

public interface OrderDetialMapper {
	public List<OrderDetial> findOrderDetialByoId(Integer orderId);
}
