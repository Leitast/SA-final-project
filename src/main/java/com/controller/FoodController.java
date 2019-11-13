package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.model.Food;
import com.model.FoodType;
import com.service.FoodService;

@Controller
public class FoodController {

	@Autowired
	private FoodService foodService;

	/**
	 * 查询菜品且分页
	 * @param page
	 * @param request
	 * @param model
	 * @param food
	 * @return
	 */
	@RequestMapping("/foods")
	public String getFood(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,
			Model model,Food food) {
		Map<String, Object> map = new HashMap<>();
		try {
			map.put("foodName", food.getFoodName());
		} catch (Exception e) {
			map.put("foodName", "");
		}
		try {
			map.put("foodTypeName", food.getFoodType().getTypeName());
		} catch (Exception e) {
			map.put("foodTypeName", "");
		}
		// 先分页
		Integer pageSize = 8;
		PageHelper.startPage(page, pageSize);
		// 查询所有
		List<Food> foods = foodService.findFood(map);
		// 保存查询数据
		request.setAttribute("foods", foods);
		// 传递分页
		PageInfo<Food> pageInfo = new PageInfo<Food>(foods);
		model.addAttribute("pageInfo", pageInfo);
		List<FoodType> foodTypes = foodService.getFoodTypeName();
		request.setAttribute("foodTypes", foodTypes);
		return "food";
	}
	
	/**
	 * 删除菜品
	 * @param food
	 * @return
	 */
	@RequestMapping(value="/restFood/{fId}",method=RequestMethod.DELETE)
	public ModelAndView deleteFood(Food food) {
		foodService.deleteFood(food.getfId());
		ModelAndView modelAndView = new ModelAndView("redirect:/foods");
		return modelAndView;
	}

	/**
	 *  创建菜品
	 * @param file
	 * @param foodName
	 * @param foodTypeId
	 * @param remark
	 * @param price
	 * @param mprice
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/createFood",method=RequestMethod.POST)
	@ResponseBody
	public String createFood(@RequestParam(value = "file", required = false)MultipartFile file,
			String foodName,Integer foodTypeId,String remark,Double price,Double mprice,
			HttpServletRequest request) throws IOException {
		int rows = 0;
		if (file != null) {
				//获取文件名
			  	String fileName = file.getOriginalFilename(); 
			    //从request中取，得到webapp路径
			    String dir = request.getServletContext().getRealPath("/");
			    //拼接文件夹
			    String saveDir = dir + "images/";
			    String path = saveDir+fileName;
			    // 转存文件到指定的路径
			    file.transferTo(new File(path));
				FoodType foodType = new FoodType();
				foodType.setFtypeId(foodTypeId);
				Food food = new Food(foodName, foodType, price, mprice, remark, fileName);
				rows=foodService.insertFood(food);
		}else {
			return "EX";
		}
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "NO";
	    }
	}
	
	/**
	 * 根据ID查询菜品
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/selectFoodById",method=RequestMethod.POST)
	@ResponseBody
	public Food selectCustById(Integer id,HttpServletRequest request) {
		Food foodById = foodService.selectFoodById(id);
		return foodById;
	}
	
	/**
	 * 更新菜品
	 * @param file
	 * @param fId
	 * @param foodName
	 * @param foodTypeId
	 * @param remark
	 * @param price
	 * @param mprice
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/updateFood",method=RequestMethod.POST)
	@ResponseBody
	public String updateFood(@RequestParam(value = "updateFile", required = false)MultipartFile file,
			Integer fId,String foodName,Integer foodTypeId,String remark,Double price,Double mprice,
			HttpServletRequest request) throws IOException {
		int rows = 0;
		String fileName = "";
		if (file != null) {
			//获取文件名
		  	fileName = file.getOriginalFilename(); 
		    //从request中取，得到webapp路径
		    String dir = request.getServletContext().getRealPath("/");
		    //拼接文件夹
		    String saveDir = dir + "images\\foods\\";
		    String path = saveDir+fileName;
		    //如果文件夹不存在就新建
		    File f = new File(saveDir);
		    if (!f.exists()) {
	            f.mkdirs();
		    }
		 // 转存文件到指定的路径
		    System.out.println("path=====>"+path);
		    System.out.println("fileName=====>"+fileName);
		    if (fileName != null && !fileName.equals("")) {
		    	 file.transferTo(new File(path));
			}
		}
		    //更新操作
			FoodType foodType = new FoodType();
			foodType.setFtypeId(foodTypeId);
			Food food = new Food(fId,foodName, foodType, price, mprice, remark, fileName);
			rows=foodService.updateFood(food);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "NO";
	    }
	}
	
}
