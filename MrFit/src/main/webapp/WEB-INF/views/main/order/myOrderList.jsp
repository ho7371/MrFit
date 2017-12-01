<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>

<c:set value="${lvo.pagingBean}" var="pb" />
<c:set value="${order.memberVO.id}" var="id"/>

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
						<c:forEach items="${lvo.list}" var="order">
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
				
				<%-- 페이징 처리 --%>
				<div class="container" align="center">
				  		<ul class="pager">
				   			<c:if test="${pb.previousPageGroup==true}">
				   			<li><a href="myOrderList.do?id=${id}&pageNo=${pb.startPageOfPageGroup-1}">Previous</a></li>
				   			</c:if>
				   			<c:forEach begin="${pb.startPageOfPageGroup}" 
				   			end="${pb.endPageOfPageGroup}" var="pageNum">
				   			<c:choose>
				   				<c:when test="${pageNum==pb.nowPage}">
								<li>${pageNum}&nbsp;&nbsp;</li>
								</c:when>
								<c:otherwise>
								<li><a href="myOrderList.do?id=${id}&pageNo=${pageNum}">${pageNum}</a>&nbsp;&nbsp;</li>
								</c:otherwise>
				   			</c:choose>
				   			</c:forEach>
				   			<c:if test="${pb.nextPageGroup==true}">
				    		<li><a href="myOrderList.do?id=${id}&pageNo=${pb.endPageOfPageGroup+1}">Next</a></li>
				    		</c:if>
				 		 </ul>
					</div>
				
			</div>
		</div>
	</div>
</div>
<!--end-ckeckout-->



