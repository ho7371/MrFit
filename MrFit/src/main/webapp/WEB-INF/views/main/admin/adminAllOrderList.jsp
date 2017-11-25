<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">	
	function changeStatus(ono){
		alert(1);
		if(confirm(ono+" 를 상태변경하시겠습니까?")==true){
			alert("주문번호 : " + ono);
			location.href="${pageContext.request.contextPath}/updateOrderStatus.do?ono="+ono;
		}
	}
</script>
<h3>주문 관리</h3>
<%-- 주문 검색 --%>
<div align="right">
<form action="${pageContext.request.contextPath}/adminSearchOrder.do">
	<input type="text" name="memberId">
	<input type="submit" value="검색">
</form>
</div>
<br><hr><br>

<%-- 주문 내역 리스트 --%>
<table class="table table-bordered  table-hover boardlist">
		<thead>
		<tr class="success">
			<th class="title">주문번호</th>
			<th>주문자ID / 주문자명</th>
			<!-- <th>상품명</th>
			<th>카테고리</th>
			<th>주문색상</th>
			<th>주문사이즈</th> -->
			<th>주문시각</th>
			<th>주문상태</th>
			</tr>
		</thead>
		<c:forEach var="order" items="${lvo.list}" varStatus="i">	
			<tbody>						
				<tr>
				    <td><a href = "orderProductInfo.do?ono=${order.ono}">${order.ono}</a></td>				
					<td>${order.memberVO.id} / ${order.memberVO.name }</td>
					<%-- <c:forEach items="${order.orderProductList}" var="product">
						<td><a href = "">${product.name}</a></td>
						<td>${product.category} </td>
						<td>${product.color_name}</td>
						<td>${product.size_name}</td>
					</c:forEach> --%>
					<td>${order.ordertime}</td>
					<td>
					<c:choose>
						<c:when test="${order.status =='배송완료'}">
							${order.status}
						</c:when>
						<c:otherwise>
						 	<button onclick="changeStatus(${order.ono})">${order.status}</button>
						</c:otherwise>
					</c:choose>
					</td>
				</tr>	
			</tbody>					
		</c:forEach>
	</table>
	
<%-- 페이징 처리 --%>
<c:set value="${lvo.pagingBean}" var="pb" />
<div class="container" align="center">
	<ul class="pager">
		<c:if test="${pb.previousPageGroup==true}">
			<li><a
				href="adminAllOrderList.do?pageNo=${pb.startPageOfPageGroup-1}">Previous</a></li>
		</c:if>
		<c:forEach begin="${pb.startPageOfPageGroup}"
			end="${pb.endPageOfPageGroup}" var="pageNum">
			<c:choose>
				<c:when test="${pageNum==pb.nowPage}">
					<li>${pageNum}&nbsp;&nbsp;</li>
				</c:when>
				<c:otherwise>
					<li><a href="adminAllOrderList.do?&pageNo=${pageNum}">${pageNum}</a>&nbsp;&nbsp;</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pb.nextPageGroup==true}">
			<li><a
				href="adminAllOrderList.do?pageNo=${pb.endPageOfPageGroup+1}">Next</a></li>
		</c:if>
	</ul>
</div>