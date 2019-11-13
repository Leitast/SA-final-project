package com.service;

import java.util.List;

import com.model.FoodType;

public interface FoodTypeService {
	
	//查询所有菜系
	public List<FoodType> getAllFoodType(FoodType foodType);
	
	//更新菜系
	public int updateFoodType(FoodType foodType);

	//删除菜系前查询是否有菜品属于该菜系，如果有则不能删，如果没有则能删。
	public int findIfFoodType(Integer ftypeId);
	
	//删除菜系
	public int deleteFoodType(Integer ftypeId);
	
	//添加菜系
	public int insertFoodType(FoodType foodType);

}
