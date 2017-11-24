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
						<li><span>주문번호</span></li>
						<li><span>총가격</span></li>
						<li><span>배송지</span></li>
						<li><span>배송상태</span></li>
						<li><span>주문시간</span></li>
						<li><span>상태 변경</span></li>
						<div class="clearfix"></div>
					</ul>
					<c:forEach items="${list}" var="order">
					<ul class="cart-header">
						<li><span><a href="${pageContext.request.contextPath}/myOrderPrductList.do?ono=${order.ono}">${order.ono}</a></span></li>
						<li><span>${order.totalprice}</span></li>
						<li><span>${order.destination}</span></li>
						<li><span>${order.status}</span></li>
						<li><span>${order.ordertime}</span></li>
						 <c:if test="${order.status=='배송완료'}">
							<form action="${pageContext.request.contextPath}/myOrderStatusChange.do">
								<input type="hidden" name="ono" value="${order.ono}">
								<input type="hidden" name="id" value="<sec:authentication property="principal.id"/>">
								<input type="submit" value="상태변경">
							</form>
 						 </c:if>
						<div class="clearfix"></div>
					</ul>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
<!--end-ckeckout-->



