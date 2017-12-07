<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="ckeckout">
	<div class="container">
		<div class="ckeckout-top">
			<div class=" cart-items heading">
				<h3>주문 상세 내역</h3>
					<table class="table-board">
  						<thead class="row">
  							<tr>
			    				<th class="col-sm-2">주문 상품</th>
			    				<th class="col-sm-1">상품번호</th>
			     				<th class="col-sm-3">상품명</th>
			     				<th class="col-sm-4">Size / Color / Quantity</th>
			     				<th class="col-sm-2">가격</th>
			      			</tr>		
  						</thead>
						<c:forEach items="${requestScope.list}" var="i">
  							<tbody>
								<tr>
									<td>
										<a href="single.html">
                 	 						<img src="${pageContext.request.contextPath}/resources/upload/${i.url}" 
                 	 							class="img-responsive" height="50%" width="50%"/>
                 	 					</a>
                 	 				</td>
									<td>${i.pno}</td>
									<td>${i.name}</td>
									<td>${i.size_name} / ${i.color_name} / ${i.quantity}</td>
									<td>${i.price}</td>
						 		</tr>
						 		</tbody>
						</c:forEach>
					</table>
			</div>
		</div>
	</div>
</div>