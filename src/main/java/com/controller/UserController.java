package com.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.util.BeanUtil;
import com.interceptor.zdyException;
import com.model.User;
import com.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	/**
	 * 登录
	 * @param user
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(User user,HttpSession session,Model model) {
		User loginUser = userService.login(user.getUserName(),user.getUserPass());
		if (loginUser != null) {
			session.setAttribute("USER_SESSION", loginUser);
			if(loginUser.getRoot().equals(1))
			return "main";
			else 
			return "redirect:showlist";
		}
		model.addAttribute("msg", "账号或密码错误，请重新输入！");
		return "login";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String alogin() {
		return "login";
	}

	/**
	 * 退出登录
	 * @param session
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login";
	}
	
	
	/**
	 * 注册
	 * @return
	 */
	@RequestMapping(value="/regist",method=RequestMethod.GET)
	public String regist() {
		System.out.println("--------->regist");
		return "regist";
	}
	
	@RequestMapping("/userRegist")
	public String userRegist(Model model, HttpServletRequest request,
			@Validated User user, BindingResult bindingResult,
			@RequestParam String checkImg) throws Exception {
		if (bindingResult.hasErrors()) {
			List<ObjectError> errors =bindingResult.getAllErrors();
			List<String> list = new ArrayList<>();
			for (ObjectError objectError : errors) {
				String str = new String(objectError.getDefaultMessage()
						.getBytes("ISO-8859-1"), "gbk");
				list.add(str);
			}
			model.addAttribute("errors", list);
			return "regist";
		}
		
		if (user.getUserName().isEmpty()||user.getUserPass().isEmpty()||user.getPhone().isEmpty()||user.getEmail().isEmpty()) {
			model.addAttribute("message", "校验值不通过！");
			return "regist";
			//throw new zdyException("验证码错误请重新注册");
		}
		
		// 查看验证码
		String sessionCode = (String) request.getSession().getAttribute(
				"checkcode");
//		System.out.println("adadadad" + sessionCode);
		if (!sessionCode.equalsIgnoreCase(checkImg)) {
			model.addAttribute("message", "验证码错误请重新注册");
			return "regist";
			//throw new zdyException("验证码错误请重新注册");
		}
		// 开始写入数据库
		userService.regist(user);
		//model.addAttribute("message", "注册成功请去邮箱激活");
		model.addAttribute("message", "注册成功请登录");
		return "msg";
	}

	
}
