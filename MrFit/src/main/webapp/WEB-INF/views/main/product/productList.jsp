<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="shoes">
	<div class="container">
		<div class="product-one">
		
		<c:set value="${lvo.pagingBean}" var="pb" />
		<c:set value="${lvo.list}" var="productList" />
		
			<c:forEach items="${productList}" var="pvo">
				<div class="col-md-3 product-left" >
					<div class="p-one simpleCart_shelfItem">
						<a href="${pageContext.request.contextPath}/findProductDetailByPno.do?pno=${pvo.pno}"> <img src="${pageContext.request.contextPath}/resources/upload/${pvo.imageList[0].url}" style="max-width: 100%; height: 30px;" />
							<div class="mask">
								<span>상세보기</span>
							</div>
						</a>
						<h4>${pvo.name}</h4>
						<p>
							<a class="item_add" href="#"><i></i> <span class=" item_price">${pvo.price}</span></a>
						</p>
		
					</div>
				</div>	
			</c:forEach>
		
			<div class="clearfix"></div>
		</div>
	</div>
</div>

<!--end-shoes-->
<!-- pagingBean -->
<div class="pagingInfo" align="center">
	<ul class="pagination">
		<c:if test="${pb.previousPageGroup==true}">
   			<li>
   				<a href="${pageContext.request.contextPath}/findProductByCategory.do?pageNo=${pb.startPageOfPageGroup-1}&category=${param.category}">Previous</a>
   			</li>
   			</c:if>
   				<c:forEach begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}" var="pageNum">
	   				<c:choose>
	   					<c:when test="${pageNum==pb.nowPage}">
							<li>${pageNum}&nbsp;&nbsp;</li>
						</c:when>
					<c:otherwise>
						<li>
							<a href="${pageContext.request.contextPath}/findProductByCategory.do?pageNo=${pageNum}&category=${param.category}">${pageNum}</a>
							&nbsp;&nbsp;
						</li>
					</c:otherwise>
   				</c:choose>
   			</c:forEach>
   			<c:if test="${pb.nextPageGroup==true}">
    			<li>
    				<a href="${pageContext.request.contextPath}/findProductByCategory.do?pageNo=${pb.endPageOfPageGroup+1}&category=${param.category}">Next</a>
    			</li>
    		</c:if>
	</ul>	 		
</div> 	