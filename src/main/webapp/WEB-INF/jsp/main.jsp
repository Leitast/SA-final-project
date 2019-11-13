<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无线点餐</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/top.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/left.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
	<body>
	<!-- 顶部 -->
		<!--顶部上-->
		<div id="Top_1">
			<div id="right">
				<div id="user">
					<img src="${pageContext.request.contextPath}/images/用户.png" />
					<font>您好！${USER_SESSION.userName}</font>
				</div>
				<div id="sys">
					<div class="help">
						<button type="button" class="btn btn-info">
						<img src="${pageContext.request.contextPath}/images/帮助中心.png" /><font>帮助</font>
						</button>
					</div>
					<div class="out">
						<a href="${pageContext.request.contextPath}/logout"><button type="button" class="btn btn-info"><img src="${pageContext.request.contextPath}/images/退出.png" />
						<font style="color: red;">退出</font></button></a>
					</div>
				</div>
			</div>
		</div>
		<!--顶部下-->
		<div id="Top_2">
			<div id="say"><img src="${pageContext.request.contextPath}/images/太阳.png">
				<font>今天又是充满希望的一天！加油！</font>
			</div>
			<div id="timeShow" class="timel">
			</div>
		</div>
		
		<!-- 左边 -->
		<div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" class="list-group-item active"
				   href="#collapseOne">
					系统菜单
				</a>
			</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse in">
					<div class="panel-body">
						 <a class="panel-body list-group-item" target="right" style="cursor: pointer;"
						 onclick="menuClick('${pageContext.request.contextPath}/dinner')">餐桌管理</a>
					</div>
					<div class="panel-body">
						<a class="panel-body list-group-item" target="right" style="cursor: pointer;"
						onclick="menuClick('${pageContext.request.contextPath}/foodType')">菜系管理</a>
					</div>
					<div class="panel-body">
						<a class="panel-body list-group-item" target="right" style="cursor: pointer;"
						onclick="menuClick('${pageContext.request.contextPath}/foods')">菜品管理</a>
					</div>
					<div class="panel-body">
						<a class="panel-body list-group-item" target="right" style="cursor: pointer;"
						onclick="menuClick('${pageContext.request.contextPath}/order')">餐厅订单</a>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 右边 -->
		<div id="right" style="float: right; width:1520px;margin-right: 120px;">
		<iframe id="iframe-page-content"
			src="${pageContext.request.contextPath}/dinner" width="100%" height="680px"
			frameborder="no" border="0" marginwidth="0"
			marginheight=" 0" scrolling="no" allowtransparency="yes"></iframe>
		</div>
		
		
		<script type="text/javascript">
		/* 控制右边跳转 */
		var menuClick = function(menuUrl) {
			$("#iframe-page-content").attr('src',menuUrl);
			};
			/* 当前时间  */
			$(function() {
				var t = null;
				t = setTimeout(time, 1000); //开始执行
				function time() {
					clearTimeout(t); //清除定时器
					dt = new Date();
					var y = dt.getFullYear();
					var mm = dt.getMonth() + 1;
					var d = dt.getDate();
					var weekday = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
					var day = dt.getDay();
					var h = dt.getHours();
					var m = dt.getMinutes();
					var s = dt.getSeconds();
					if(h < 10) {
						h = "0" + h;
					}
					if(m < 10) {
						m = "0" + m;
					}
					if(s < 10) {
						s = "0" + s;
					}
					document.getElementById("timeShow").innerHTML =  
					"现在的时间为："+y+"年"+mm+"月"+d+"日"+weekday[day]+""+h+":"+m+":"+s+"";
					t = setTimeout(time, 1000); //设定定时器，循环执行          
				}
			});
		</script>
	</body>
</html>