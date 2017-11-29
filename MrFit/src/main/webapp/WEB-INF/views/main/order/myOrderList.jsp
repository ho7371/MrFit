<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>

<!--start-ckeckout-->
<div class="ckeckout">
	<div class="container">
		<div class="ckeckout-top">
			<div class=" cart-items heading">
				<h3>내 주문 내역</h3>
				
				<table class="table-board">
					<thead>
						<tr>
							<th>주문번호</th><th>총가격</th><th>배송지</th><th>배송상태</th><th>주문시간</th><th>상태변경</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="order">
							<tr>
								<td><a href="${pageContext.request.contextPath}/myOrderPrductList.do?ono=${order.ono}&id=<sec:authentication property="principal.id"/>">${order.ono}</a></td>
								<td>${order.totalprice}</td>
								<td>${order.destination}</td>
								<td>${order.status}</td>
								<td>${order.ordertime}</td>
								<td>
									<c:if test="${order.status=='배송완료'}">
										<form action="${pageContext.request.contextPath}/myOrderStatusChange.do">
											<input type="hidden" name="ono" value="${order.ono}">
											<input type="hidden" name="totalprice" value="${order.totalprice }">
											<input type="hidden" name="id" value="<sec:authentication property="principal.id"/>">
											<input type="submit" value="상태변경">
										</form>
			 						 </c:if>
								</td>
							</tr>
						</c:forEach> 
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!--end-ckeckout-->



