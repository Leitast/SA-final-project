<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜系</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<div class="panel panel-default">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="panel-body">
			<form class="form-inline"
				action="${pageContext.request.contextPath}/foodType">
				<div class="form-group">
					<label for="typeName">菜系名</label> <input type="text"
						class="form-control" id="typeName" value="${typeName}"
						name="typeName" />
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-primary">搜索</button>
			</form>
		</div>
	</div>
	<a href="#" class="btn btn-primary" data-toggle="modal"
		data-target="#newFoodType" onclick="clearFoodType()"
		style="position: relative; top: -10px;">添加</a>

	<table class="table table-hover">
		<thead>
			<tr>
				<th></th>
				<th>菜系编号</th>
				<th>菜系名称</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${allFoodType}" var="foodType">
				<tr>
					<td>  </td>
					<td>${foodType.ftypeId}</td>
					<td>${foodType.typeName}</td>
					<td>
					<a href="#" class="btn btn-primary btn-xs"
						data-toggle="modal" data-target="#updateFoodType"
						onclick="getId(${foodType.ftypeId})">更新</a> 
					<a href="#" class="btn btn-danger btn-xs" onclick="deleteFoodType(${foodType.ftypeId})"
						id="shan">删除</a></td>
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

	<!-- 添加菜系模态框 -->
	<div class="modal fade" id="newFoodType" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建菜系信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_foodtype_form"
						enctype="multipart/form-data">
						<div class="form-group">
							<label for="new_typeName" class="col-sm-2 control-label">
								菜系名称 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_typeName"
									name="typeName" placeholder="菜系名称" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="checkNull()">添加菜系</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 更新菜系模态框 -->
	<div class="modal fade" id="updateFoodType" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">更新菜系信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="update_foodtype_form"
						enctype="multipart/form-data">
						<input type="hidden" id="update_ftypeId" name="ftypeId">
						<div class="form-group">
							<label for="update_typeName" class="col-sm-2 control-label">
								菜系名称 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="update_typeName"
									name="typeName" placeholder="菜系名称" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updateFoodType()">更新菜系</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		/* 清空添加框 */
		function clearFoodType() {
			$("#new_typeName").val("");
		}
		/* 非空验证 */
		function checkNull() {
			if ($("#new_typeName").val() == ""
					|| $("#new_typeName").val() == 0) {
				alert("       '" + $(this).attr("placeholder") + "' 不能为空！\r\n");
				return false;
			} else {
				createFoodType();
				return true;
			}
		}

		/* 添加菜系  */
		function createFoodType() {
			$.post("${pageContext.request.contextPath}/createFoodType", $(
					"#new_foodtype_form").serialize(), function(data) {
				if (data == "OK") {
					alert("创建成功！");
					window.location.reload();
				} else {
					alert("创建失败！");
					window.location.reload();
				}
			});
		}
		
		/* 删除菜系 */
		function deleteFoodType(id) {
			var foodType = {id:id};
			var msg = "您真的确定要删除吗？";
				if (confirm(msg) == true) {
					$.post("${pageContext.request.contextPath}/deleteFoodType", 
							foodType, function(data) {
					 	if (data == "OK") {
							alert("删除成功！");
							window.location.reload();
						} else {
							alert("删除失败！该菜系还存在菜品！");
							window.location.reload();
							}
						});
					return false;
				} else {
					return false;
				}
		}
		/*提供ID*/
		function getId(id) {
			$("#update_ftypeId").val(id);
		}
		/* 更新菜系 */
		function updateFoodType() {
			$.post("${pageContext.request.contextPath}/updateFoodType", $(
			"#update_foodtype_form").serialize(), function(data) {
			if (data == "OK") {
				alert("更新成功！");
				window.location.reload();
			} else {
				alert("更新失败！该菜系还存在菜品！");
				window.location.reload();
			}
			});
		}
	</script>

</body>
</html>