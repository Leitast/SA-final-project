package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.FoodType;
import com.service.FoodTypeService;

@Controller
public class FoodTypeController {
	
	@Autowired
	private FoodTypeService foodTypeService;
	
	/**
	 * 查询菜系
	 * @param request
	 * @param foodType
	 * @return
	 */
	@RequestMapping("/foodType")
	public String getFoodType(HttpServletRequest request,FoodType foodType) {
		List<FoodType> allFoodType = foodTypeService.getAllFoodType(foodType);
		request.setAttribute("allFoodType", allFoodType);
		return "foodType";
	}
	
	/**
	 * 添加菜系
	 * @param typeName
	 * @return
	 */
	
	@RequestMapping(value="/createFoodType",method=RequestMethod.POST)
	@ResponseBody
	public String createDinner(String typeName) {
	    FoodType foodType = new FoodType(typeName);
	    int row = foodTypeService.insertFoodType(foodType);
	    if (row > 0) {
	    	return "OK";
		}else {
			return "NO";
		}
	}
	
	/**
	 * 更新菜系
	 * @param typeName
	 * @return
	 */
	@RequestMapping(value="/updateFoodType",method=RequestMethod.POST)
	@ResponseBody
	public String updateFoodType(FoodType foodType) {
		int n = foodTypeService.findIfFoodType(foodType.getFtypeId());
		if (n>0) {
			return "NO";
		}
	    int row = foodTypeService.updateFoodType(foodType);
	    if (row > 0) {
	    	return "OK";
		}else {
			return "NO";
		}
	}
	
	
	/**
	 * 删除菜系
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/deleteFoodType",method=RequestMethod.POST)
	@ResponseBody
	public String deleteFoodType(Integer id) {
		int n = foodTypeService.findIfFoodType(id);
		if (n>0) {
			return "NO";
		}
	    int row = foodTypeService.deleteFoodType(id);
	    if (row > 0) {
	    	return "OK";
		}else {
			return "NO";
		}
	}
}
