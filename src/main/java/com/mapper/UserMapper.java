package com.mapper;


import org.apache.ibatis.annotations.Param;

import com.model.User;

public interface UserMapper {

	//登录
	public User login(@Param ("userName")String userName,
					  @Param ("userPass")String userPass);
	
	public int regist(@Param ("user") User user);
	
	public User registFindByid(@Param ("userName") String userName);
}
