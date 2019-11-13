<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>



<main class="index">
            <div class="products">
                <div class="title-bar">
                    <i class="color-mark"></i>
                    <span class="category-title">特色菜单</span>
                </div>
                <div class="product-items">
                    <c:forEach items="${products}" var="p" varStatus="vs">
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/images/foods/${p.img}">
                            <div class="item-title">${p.foodName}</div>
                            <div class="item-price">￥${p.price}</div>
                            <div class="item-price1"><a href="${pageContext.request.contextPath}/addCar?pid=${ p.fId}" title="加入购物车" >➕</a></div>
                        </div>
                    </c:forEach>
                </div>
            </div>
</main>