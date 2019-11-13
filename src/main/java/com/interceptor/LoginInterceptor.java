package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.model.User;

public class LoginInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//获取请求的url
		String url = request.getRequestURI();
		//判断url中是否包含 “/login” "/regist" "/checkImg",如果包含返回true--
		// -- 即判断是否已经在访问登录页面。
		System.err.println(url);
		if (url.indexOf("/login")>=0) {
			return true;
		}
		if (url.indexOf("/regist")>=0||url.indexOf("/checkImg")>=0||url.indexOf("/userRegist")>=0) {
			return true;
		}
		//获取session
		HttpSession session = request.getSession();
		//从session中拿到对象
		User user = (User)session.getAttribute("USER_SESSION");
		//判断对象是否为空,不为null  有数据返回true
		//- 即判断是否已经登录
		if (user != null) {
			return true;
		}
		//如果为null  说明还没有登录且访问的不是登录界面
		//给出提示信息  并转发到登录界面
		request.setAttribute("msg", "您还没有登录，请先登录！");
		request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
		return false;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable Exception ex) throws Exception {
	}
	

}
