<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>点餐后台登录系统</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<div class="login">
	<div class="login-top">
		<h1 style="color: deepskyblue;">欢迎登录</h1>
		<form action="${pageContext.request.contextPath}/login" method="post">
			<input type="text" placeholder="请输入账号" name="userName">
			<input type="password" placeholder="请输入密码" name="userPass">
		<div class="forgot">
	    	<a href="#" style="color: deepskyblue;">忘记密码？</a>
	    	<input type="submit" value="登录" >
	    </div>
	    </form>
	    
	</div>
	<div class="login-bottom">
		<h3>新用户 &nbsp;<a href="${pageContext.request.contextPath}/regist">注册</a></h3>
	</div>
</div>	

</body>
</html>