<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单列表</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-body">
			<form id="foodform" class="form-inline"
				action="${pageContext.request.contextPath}/order">

				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="form-group">
					<label for="orderStatus">状态</label> <select class="form-control"
						id="orderStatus" name="orderStatus">
						<option value="0">--请选择--</option>
						<option value="1">已付款</option>
						<option value="2">待付款</option>
						<option value="3">未完成</option>
					</select>
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-primary" onclick="select()">搜索</button>
			</form>
		</div>
	</div>

	<table class="table table-hover">
		<thead>
			<tr>
				<th></th>
				<th>编号</th>
				<th>桌号</th>
				<th>状态</th>
				<th>总价</th>
				<th>预定时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ordersList}" var="orders">
				<tr>
					<td></td>
					<td>${orders.oId}</td>
					<td>${orders.tableId.tableName}</td>
					<td><c:if test="${orders.orderStatus == 1}">已付款</c:if> <c:if
							test="${orders.orderStatus == 2}">待付款</c:if> <c:if
							test="${orders.orderStatus == 3}">未完成</c:if></td>
					<td>${orders.totalPrice}</td>
					<td><fmt:formatDate value="${orders.orderTime}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>

					<td><a href="#" onclick="selectById(${orders.oId})"
						class="btn btn-success btn-xs" data-toggle="modal"
						data-target="#updateOrder"> 详情 </a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<form id="formdelete" action="" method="POST">
		<input type="hidden" name="_method" value="DELETE">
	</form>
	<form id="formupdate" action="" method="POST">
		<input type="hidden" name="_method" value="PUT">
	</form>


	<!-- 更新菜品模态框 -->
	<div class="modal fade" id="updateOrder" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">订单详情</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="update_order_form"
						enctype="multipart/form-data">
						<input type="hidden" id="update_oId" name="oId">
						<div class="form-group">
							<label for="update_tableName" class="col-sm-2 control-label">
								餐桌 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="update_tableName"
									name="tableName" />
							</div>
						</div>
				


						<div class="form-group">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>编号</th>
										<th>菜名</th>
										<th>所属菜系</th>
										<th>价格</th>
										<th>会员价格</th>
										<th>数量</th>
									</tr>
								</thead>
								<tbody id="orderT">
									
								</tbody>
							</table>
						</div>

						<div class="form-group">
							<label for="update_totalPrice" class="col-sm-2 control-label">
								总价格</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="update_totalPrice"
									name="totalPrice" />
							</div>
						</div>
						<div class="form-group">
							<label for="update_orderStatus" class="col-sm-2 control-label">
								状态</label>
							<div class="col-sm-10">
							<input type="text" class="form-control" id="update_orderStatus"
									name="orderStatus" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 分页 -->
	<div class="col-md-12 text-right">
		<ul class="pagination">
			<li><a href="#" id="first">首页</a></li>
			<c:if test="${pageInfo.hasPreviousPage}">
				<li><a href="#" id="pre">上一页</a></li>
			</c:if>
			<c:if test="${!pageInfo.hasPreviousPage}">
				<li><a href="#"
					style="cursor: pointer; pointer-events: none; color: #CDCDB4">上一页</a></li>
			</c:if>
			<c:if test="${pageInfo.hasNextPage}">
				<li><a href="#" id="next">下一页</a></li>
			</c:if>
			<c:if test="${!pageInfo.hasNextPage}">
				<li><a href="#"
					style="cursor: pointer; pointer-events: none; color: #CDCDB4">下一页</a></li>
			</c:if>
			<li><a href="#" id="last">末页</a></li>
		</ul>
	</div>

	<script type="text/javascript">
	
		
		/*根据ID查询订单*/
		function selectById(id) {
			var order = {id:id};
			$.ajax({
				 type: "POST",
				 url: "${pageContext.request.contextPath}/selectOrderById",
				 data: order,
				 success:function(data){
					 //先置空
					 	$("#orderT").html("");
					 	$("#update_oId").val(data.oId);
					 	$("#update_tableName").val(data.tableId.tableName);
					 	$("#update_totalPrice").val(data.totalPrice);
					 	if(data.orderStatus == 1){
					 		$("#update_orderStatus").val("已付款");
					 	}
					 	if(data.orderStatus == 2){
					 		$("#update_orderStatus").val("待付款");
					 	}
					 	if(data.orderStatus == 3){
					 		$("#update_orderStatus").val("未完成");
					 	}
					 
					 	var text;
					 	var list = data.orderDetails;
					 	//动态加行
					 	for (var i = 0; i != list.length; ++i) {
					        // 创建一个行元素
					        var row = document.createElement('tr');
					 
					        // 创建td单元格
					        var fId = document.createElement('td');
					        var foodName = document.createElement('td');
					        var typeName = document.createElement('td');
					        var price = document.createElement('td');
					        var mprice = document.createElement('td');
					        var foodCount = document.createElement('td');
					       
					 
					        // 给创建的td单元格填充数据
					        fId.innerHTML = list[i].foodId.fId;
					        foodName.innerHTML = list[i].foodId.foodName;
					        typeName.innerHTML = list[i].foodId.foodType.typeName;
					        price.innerHTML = list[i].foodId.price;
					        mprice.innerHTML = list[i].foodId.mprice;
					        foodCount.innerHTML = list[i].foodCount;
					 
					        // 将新建的td加入新建的tr行
					        row.appendChild(fId);
					        row.appendChild(foodName);
					        row.appendChild(typeName);
					        row.appendChild(price);
					        row.appendChild(mprice);
					        row.appendChild(foodCount);
					 
					        // 将这行加到tbody
					        // 获取tbody
					        var tbody = document.getElementById("orderT");
					        tbody.appendChild(row);
					 	}
				 }
			});
		}

		/* 条件查询 保存条件 */
		function select() {
			var select = "&orderStatus=" + $("#orderStatus").val();
			sessionStorage.setItem("select", select);
		}
		/* 按保存条件翻页 */
		$(function() {
			var select = sessionStorage.getItem("select");
			//判断翻页是否有条件
			if (select != null) {
				$("#pre").click(function() {
					window.location.href = "order?page=${pageInfo.prePage}" + select;
								})
				$("#next").click(function() {
					window.location.href = "order?page=${pageInfo.nextPage}" + select;
								});
				$("#first").click(function() {
					window.location.href = "order?page=${pageInfo.firstPage}" + select;
								});
				$("#last").click(function() {
					window.location.href = "order?page=${pageInfo.lastPage}" + select;
								});
			} else {
				$("#pre").click(function() {
					window.location.href = "order?page=${pageInfo.prePage}";
				});
				$("#next").click(function() {
					window.location.href = "order?page=${pageInfo.nextPage}";
				});
				$("#first").click(function() {
					window.location.href = "order?page=${pageInfo.firstPage}";
				});
				$("#last").click(function() {
					window.location.href = "order?page=${pageInfo.lastPage}";
				});
			}
		});
	</script>
</body>
</html>