package com.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.model.Food;
import com.model.FoodType;

public interface FoodMapper {
	
	//查询菜品
	public List<Food> findFood(@Param("foodMap")Map<String, Object> foodMap);
	
	//查询所有所属菜系
	public List<FoodType> getFoodTypeName();
	
	//删除菜品
	public int deleteFood(Integer fId);
	
	//添加菜品
	public int insertFood(Food food);
	
	//根据ID查询菜品
	public Food selectFoodById(Integer fId);
	
	//更新菜品
	public int updateFood(Food food);
	
	
	public List<Food> findAll();
	
	
	public List<Food> findFoodin(@Param("ids")List<String> ids);
}
