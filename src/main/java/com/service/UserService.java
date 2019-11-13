package com.service;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.model.User;

public interface UserService {

	//登录
	public User login(String userCode,String userPass);
	
	public int regist(User user);
	
	public User registFindByid(String userName);

	
}
