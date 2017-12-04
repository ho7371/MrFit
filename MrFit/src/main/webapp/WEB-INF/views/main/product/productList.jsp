<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<div class="banner-bottom">
	<div class="container">
		<div class="banner-bottom-top">
			<div class="col-md-6 banner-bottom-left">
				<div class="bnr-one">
					<div class="bnr-left">
						<h1>
							<a href="single.html">Duis dictum volutpat</a>
						</h1>
						<p>Nulla tempus facilisis purus at.</p>
						<div class="b-btn">
							<a href="single.html">SHOP NOW</a>
						</div>
					</div>
					<div class="bnr-right">
						<a href="single.html"><img src="${pageContext.request.contextPath}/resources/images/b-1.jpg" alt="" /></a>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="col-md-6 banner-bottom-right">
				<div class="bnr-two">
					<div class="bnr-left">
						<h2>
							<a href="single.html">Phasellus quis nunc</a>
						</h2>
						<p>Nulla tempus facilisis purus at.</p>
						<div class="b-btn">
							<a href="single.html">SHOP NOW</a>
						</div>
					</div>
					<div class="bnr-right">
						<a href="single.html"><img src="${pageContext.request.contextPath}/resources/images/b-2.jpg" alt="" /></a>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!--end-banner-bottom-->
<!--start-shoes-->
<div class="shoes">
	<div class="container">
		<div class="product-one">
		
		<c:set value="${lvo.pagingBean}" var="pb" />
		<c:set value="${lvo.list}" var="productList" />
		
			<c:forEach items="${productList}" var="pvo" >
				<div class="col-md-3 product-left">
					<div class="p-one simpleCart_shelfItem">
						<a href="${pageContext.request.contextPath}/findProductDetailByPno.do?pno=${pvo.pno}"> 
						<img src="${pageContext.request.contextPath}/resources/upload/${pvo.imageList[0].url}" alt="" style="max-width: 300px; max-height: 500px;"/>
							<div class="mask">
								<span>상세보기</span>
							</div>
						</a>
						<h4>${pvo.name}</h4>
						<p>
							<a class="item_add" href="#"> <span class=" item_price">${pvo.price}</span></a>
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
   				<a href="findProductByCategory.do?pageNo=${pb.startPageOfPageGroup-1}">Previous</a>
   			</li>
   			</c:if>
   				<c:forEach begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}" var="pageNum">
	   				<c:choose>
	   					<c:when test="${pageNum==pb.nowPage}">
							<li><a>${pageNum}&nbsp;&nbsp;</a></li>
						</c:when>
					<c:otherwise>
						<li>
							<a href="findProductByCategory.do?pageNo=${pageNum}">${pageNum}</a>
							&nbsp;&nbsp;
						</li>
					</c:otherwise>
   				</c:choose>
   			</c:forEach>
   			<c:if test="${pb.nextPageGroup==true}">
    			<li>
    				<a href="findProductByCategory.do?pageNo=${pb.endPageOfPageGroup+1}">Next</a>
    			</li>
    		</c:if>
	</ul>	 		
</div> 















