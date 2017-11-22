<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<h2>my Order List</h2>


<!--start-ckeckout-->
<div class="ckeckout">
	<div class="container">
		<div class="ckeckout-top">
			<div class=" cart-items heading">
				<h3>내 주문 내역</h3>
				<div class="in-check">
					<ul class="unit">
						<li><span>번호</span></li>
						<li><span>제목</span></li>
						<li><span>내용</span></li>
						<li><span>날짜</span></li>
						<div class="clearfix"></div>
					</ul>
					<ul class="cart-header">
						<li><span>1</span></li>
						<li><span>1번 쪽지 제목</span></li>
						<li><span>포인트가 지급되었습니다!</span></li>
						<li><span>2017/11/19</span></li>
						<div class="clearfix"></div>
					</ul>
					<ul class="cart-header">
						<li><span>2</span></li>
						<li><span>2번 쪽지 제목</span></li>
						<li><span>포인트가 차감되었습니다!</span></li>
						<li><span>2017/11/19</span></li>
						<div class="clearfix"></div>
					</ul>
					<ul class="cart-header">
						<li><span>3</span></li>
						<li><span>3번 쪽지 제목</span></li>
						<li><span>크리스마스 이벤트!!</span></li>
						<li><span>2017/11/19</span></li>
						<div class="clearfix"></div>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!--end-ckeckout-->


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

