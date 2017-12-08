<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
$(document).ready(function() {
	$("#selectProductType").change(function() {	
		location.href="${pageContext.request.contextPath}/productListByHit.do";
	});//selectProductType click
});//ready
</script>
<!--banner-starts-->
<div class="bnr" id="home">
	<div id="top" class="callbacks_container">
		<ul class="rslides" id="slider4">
			<li>
				<div class="banner-1"></div>
			</li>
			<li>
				<div class="banner-2"></div>
			</li>
			<li>
				<div class="banner-3"></div>
			</li>
			<li>
				<div class="banner-4"></div>
			</li>
		</ul>
	</div>
	<div class="clearfix"></div>
</div>
<!--banner-ends-->
<!--Slider-Starts-Here-->
<script src="${pageContext.request.contextPath}/resources/js/responsiveslides.min.js"></script>
<script>
	// You can also use "$(window).load(function() {"
	$(function() {
		// Slideshow 4
		$("#slider4").responsiveSlides({
			auto : true,
			pager : true,
			nav : false,
			speed : 500,
			namespace : "callbacks",
			before : function() {
				$('.events').append("<li>before event fired.</li>");
			},
			after : function() {
				$('.events').append("<li>after event fired.</li>");
			}
		});

	});
</script>
<!--End-slider-script-->

<!--start-banner-bottom-->
<div class="banner-bottom"style="background-color: white; height: 300;" >
	<div class="container" style="height: 400;">
		<div class="banner-bottom-top"  >
		
			<c:forEach items="${top2List}" var="topItem">
				<div class="col-md-6 banner-bottom-left" >
					<div class="p-two2 ">
						<div class="bnr-left">
							<h1>${topItem.name}</h1>
							<p>미스터핏 최고의 인기 상품입니다.</p>
							<div class="b-btn">
								<a href="${pageContext.request.contextPath}/findProductDetailByPno.do?pno=${topItem.pno}">SHOP NOW</a>
							</div>
						</div>
						<div class="bnr-right" >
							<a href="${pageContext.request.contextPath}/findProductDetailByPno.do?pno=${topItem.pno}">
								<img src="${pageContext.request.contextPath}/resources/upload/${topItem.imageList[0].url}" alt="" style="min-width: 100%; min-height: 80%"/>
							</a>
						</div>						
					</div>
				</div>
			</c:forEach>			
		</div>
	</div>
</div>
<!--end-banner-bottom-->
		<c:set value="${lvo.pagingBean}" var="pb" />
		<c:set value="${lvo.list}" var="productList" />
<!--start-shoes-->
<div class="shoes">
	<div class="container">
		<select id="selectProductType">
			<option selected="selected">신상품순</option>
			<option>조회순</option>
		</select>
		<div class="product-one">		
			<c:forEach items="${productList}" var="pvo">
				 <div class="col-md-3 product-left">
					<div class="p-two simpleCart_shelfItem">
						<a href="${pageContext.request.contextPath}/findProductDetailByPno.do?pno=${pvo.pno}"> 
						<img src="${pageContext.request.contextPath}/resources/upload/${pvo.imageList[0].url}" alt="" style="min-width: 100%; min-height: 80%;"/>
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
   				<a href="home.do?pageNo=${pb.startPageOfPageGroup-1}">Previous</a>
   			</li>
   			</c:if>
   				<c:forEach begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}" var="pageNum">
	   				<c:choose>
	   					<c:when test="${pageNum==pb.nowPage}">
							<li><a>${pageNum}&nbsp;&nbsp;</a></li>
						</c:when>
					<c:otherwise>
						<li>
							<a href="home.do?pageNo=${pageNum}">${pageNum}</a>
							&nbsp;&nbsp;
						</li>
					</c:otherwise>
   				</c:choose>
   			</c:forEach>
   			<c:if test="${pb.nextPageGroup==true}">
    			<li>
    				<a href="home.do?pageNo=${pb.endPageOfPageGroup+1}">Next</a>
    			</li>
    		</c:if>
	</ul>	 		
</div> 	















