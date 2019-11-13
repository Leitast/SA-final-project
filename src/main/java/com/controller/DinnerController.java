package com.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.model.DinnerTable;
import com.service.DinnerTableService;

@Controller
public class DinnerController {

	@Autowired
	private DinnerTableService dinnerTableService;

	/**
	 * 查询餐桌
	 * @param page
	 * @param request
	 * @param model
	 * @param dinnerTable
	 * @return
	 */
	@RequestMapping("/dinner")
	public String getDinner(@RequestParam(required = true, defaultValue = "1") Integer page, HttpServletRequest request,
			Model model, DinnerTable dinnerTable) {
		// 先分页
		Integer pageSize = 6;
		PageHelper.startPage(page, pageSize);
		// 查询所有
		List<DinnerTable> dinnerTables = dinnerTableService.findDinnerTable(dinnerTable);
		// 保存查询数据
		request.setAttribute("dinnerTables", dinnerTables);
		// 传递分页
		PageInfo<DinnerTable> pageInfo = new PageInfo<DinnerTable>(dinnerTables);
		model.addAttribute("pageInfo", pageInfo);
		return "dinner";
	}
	
	/**
	 * 删除餐桌
	 * @param dinnerTable
	 * @return
	 */
	@RequestMapping(value="/restDinner/{dId}",method=RequestMethod.DELETE)
	public ModelAndView deleteFood(DinnerTable dinnerTable) {
		dinnerTableService.deleteDinnerTable(dinnerTable.getdId());
		ModelAndView modelAndView = new ModelAndView("redirect:/dinner");
		return modelAndView;
	}
	
	/**
	 * 更改餐桌状态
	 * @param dinnerTable
	 * @return
	 */
	@RequestMapping(value="/restDinner/{dId}",method=RequestMethod.PUT)
	public ModelAndView updateFood(DinnerTable dinnerTable) {
		DinnerTable dinnerByID = dinnerTableService.getDinnerByID(dinnerTable.getdId());
		//当前时间
	    Date date = new Date();
	    Timestamp timeStamp = new Timestamp(date.getTime());
	    dinnerTable.setOrderTime(timeStamp);
		dinnerTable.setTableStatus(dinnerByID.getTableStatus());
		dinnerTableService.updateDinnerTable(dinnerTable);
		ModelAndView modelAndView = new ModelAndView("redirect:/dinner");
		return modelAndView;
	}
	
	/**
	 * 添加餐桌
	 * @param tableName
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/createDinner",method=RequestMethod.POST)
	@ResponseBody
	public String createDinner(String tableName) {
		//当前时间
	    Date date = new Date();
	    Timestamp timeStamp = new Timestamp(date.getTime());
	    
	    DinnerTable dinnerTable = new DinnerTable(tableName, timeStamp);
	    int row = dinnerTableService.insertDinnerTable(dinnerTable);
	    if (row > 0) {
	    	return "OK";
		}else {
			return "NO";
		}
	}

}
