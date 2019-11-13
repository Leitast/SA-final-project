<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜品</title>
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
				action="${pageContext.request.contextPath}/foods">
				<div class="form-group">
					<label for="foodName">菜名</label> <input type="text"
						class="form-control" id="foodName" value="${foodName}"
						name="foodName" />
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="form-group">
					<label for="foodType">所属菜系</label> <select class="form-control"
						id="foodType" name="foodType.typeName">
						<option value="">--请选择--</option>
						<c:forEach items="${foodTypes}" var="foodType">
							<option value="${foodType.typeName}">${foodType.typeName}</option>
						</c:forEach>
					</select>
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-primary" onclick="select()">搜索</button>
			</form>
		</div>
	</div>
	<a href="#" class="btn btn-primary" data-toggle="modal"
		data-target="#newFood" onclick="clearFood()"
		style="position: relative; top: -10px;">添加</a>

	<table class="table table-hover">
		<thead>
			<tr>
				<th></th>
				<th>编号</th>
				<th>菜名</th>
				<th>所属菜系</th>
				<th>价格</th>
				<th>会员价格</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${foods}" var="food">
				<tr>
					<td>  </td>
					<td>${food.fId}</td>
					<td>${food.foodName}</td>
					<td>${food.foodType.typeName}</td>
					<td>${food.price}</td>
					<td>${food.mprice}</td>
					<td><a href="#" class="btn btn-primary btn-xs"
						onclick="selectById(${food.fId})" data-toggle="modal"
						data-target="#updateFood">更新</a> <a
						href="restFood/${food.fId}" class="btn btn-danger btn-xs"
						id="shan">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<form id="formdelete" action="" method="POST">
		<input type="hidden" name="_method" value="DELETE">
	</form>

	<!-- 添加菜品模态框 -->
	<div class="modal fade" id="newFood" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建菜品信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_food_form" enctype="multipart/form-data">
						<div class="form-group">
							<label for="new_foodName" class="col-sm-2 control-label">
								菜名 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_foodName"
									name="foodName" placeholder="菜名" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_foodType"
								style="float: left; padding: 7px 15px 0 55px;">菜系</label>
							<div class="col-sm-10">
								<select class="form-control" id="new_foodType"
									name="foodTypeId" placeholder="菜系">
									<option value="">--请选择--</option>
									<c:forEach items="${foodTypes}" var="foodType">
										<option value="${foodType.ftypeId}">${foodType.typeName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="new_price" class="col-sm-2 control-label"> 价格
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_price"
									name="price" placeholder="价格" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_mprice" class="col-sm-2 control-label">
								会员价格 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_mprice"
									name="mprice" placeholder="会员价格" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_remark" class="col-sm-2 control-label">
								简介</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="3" id="new_remark"
									name="remark" placeholder="简介"></textarea>
							</div>
						</div>
					    <div class="form-group">
							<label for="new_img" class="col-sm-2 control-label"> 菜品图片</label>
							<div class="col-sm-10">
								<input type="file" class="form-control" id="file" name="file" />
							</div>
						</div> 
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="checkNull()">创建菜品</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 更新菜品模态框 -->
	<div class="modal fade" id="updateFood" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">更新菜品信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="update_food_form" enctype="multipart/form-data">
						<input type="hidden" id="update_fId" name="fId">
						<div class="form-group">
							<label for="update_foodName" class="col-sm-2 control-label">
								菜名 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="update_foodName"
									name="foodName" />
							</div>
						</div>
						<div class="form-group">
							<label for="update_foodType"
								style="float: left; padding: 7px 15px 0 55px;">菜系</label>
							<div class="col-sm-10">
								<select class="form-control" id="update_foodType"
									name="foodTypeId">
									<option value="">--请选择--</option>
									<c:forEach items="${foodTypes}" var="foodType">
										<option value="${foodType.ftypeId}">${foodType.typeName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="update_price" class="col-sm-2 control-label"> 价格
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="update_price"
									name="price" />
							</div>
						</div>
						<div class="form-group">
							<label for="update_mprice" class="col-sm-2 control-label">
								会员价格 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="update_mprice"
									name="mprice" />
							</div>
						</div>
						<div class="form-group">
							<label for="update_remark" class="col-sm-2 control-label">
								简介</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="3" id="update_remark"
									name="remark"></textarea>
							</div>
						</div>
						 <div class="form-group">
						 	<div class="col-sm-10">
						 		<img alt="美味" src="" id="update_img" style="height: 90px;width: 120px;margin-left: 100px;">
						 	</div>
						 </div>
						 <div class="form-group">
							<label for="updateFile" class="col-sm-2 control-label">菜品图片</label>
							<div class="col-sm-10">
								<input type="file" class="form-control" id="updateFile" name="updateFile" />
							</div>
						</div>
					</form> 
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateFood()">更新菜品</button>
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
	function clearFood() {
		$("#new_foodName").val("");
		$("#new_foodType").val("")
		$("#new_price").val("")
		$("#new_mprice").val("")
		$("#new_remark").val("");
		$("#file").val("");
	}
	/* 非空验证 */
	function checkNull() 
	{  
		 var num=0;  
	     var str="";
	     var inputs = $("#new_foodName,#new_foodType,#new_price,#new_mprice,#new_remark");
	     inputs.each(function(n){  
	          if($(this).val()=="" || $(this).val()==0)  
	          {  
	               num++;  
	               str+="       '"+$(this).attr("placeholder")+"' 不能为空！\r\n"; 
	          }
	     });
	     if($("#file").val()=="")  
         {    num++;
              str+="       '菜品图片' 不能为空！\r\n"; 
         }
	     if(num>0)  
	     {  
	    	  alert(str);
	          return false;  
	     }  
	     else  
	     {  
	    	  createFood();
	          return true;  
	     }  
	}
	
	/* 创建菜品  */
	function createFood() {
		var formdata = new FormData($("#new_food_form")[0]);
		$.ajax({
				url:"${pageContext.request.contextPath}/createFood",
				type:'POST',
				data:formdata,
				scriptCharset:'UTF-8',
				cache : false,
				processData : false,  //必须false才会避开jQuery对 formdata 的默认处理   
			    contentType : false,  //必须false才会自动加上正确的Content-Type 
				success:function(data) {
					if (data == "OK") {
						alert("创建成功！");
						window.location.reload();
					}else if (data == "OK") {
						alert("创建失败！图片为空或不存在!");
						window.location.reload();
					} 
					else {
						alert("创建失败！");
						window.location.reload();
					}
				}
		});
	}


	/*根据ID查询菜品*/
	function selectById(id) {
		var food = {id:id};
		$.ajax({
			 type: "POST",
			 url: "${pageContext.request.contextPath}/selectFoodById",
			 data: food,
			 success:function(data){
				 	$("#update_fId").val(data.fId);
				 	$("#update_foodName").val(data.foodName);
 				 	$("#update_foodType").val(data.foodType.ftypeId); 
				 	$("#update_price").val(data.price);
				 	$("#update_mprice").val(data.mprice);
				 	$("#update_remark").val(data.remark);
				 	$("#update_img").attr("src","${pageContext.request.contextPath}/images/foods/"+data.img);
			 }
		});
	}
	
	/* 更新菜品 */
	function updateFood() {
		var formdata = new FormData($("#update_food_form")[0]);
		$.ajax({
				url:"${pageContext.request.contextPath}/updateFood",
				type:'POST',
				data:formdata,
				scriptCharset:'UTF-8',
				cache : false,
				processData : false,  //必须false才会避开jQuery对 formdata 的默认处理   
			    contentType : false,  //必须false才会自动加上正确的Content-Type 
				success:function(data) {
			if (data == "OK") {
				alert("更新成功！");
				window.location.reload();
			}else if (data == "OK") {
				alert("更新失败！图片为空或不存在!");
				window.location.reload();
			} 
			else {
				alert("更新失败！");
				window.location.reload();
			}
				}
		});
	}
	
	/* 条件查询 保存条件 */
	function select() {
		var select = "&foodName="+$("#foodName").val()+
				 "&foodType="+$("#foodType").val();
		sessionStorage.setItem("select",select);
	}
	/* 按保存条件翻页 */
	$(function() {
		var select = sessionStorage.getItem("select");
		//判断翻页是否有条件
		if (select != null) {
			$("#pre").click(function () {
				window.location.href="foods?page=${pageInfo.prePage}"+select;
			})
			$("#next").click(function () {
				window.location.href="foods?page=${pageInfo.nextPage}"+select;
			});
			$("#first").click(function () {
				window.location.href="foods?page=${pageInfo.firstPage}"+select;
			});
			$("#last").click(function () {
				window.location.href="foods?page=${pageInfo.lastPage}"+select;
			});
		}else {
			$("#pre").click(function () {
				window.location.href="foods?page=${pageInfo.prePage}";
			});
			$("#next").click(function () {
				window.location.href="foods?page=${pageInfo.nextPage}";
			});
			$("#first").click(function () {
				window.location.href="foods?page=${pageInfo.firstPage}";
			});
			$("#last").click(function () {
				window.location.href="foods?page=${pageInfo.lastPage}";
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
</script>
</body>
</html>