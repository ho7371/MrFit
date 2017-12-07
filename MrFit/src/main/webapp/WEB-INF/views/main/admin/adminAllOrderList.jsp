<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">	
	function changeStatus(ono){
		if(confirm(ono+" 를 상태변경하시겠습니까?")==true){
			location.href="${pageContext.request.contextPath}/updateOrderStatus.do?ono="+ono;
		}
	}
	$(document).ready(function(){
		$("#searchTypeForm").submit(function(){
			if($("#searchTypeForm select").val()=="orderNo"){
				var orderNumber = $("#searchTypeForm [name=searchKeyword]").val();
				if(isNaN(orderNumber)){
					alert('주문번호를 숫자로 입력해주세요.');
					return false;
				}else{
					return true;
				}
			}
		});
	});
</script>

<div class="ckeckout">
	<div class="container">
		<div class="ckeckout-top">
			<div class=" cart-items heading">
				<h3 style="margin-bottom: 1em!important;">주문 관리</h3>
				<%-- 주문 검색 --%>
				<%-- <a href="${pageContext.request.contextPath}/adminAllOrderList.do">
					<button>전체 주문 보기</button>
				</a> --%>
				<a href="${pageContext.request.contextPath}/deletePendingDepositOrders.do"><button>7일이상 입금대기 삭제</button></a>
				<div style="float: right;">
					<form action="${pageContext.request.contextPath}/adminSearchOrder.do" id="searchTypeForm">
						<select name="searchType" class="searchInput">
							<option value="memberId">회원아이디</option>
							<option value="orderNo">주문번호</option>
						</select>
						<input type="text" class="searchInput" name="searchKeyword">
						<input type="submit" value="검색">
					</form>
				</div>
				
				<%-- 주문 내역 리스트 --%>
				<table class="table-board">
						<thead>
						<tr class="success">
							<th class="title">주문번호</th>
							<th>주문자ID / 주문자명</th>
							<th>주문시각</th>
							<th>주문상태</th>
							</tr>
						</thead>
						<c:forEach var="order" items="${lvo.list}" varStatus="i">	
							<tbody>						
								<tr>
								    <td><a href = "${pageContext.request.contextPath}/orderProductInfo.do?ono=${order.ono}">${order.ono}</a></td>				
									<td>${order.memberVO.id} / ${order.memberVO.name }</td>
									<td>${order.ordertime}</td>
									<td>
									<c:choose>
										<c:when test="${order.status =='배송완료'}">
											${order.status}
										</c:when>
										<c:when test="${order.status =='구매확정'}">
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
										<li><a>${pageNum}</a></li>
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
				</div>
			</div>
		</div>
	</div>
