<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="shoes">
	<div class="container">
		
		<div class="product-one">
		
		<c:forEach  var="pvo" items="${ProductList}" varStatus="cnt">
		<c:if test="${cnt.count<5}">
			<div class="col-md-3 product-left">
				<div class="p-one simpleCart_shelfItem">
					<a href="home.do"> <img src="${pvo.imageList[0].url}" alt="" />
						<div class="mask">
							<span>Quick View</span>
						</div>
					</a>
					<h4>${pvo.name}</h4>
					<p>
						<a class="item_add" href="#"><i></i> <span class=" item_price">${pvo.price}</span></a>
					</p>

				</div>
			</div>	
		</c:if>		
		</c:forEach>
		<c:forEach  var="pvo" items="${ProductList}" varStatus="cnt">
		<c:if test="${cnt.count>4}">
			<div class="col-md-3 product-left">
				<div class="p-one simpleCart_shelfItem">
					<a href="home.do"> <img src="${pvo.imageList[0].url}" alt="" />
						<div class="mask">
							<span>Quick View</span>
						</div>
					</a>
					<h4>Aenean placerat </h4>
					<p>
						<a class="item_add" href="#"><i></i> <span class=" item_price">${pvo.price}</span></a>
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