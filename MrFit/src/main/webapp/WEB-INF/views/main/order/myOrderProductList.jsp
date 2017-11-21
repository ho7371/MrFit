<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>

<h2>my OrderProduct List</h2>

<c:forEach items="${list}" var="orderProduct">
주문번호 :	${orderProduct.ono}<br>
상품이름 :	${orderProduct.name}<br>
상품가격 : 	${orderProduct.price}<br>
상품종류 : 	${orderProduct.category}<br>
상품색상 : 	${orderProduct.color_name}<br>
상품사이즈 :	${orderProduct.size_name}<br>
주문수량 :	${orderProduct.quantity}<br>
이미지 : 	${orderProduct.url}<br>
	<br><hr>
</c:forEach>









