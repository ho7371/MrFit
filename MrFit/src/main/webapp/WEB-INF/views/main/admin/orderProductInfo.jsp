<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="ckeckout">
	<div class="container">
		<div class="ckeckout-top">
			<div class=" cart-items heading">
				<h3>주문 상세 내역</h3>
				<table class="table-board">
					<thead>
						<tr>
							<th>이미지</th><th>상품번호</th><th>상품명</th><th>사이즈</th><th>색상</th><th>수량</th><th>가격</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.list}" var="i">
							<tr>
								<td><img src="${pageContext.request.contextPath}/resources/upload/${i.url}" class="img-responsive" height="60px" width="60px"/></td>
								<td>${i.pno}</td>
								<td>${i.name}</td>
								<td>${i.size_name}</td>
								<td>${i.color_name}</td>
								<td>${i.quantity}</td>
								<td>${i.price}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			
			</div>
		</div>
	</div>
</div>
       