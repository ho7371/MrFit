<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	function updateConfirm(){
		return confirm('해당 상품을 수정하시겠습니까?');
	}
	function deleteConfirm(){
		return confirm('해당 상품을 삭제하시겠습니까?');
	}
</script>
<div class="ckeckout">
	<div class="container">
		<div class="ckeckout-top">
			<div class=" cart-items heading">
				<h3>상품목록</h3>
				<div style="margin-top:2em; margin-bottom: 2em;">
					<a href="${pageContext.request.contextPath}/adminProductList.do">
						<button type="button" style="float:left;">전체상품목록</button>
					</a>
					<form action="${pageContext.request.contextPath}/admin/FindProductByName.do" style="float:right;">
						<input type="text" class="searchInput" name="keyword" placeholder="상품검색">
						<input type="submit" value="검색">
					</form>
				</div>
				
				<table class="table-board" style="margin-top:2em;">
					<thead>
						<tr>
							<th>사진</th><th>상품명</th><th>내용</th><th>분류</th><th colspan="2">비고</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${lvo.list }" var="item">
							<tr>
								<td><img alt="${item.name} 사진" src="${pageContext.request.contextPath}/resources/upload/${item.imageList[0].url}"  style="max-height: 60px; max-width: 60px;"></td>
								<td>${item.name}</td>
								<td>${item.content}</td>
								<td>${item.category}</td>
								<td><a href="${pageContext.request.contextPath}/admin/updateProductForm.do?pno=${item.pno}" onclick="updateConfirm()"type="button" class="btn btn-default">수정</a></td>
								<td><a href="${pageContext.request.contextPath}/admin/deleteProduct.do?pno=${item.pno}" onclick="deleteConfirm()"type="button" class="btn btn-default">삭제</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<a href="${pageContext.request.contextPath}/admin/registerProductForm.do" type="button" class="btn btn-default">상품등록</a>
			</div>
		</div>
	</div>
</div>
	

<!-- pagingBean -->
<div class="pagingInfo" align="center">
	<ul class="pagination">
		<c:if test="${pb.previousPageGroup}">	
			<li><a href="${pageContext.request.contextPath}/adminFindProductByName.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
		</c:if>
	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
		<c:choose>
			<c:when test="${pb.nowPage!=i}">
				<li><a href="${pageContext.request.contextPath}/adminFindProductByName.do?pageNo=${i}">${i}</a></li> 
			</c:when>
			<c:otherwise>
				<li class="active"><a href="#" >${i}</a></li>
			</c:otherwise>
		</c:choose>
		&nbsp;
	</c:forEach>
	<c:if test="${pb.nextPageGroup}">	
		<li>
			<a href="${pageContext.request.contextPath}/adminFindProductByName.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a>
		</li>
	</c:if>
	</ul>	 		
</div>