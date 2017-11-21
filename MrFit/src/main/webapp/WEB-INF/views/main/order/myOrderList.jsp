<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<h2>my Order List</h2>

<c:forEach items="${list}" var="order">
	<c:choose>
		<c:when test="${order.status!='배송완료'}">
			<h3>배송완료되지 않은 주문</h3>
			<a href="${pageContext.request.contextPath}/myOrderPrductList.do?ono=${order.ono}">
			${order.ono} 
			${order.totalprice} 
			${order.destination} 
			${order.ordertime} 
			${order.status}</a>
			<br><hr>
	 	</c:when>
	 	<c:otherwise>
	 		<h3>배송완료 된 주문</h3>
	 		<a href="${pageContext.request.contextPath}/myOrderPrductList.do?ono=${order.ono}">
	 		${order.ono} 
			${order.totalprice} 
			${order.destination} 
			${order.ordertime} 
			${order.status} 
			</a>
			<br><hr>
	 	</c:otherwise>
	</c:choose>
</c:forEach>

