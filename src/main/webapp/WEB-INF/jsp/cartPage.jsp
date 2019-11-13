<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

<%@include file="include/header.jsp"%>
<script src="js/cart.js"></script>
<main class="cart">
    <form action = "buy">
    <table class="cart-list">

        <thead>
        <tr>
            <th class="select-and-image">
                <img src="img/noselect.png" class="select-img select-all" select="false">
                <span>全选</span>
            </th>
            <th class="item-info">
                商品信息
            </th>
            <th class="price-per">
                单价
            </th>
            <th class="item-price">
                金额
            </th>
            <th class="operation">
                操作
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${cartItems}" var="item">
            <tr select="false" stock="8" buy = "1" price-per="${item.price}" ciid="${item.fId}">
                <input type="hidden" name="ciid" value="${item.fId}">
                <td>
                    <img src="img/noselect.png" class="select-img">
                    <img src="${pageContext.request.contextPath}/images/foods/${item.img}" class="cart-item-jpg">
                </td>
                <td class="item-name">
                    <a class="cart-item-title" href="product?id=${item.fId}">${item.foodName}</a>
	                </td>
                <td>
                    <span class="cart-item-now-price">￥${item.price}</span>
                </td>
                <td>
                    <span class="cart-item-sum">￥${item.price}</span>
                </td>
                <td>
                    <a href="javascript:void(0);" class="delete-button" ciid="${item.fId}">删除</a>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>


    <div class="sum-bottom  clear">
        <img src="img/noselect.png" class="select-img select-all" select="false">
        <span>全选</span>
        <select name="tableId" style="margin-left: 50px;">
        	<option  value="">请选择桌号</option>
        	<c:forEach items="${tables}" var="t">
        		<option value="${t.dId }" >${t.tableName }</option>
        	</c:forEach>
        </select>
        <div class="pull-right">
            <span>
                已选商品
                <span class="cart-num">0</span>
                件
            </span>
            <span class="sum-text">合计</span>
            <span class="yen-big">￥</span>
            <span class="cart-sum-price cart-sum-price-big">0.00</span>
            <input type="hidden" name="totalPrice" class="cart-sum-price1">
            <button class="crate-order-big crate-order" type="submit">结 算</button>
        </div>
    </div>
    </form>

    <div class="modal" tabindex="-1" role="dialog" id="confirmModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-title">删除菜品</div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                <div class="confirm-content">确认要删除这道菜吗？</div>
                <div class="button-group">
                    <button class="yes" id="confirmDelete">确定</button>
                    <button class="no" id="cancelDelete">取消</button>
                </div>
            </div>
        </div>
    </div>
</main>

