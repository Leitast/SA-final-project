package com.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.FoodMapper;
import com.model.Food;
import com.model.FoodType;
import com.service.FoodService;

@Service
public class FoodServiceImpl implements FoodService {

	@Autowired
	private FoodMapper foodMapper;
	
	@Override
	public List<Food> findFood(Map<String, Object> foodMap) {
		// TODO Auto-generated method stub
		return this.foodMapper.findFood(foodMap);
	}

	@Override
	public List<FoodType> getFoodTypeName() {
		// TODO Auto-generated method stub
		return this.foodMapper.getFoodTypeName();
	}

	@Override
	public int deleteFood(Integer fId) {
		// TODO Auto-generated method stub
		return this.foodMapper.deleteFood(fId);
	}

	@Override
	public int insertFood(Food food) {
		// TODO Auto-generated method stub
		return this.foodMapper.insertFood(food);
	}

	@Override
	public Food selectFoodById(Integer fId) {
		// TODO Auto-generated method stub
		return this.foodMapper.selectFoodById(fId);
	}

	@Override
	public int updateFood(Food food) {
		// TODO Auto-generated method stub
		return this.foodMapper.updateFood(food);
	}

}
