package com.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.UserMapper;
import com.model.User;
import com.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public User login(String userCode, String userPass) {
		// TODO Auto-generated method stub
		return this.userMapper.login(userCode, userPass);
	}


	@Override
	public User registFindByid(String userName) {
		// TODO Auto-generated method stub
		return this.userMapper.registFindByid(userName);
	}


	@Override
	public int regist(User user) {
		// TODO Auto-generated method stub
		return this.userMapper.regist(user);
	}
	
}
