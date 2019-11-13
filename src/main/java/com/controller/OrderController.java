package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.OrderMapper;
import com.model.Food;
import com.model.OrderDetial;
import com.model.Orders;
import com.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	
	@Autowired
	private OrderMapper om;
	
	/**
	 * 查询订单
	 * @param page
	 * @param request
	 * @param model
	 * @param dinnerTable
	 * @return
	 */
	@RequestMapping("/order")
	public String getDinner(@RequestParam(required = true, defaultValue = "1") Integer page, HttpServletRequest request,
			Model model, Orders order) {
		// 先分页
		Integer pageSize = 6;
		PageHelper.startPage(page, pageSize);
		// 查询所有
		List<Orders> orders = orderService.findOrders(order);
		// 保存查询数据
		for (Orders order1 : orders) {
			List<OrderDetial> orderDetials = order1.getOrderDetails();
			/*double sum = 0;
			for (int i = 0; i < orderDetials.size(); i++) {
				sum += orderDetials.get(i).getFoodId().getPrice() * orderDetials.get(i).getFoodCount();
			}
			order1.setTotalPrice(sum);*/
		}
		request.setAttribute("ordersList", orders);
		// 传递分页
		PageInfo<Orders> pageInfo = new PageInfo<Orders>(orders);
		model.addAttribute("pageInfo", pageInfo);
		return "order";
	}

	
	/**
	 * 根据ID查询订单
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/selectOrderById",method=RequestMethod.POST)
	@ResponseBody
	public Orders selectCustById(Integer id,HttpServletRequest request) {
		Orders orders = orderService.selectFoodById(id);
		List<OrderDetial> orderDetials = orders.getOrderDetails();
		double sum = 0;
		for (int i = 0; i < orderDetials.size(); i++) {
			sum += orderDetials.get(i).getFoodId().getPrice() * orderDetials.get(i).getFoodCount();
		}
		orders.setTotalPrice(sum);
		System.out.println("===========>" + orders.toString());
		return orders;
	}
	
	
	@RequestMapping("/buy")
	public String addOrder(String tableId,String totalPrice) {
		om.add(tableId, totalPrice);
		return "redirect:showlist";
	}
	
	
}
