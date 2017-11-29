
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--start-product--> 
	<div class="product">
		<div class="container">
			<div class="product-main">
			<div class="col-md-9 p-left">
				<div class="product-one">
					<c:forEach items="${requestScope.lvo.list }" var="i">
					<c:set value="${i.imageList[0].url}" var="url"/>
						<div class="col-md-4 product-left single-left"> 
							<div class="p-one simpleCart_shelfItem">
								<a href="single.html">
										<img src="${pageContext.request.contextPath}/resources/upload/${url}" alt="" />
										<div class="mask mask1">
											<span>Quick View</span>
										</div>
									</a>
								<h4>${i.name}</h4>
								<p><a class="item_add" href="#"><i></i> <span class=" item_price">$ ${i.price}</span></a></p>
							</div>
						</div>
					</c:forEach>
					<div class="clearfix"> </div>
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	</div>
<!--end-product-->

<%-- 페이징처리 --%>
<c:set value="${lvo.pagingBean}" var="pb" />
<div class="container" align="center">
	<ul class="pager">
		<c:if test="${pb.previousPageGroup==true}">
			<li><a
				href="findProductByName.do?nowPage=${pb.startPageOfPageGroup-1}">Previous</a></li>
		</c:if>
		<c:forEach begin="${pb.startPageOfPageGroup}"
			end="${pb.endPageOfPageGroup}" var="pageNum">
			<c:choose>
				<c:when test="${pageNum==pb.nowPage}">
					<li>${pageNum}&nbsp;&nbsp;</li>
				</c:when>
				<c:otherwise>
					<li><a href="findProductByName.do?nowPage=${pageNum}">${pageNum}</a>&nbsp;&nbsp;</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pb.nextPageGroup==true}">
			<li><a
				href="findProductByName.do?nowPage=${pb.endPageOfPageGroup+1}">Next</a></li>
		</c:if>
	</ul>
</div>