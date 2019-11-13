package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mapper.FoodMapper;
import com.model.Food;
import com.service.DinnerTableService;
import com.service.FoodService;

@Controller
public class ShowController {
	
	@Autowired
	private DinnerTableService dinnerTableService;
	@Autowired
	private FoodService foodService;
	
	@Autowired
	private FoodMapper foodMapper;

	
	
	@RequestMapping("/showlist")
	public String showProduct(Model model) {
		model.addAttribute("products", foodMapper.findAll());
		return "home";
	}
	
	@RequestMapping("/addCar")
	public String addCar(HttpSession session,String pid) {
		List<String> thisIds;
		if(session.getAttribute("pids")!=null) {
			thisIds=(List<String>) session.getAttribute("pids");
		}else {
			thisIds=new ArrayList<>();
		}
		thisIds.add(pid);
		session.setAttribute("pids", thisIds);
		return "redirect:showlist";
	}
	
	@RequestMapping("/deleteCartItem")
	@ResponseBody
	public String deleteCartItem(HttpSession session,String pid) {
		List<String> newIds=new ArrayList<>();
		if(session.getAttribute("pids")!=null) {
			for (String string : (List<String>) session.getAttribute("pids")) {
				if(string.equals(pid)) {
					continue;
				}
				newIds.add(string);
			}
		}
		session.setAttribute("pids", newIds);
		return "success";
	}
	
	
	@RequestMapping("/okCar")
	public String okCar(HttpSession session,Model model) {
		List<String> thisIds=(List<String>) session.getAttribute("pids");
		List<Food> list=new ArrayList<>();
		if(thisIds!=null) {
			list.addAll(foodMapper.findFoodin(thisIds));
		}
		model.addAttribute("cartItems", list);
		model.addAttribute("tables", dinnerTableService.findDinnerTable(null));
		return "cartPage";
	}
	
}
