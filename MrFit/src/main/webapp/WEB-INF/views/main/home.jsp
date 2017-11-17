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
			<div class="col-md-3 product-left">
				<div class="p-one simpleCart_shelfItem">
					<a href="single.html"> <img src="${pageContext.request.contextPath}/resources/images/shoes-1.png" alt="" />
						<div class="mask">
							<span>Quick View</span>
						</div>
					</a>
					<h4>Aenean placerat</h4>
					<p>
						<a class="item_add" href="#"><i></i> <span class=" item_price">$329</span></a>
					</p>

				</div>
			</div>
			<div class="col-md-3 product-left">
				<div class="p-one simpleCart_shelfItem">

					<a href="single.html"> <img src="${pageContext.request.contextPath}/resources/images/shoes-2.png" alt="" />
						<div class="mask">
							<span>Quick View</span>
						</div>
					</a>
					<h4>Aenean placerat</h4>
					<p>
						<a class="item_add" href="#"><i></i> <span class=" item_price">$329</span></a>
					</p>

				</div>
			</div>
			<div class="col-md-3 product-left">
				<div class="p-one simpleCart_shelfItem">

					<a href="single.html"> <img src="${pageContext.request.contextPath}/resources/images/shoes-3.png" alt="" />
						<div class="mask">
							<span>Quick View</span>
						</div>
					</a>
					<h4>Aenean placerat</h4>
					<p>
						<a class="item_add" href="#"><i></i> <span class=" item_price">$329</span></a>
					</p>

				</div>
			</div>
			<div class="col-md-3 product-left">
				<div class="p-one simpleCart_shelfItem">

					<a href="single.html"> <img src="${pageContext.request.contextPath}/resources/images/shoes-13.png" alt="" />
						<div class="mask">
							<span>Quick View</span>
						</div>
					</a>
					<h4>Aenean placerat</h4>
					<p>
						<a class="item_add" href="#"><i></i> <span class=" item_price">$329</span></a>
					</p>

				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="product-one">
			<div class="col-md-3 product-left">
				<div class="p-one simpleCart_shelfItem">

					<a href="single.html"> <img src="${pageContext.request.contextPath}/resources/images/shoes-5.png" alt="" />
						<div class="mask">
							<span>Quick View</span>
						</div>
					</a>
					<h4>Aenean placerat</h4>
					<p>
						<a class="item_add" href="#"><i></i> <span class=" item_price">$329</span></a>
					</p>

				</div>
			</div>
			<div class="col-md-3 product-left">
				<div class="p-one simpleCart_shelfItem">

					<a href="single.html"> <img src="${pageContext.request.contextPath}/resources/images/shoes-6.png" alt="" />
						<div class="mask">
							<span>Quick View</span>
						</div>
					</a>
					<h4>Aenean placerat</h4>
					<p>
						<a class="item_add" href="#"><i></i> <span class=" item_price">$329</span></a>
					</p>

				</div>
			</div>
			<div class="col-md-3 product-left">
				<div class="p-one simpleCart_shelfItem">

					<a href="single.html"> <img src="${pageContext.request.contextPath}/resources/images/shoes-7.png" alt="" />
						<div class="mask">
							<span>Quick View</span>
						</div>
					</a>
					<h4>Aenean placerat</h4>
					<p>
						<a class="item_add" href="#"><i></i> <span class=" item_price">$329</span></a>
					</p>

				</div>
			</div>
			<div class="col-md-3 product-left">
				<div class="p-one simpleCart_shelfItem">

					<a href="single.html"> <img src="${pageContext.request.contextPath}/resources/images/shoes-8.png" alt="" />
						<div class="mask">
							<span>Quick View</span>
						</div>
					</a>
					<h4>Aenean placerat</h4>
					<p>
						<a class="item_add" href="#"><i></i> <span class=" item_price">$329</span></a>
					</p>

				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!--end-shoes-->