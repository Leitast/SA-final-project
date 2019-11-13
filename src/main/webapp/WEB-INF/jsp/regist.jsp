<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>注册</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function checkForm() {
		//校验用户名不能为空
		var username = document.getElementById("userName").value;
		var password = document.getElementById("passWord").value;
		var rePassword = document.getElementById("rePassword").value;
		if (username == null || username == '') {
			alert("用户名不能为空");
			return false;
		}
		if (password == null || password == '') {
			alert("密码不能为空");
			return false;
		}
		if (rePassword == null || username == '' || rePassword != Password) {
			alert("确认密码不能为空，或者两次密码不一样");
			return false;
		}
		return true;
	}
	function checkUsername() {
		var username = document.getElementById("userName").value;
		var xmlHttp = creatXMLHttpreauest();
		xmlHttp.open("GET",
				"${pageContext.request.contextPath}/registFindByid?userName="
						+ username, true);
		xmlHttp.send(null);
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
				document.getElementById("span1").innerHTML = xmlHttp.responseText;
			}
		}
	}
	function creatXMLHttpreauest() {
		try {
			return new XMLHttpRequest();
		} catch (e) {
			try {
				return ActiveXObject("Msxml2.XMLHttp");
			} catch (e) {
				try {
					return ActiveXObject("micoresoftxml2.XMLHttp");
				} catch (e) {
					throw e;
				}
			}
		}
	}
	function change(){
		var img = document.getElementById("checkImg");
		img.src="${pageContext.request.contextPath}/checkImg?"+new Date();
	}
</script>
</head>
<body style="background: ../images/beijing.jpg">
	<div class="container register">
		<div class="span24">
			<div class="wrap">
				<div class="main clearfix">
					<div class="title">
						<strong>会员注册</strong><strong style="color: red;">${message}</strong>
					</div>
					<c:if test="${errors!=null}">
						<c:forEach items="${errors}" var="error">
							${error}
						</c:forEach>
					</c:if>
					<form id="registerForm" method="post"
						action="${pageContext.request.contextPath}/userRegist"
						ondblclick="return checkForm()">
						<table>
							<tbody>
								<tr>
									<th><span class="requiredField">*</span>用户名:</th>
									<td><input type="text" id="userName" name="userName"
										class="text" maxlength="20" onblur="checkUsername()">
											<span id="span1" style="color:green;"></span></td>
								</tr>
								<tr>
									<th><span class="requiredField">*</span>密&nbsp;&nbsp;码:</th>
									<td><input type="password" id="userPass" name="userPass"
										class="text" maxlength="20" autocomplete="off"></td>
								</tr>
								<tr>
									<th><span class="requiredField">*</span>确认密码:</th>
									<td><input type="password" id="rePassword"
										name="rePassword" class="text" maxlength="20"
										autocomplete="off"></td>
								</tr>
								<tr>
									<th><span class="requiredField">*</span>E-mail:</th>
									<td><input type="text" id="email" name="email"
										class="text" maxlength="200">
										<span style="color:red;"><s:fielderror fieldName="email"></s:fielderror></span>
									</td>
								</tr>
							
								<tr>
									<th>电话:</th>
									<td><input type="text" name="phone" class="text"></td>
								</tr>

								
								<tr>
									<th><span class="requiredField">*</span>验证码:</th>
									<td>
										<span class="fieldSet"> 
										<input type="text" id="captcha" name="checkImg" class="text captcha" maxlength="4" autocomplete="off">
										<img id="checkImg" class="captchaImage" src="${pageContext.request.contextPath}/checkImg"
													title="点击更换验证码" onclick="change()">
										</span>
									</td>
								</tr>
								
								<tr>
									<th>&nbsp;</th>
									<td><input type="submit" class="submit" style="background-color: red" value="注册"></td>
								</tr>
						
					</form>
				</div>
			</div>
		</div>
	</div>

	<div id="_my97DP"
		style="position: absolute; top: -1970px; left: -1970px;">
		
	</div>
</body>
</html>