<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="shoes">
	<div class="container">
		<a href="${pageContext.request.contextPath}/admin/registerProductForm.do">상품등록</a> &nbsp; 

		<div class="product-one">
			<c:forEach  var="pvo" items="${ProductList}" varStatus="cnt">
				<c:if test="${cnt.count<5}">
					<div class="col-md-3 product-left">
						<div class="p-one simpleCart_shelfItem">
							<a href="${pageContext.request.contextPath}/findProductDetailByPno.do?pno=${pvo.pno}">
								<img src="${pvo.imageList[0].url}" alt="" />
							<h4>${pvo.name}</h4>
							</a>
							<p>
								<a href="${pageContext.request.contextPath}/admin/updateProductForm.do?pno=${pvo.pno}">
									<span class=" item_price">상품수정</span></a><br>
								<a href="${pageContext.request.contextPath}/admin/deleteProduct.do?pno=${pvo.pno}">
									<span class=" item_price">상품삭제</span></a>
							</p>
							
						</div>
					</div>	
				</c:if>		
			</c:forEach>
			<c:forEach  var="pvo" items="${ProductList}" varStatus="cnt">
				<c:if test="${cnt.count>4}">
					<div class="col-md-3 product-left">
						<div class="p-one simpleCart_shelfItem">
							<a href="${pageContext.request.contextPath}/findProductDetailByPno.do?pno=${pvo.pno}">
								<img src="${pvo.imageList[0].url}" alt="" />
							<h4>Aenean placerat </h4>
							</a>
							<p>
								<a href="${pageContext.request.contextPath}/updateProduct.do?pno=${pvo.pno}">
									<span class=" item_price">상품수정</span></a><br>
								<a href="${pageContext.request.contextPath}/deleteProduct.do?pno=${pvo.pno}">
									<span class=" item_price">상품삭제</span></a>
							</p>
		
						</div>
					</div>	
				</c:if>		
			</c:forEach>	
			<div class="clearfix"></div>
		</div>
	</div>
</div>

<!--end-shoes-->
<!-- pagingBean -->
<div class="pagingInfo" align="center">
	<ul class="pagination">
		<c:if test="${pb.previousPageGroup}">	
			<li><a href="home.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
		</c:if>
	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
	end="${pb.endPageOfPageGroup}">
		<c:choose>
			<c:when test="${pb.nowPage!=i}">
				<li><a href="home.do?pageNo=${i}">${i}</a></li> 
			</c:when>
			<c:otherwise>
				<li class="active"><a href="#" >${i}</a></li>
			</c:otherwise>
		</c:choose>
		&nbsp;
	</c:forEach>
	<c:if test="${pb.nextPageGroup}">	
	<li><a href="home.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
	</c:if>
	</ul>	 		
</div> 	