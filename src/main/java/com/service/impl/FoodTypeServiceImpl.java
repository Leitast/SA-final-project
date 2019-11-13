package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.FoodTypeMapper;
import com.model.FoodType;
import com.service.FoodTypeService;

@Service
public class FoodTypeServiceImpl implements FoodTypeService {

	@Autowired
	private FoodTypeMapper foodTypeMapper;

	@Override
	public List<FoodType> getAllFoodType(FoodType foodType) {
		// TODO Auto-generated method stub
		return this.foodTypeMapper.getAllFoodType(foodType);
	}

	@Override
	public int updateFoodType(FoodType foodType) {
		// TODO Auto-generated method stub
		return this.foodTypeMapper.updateFoodType(foodType);
	}

	@Override
	public int findIfFoodType(Integer ftypeId) {
		// TODO Auto-generated method stub
		return this.foodTypeMapper.findIfFoodType(ftypeId);
	}

	@Override
	public int deleteFoodType(Integer ftypeId) {
		// TODO Auto-generated method stub
		return this.foodTypeMapper.deleteFoodType(ftypeId);
	}

	@Override
	public int insertFoodType(FoodType foodType) {
		// TODO Auto-generated method stub
		return this.foodTypeMapper.insertFoodType(foodType);
	}


}
