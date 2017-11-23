
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--start-product--> 
	<div class="product">
		<div class="container">
			<div class="product-main">
			<div class="col-md-9 p-left">
				<div class="product-one">
					<c:forEach items="${requestScope.list }" var="i">
					<c:set value="${i.imageList[0].url}" var="url"/>
						<div class="col-md-4 product-left single-left"> 
							<div class="p-one simpleCart_shelfItem">
								<a href="single.html">
										<img src="${pageContext.request.contextPath}/resources/upload/${url}" alt="" />
										<%-- <img src="${pageContext.request.contextPath}/resources/images/${url}" alt="" /> --%>
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
			
			
			<!-- <div class="col-md-3 p-right single-right">
				<h3>Categories</h3>
					<ul class="product-categories">
						<li><a href="#">Blucher Shoe</a> <span class="count">(14)</span></li>
						<li><a href="#">Clog Shoe</a> <span class="count">(2)</span></li>
						<li><a href="#">Snow Boot Shoe</a> <span class="count">(2)</span></li>
						<li><a href="#">Galesh Shoe</a> <span class="count">(11)</span></li>
						<li><a href="#">pataugas Shoe</a> <span class="count">(3)</span></li>
						<li><a href="#">Jazz Shoe</a> <span class="count">(3)</span></li>
					</ul>
					<h3>Colors</h3>
					<ul class="product-categories">
						<li><a href="#">Green</a> <span class="count">(14)</span></li>
						<li><a href="#">Blue</a> <span class="count">(2)</span></li>
						<li><a href="#">Red</a> <span class="count">(2)</span></li>
						<li><a href="#">Gray</a> <span class="count">(8)</span></li>
						<li><a href="#">Green</a> <span class="count">(11)</span></li>
						<li><a href="#">Yellow</a> <span class="count">(2)</span></li>
					</ul>
					<h3>Sizes</h3>
					<ul class="product-categories">
						<li><a href="#">5.5</a> <span class="count">(14)</span></li>
						<li><a href="#">6</a> <span class="count">(2)</span></li>
						<li><a href="#">6.5</a> <span class="count">(2)</span></li>
						<li><a href="#">7</a> <span class="count">(8)</span></li>
						<li><a href="#">7.5</a> <span class="count">(11)</span></li>
					</ul>
					<h3>Price</h3>
					<ul class="product-categories p1">
						<li><a href="#">600$-700$</a> <span class="count">(14)</span></li>
						<li><a href="#">700$-800$</a> <span class="count">(2)</span></li>
						<li><a href="#">800$-900$</a> <span class="count">(2)</span></li>
						<li><a href="#">900$-1000$</a> <span class="count">(8)</span></li>
						<li><a href="#">1000$-1100$</a> <span class="count">(11)</span></li>
					</ul>
			</div> -->
			<div class="clearfix"> </div>
		</div>
	</div>
	</div>
	<!--end-product-->