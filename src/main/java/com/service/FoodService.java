package com.service;

import java.util.List;
import java.util.Map;

import com.model.Food;
import com.model.FoodType;

public interface FoodService {

	//查询菜品
	public List<Food> findFood(Map<String, Object> foodMap);
	
	//查询所有所属菜系名
	public List<FoodType> getFoodTypeName();
	
	//删除菜品
	public int deleteFood(Integer fId);
	
	//添加菜品
	public int insertFood(Food food);
	
	//根据ID查询菜品
	public Food selectFoodById(Integer fId);

	//更新菜品
	public int updateFood(Food food);
}
