<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>餐桌列表</title>
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
				action="${pageContext.request.contextPath}/dinner">
				<div class="form-group">
					<label for="tableName">桌名</label> <input type="text"
						class="form-control" id="tableName" value="${tableName}"
						name="tableName" />
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="form-group">
					<label for="tableStatus">状态</label> <select class="form-control"
						id="tableStatus" name="tableStatus">
						<option value="">--请选择--</option>
						<option value="1">预定</option>
						<option value="2">空闲</option>
					</select>
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-primary" onclick="select()">搜索</button>
			</form>
		</div>
	</div>
	<a href="#" class="btn btn-primary" data-toggle="modal"
		data-target="#newDinner" onclick="clearDinner()"
		style="position: relative; top: -10px;">添加</a>

	<table class="table table-hover">
		<thead>
			<tr>
				<th></th>
				<th>编号</th>
				<th>桌名</th>
				<th>状态</th>
				<th>预定时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${dinnerTables}" var="dinner">
				<tr>
					<td></td>
					<td>${dinner.dId}</td>
					<td>${dinner.tableName}</td>
					<td><c:if test="${dinner.tableStatus == 2}">空闲</c:if> <c:if
							test="${dinner.tableStatus == 1}">预定</c:if></td>
					<td><c:if test="${dinner.tableStatus == 1}">
							<fmt:formatDate value="${dinner.orderTime}"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</c:if></td>

					<td><a href="restDinner/${dinner.dId}" id="gai"
						<c:if test="${dinner.tableStatus == 1}">class="btn btn-primary btn-xs"</c:if>
						<c:if test="${dinner.tableStatus == 2}">class="btn btn-success btn-xs"</c:if>>
							<c:if test="${dinner.tableStatus == 1}">退桌</c:if> <c:if
								test="${dinner.tableStatus == 2}">预定</c:if>
					</a> <a href="restDinner/${dinner.dId}" class="btn btn-danger btn-xs"
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

	<!-- 添加餐桌模态框 -->
	<div class="modal fade" id="newDinner" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建餐桌信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_dinner_form"
						enctype="multipart/form-data">
						<div class="form-group">
							<label for="new_tableName" class="col-sm-2 control-label">
								新增桌名 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_tableName"
									name="tableName" placeholder="新增桌名" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="checkNull()">添加餐桌</button>
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
		/* 清空添加框 */
		function clearDinner() {
			$("#new_tableName").val("");
		}
		/* 非空验证 */
		function checkNull() {
			if ($("#new_tableName").val() == ""
					|| $("#new_tableName").val() == 0) {
				alert("       '" + $(this).attr("placeholder") + "' 不能为空！\r\n");
				return false;
			} else {
				createDinner();
				return true;
			}
		}

		/* 添加餐桌  */
		function createDinner() {
			$.post("${pageContext.request.contextPath}/createDinner", $(
					"#new_dinner_form").serialize(), function(data) {
				if (data == "OK") {
					alert("创建成功！");
					window.location.reload();
				} else {
					alert("创建失败！");
					window.location.reload();
				}
			});
		}
		/* 条件查询 保存条件 */
		function select() {
			var select = "&tableName=" + $("#tableName").val()
					+ "&tableStatus=" + $("#tableStatus").val();
			sessionStorage.setItem("select", select);
		}
		/* 按保存条件翻页 */
		$(function() {
			var select = sessionStorage.getItem("select");
			//判断翻页是否有条件
			if (select != null) {
				$("#pre").click(function() {
					window.location.href = "dinner?page=${pageInfo.prePage}" + select;
								})
				$("#next").click(function() {
					window.location.href = "dinner?page=${pageInfo.nextPage}" + select;
								});
				$("#first").click(function() {
					window.location.href = "dinner?page=${pageInfo.firstPage}" + select;
								});
				$("#last").click(function() {
					window.location.href = "dinner?page=${pageInfo.lastPage}" + select;
								});
			} else {
				$("#pre").click(function() {
					window.location.href = "dinner?page=${pageInfo.prePage}";
				});
				$("#next").click(function() {
					window.location.href = "dinner?page=${pageInfo.nextPage}";
				});
				$("#first").click(function() {
					window.location.href = "dinner?page=${pageInfo.firstPage}";
				});
				$("#last").click(function() {
					window.location.href = "dinner?page=${pageInfo.lastPage}";
				});
			}
		});
		/* 删除菜品 */
		$(function() {
			$("a#shan").click(function() {
				var msg = "您真的确定要删除吗？";
				if (confirm(msg) == true) {
					var href = $(this).attr("href");
					$("form#formdelete").attr("action", href).submit();
					return false;
				} else {
					return false;
				}
			});
		});
		/* 更改餐桌状态 */
		$(function() {
			$("a#gai").click(function() {
				var msg = "您真的确定吗？";
				if (confirm(msg) == true) {
					var href = $(this).attr("href");
					$("form#formupdate").attr("action", href).submit();
					return false;
				} else {
					return false;
				}
			});
		});
	</script>
</body>
</html>