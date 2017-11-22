<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:csrfInput/><%-- csrf 토큰 --%>	

<!--start-product-->
<div class="product">
	<div class="container">
		<div class="product-main">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="product-one">
					<div class="col-md-4 product-left single-left">
						<div class="p-one simpleCart_shelfItem">
							<a href="#">
								<img src="${pageContext.request.contextPath}/resources/images/MrFit_Logo.png" alt="" />
								<p>주문 관리</p>
							</a>
						</div>
					</div>
					<div class="col-md-4 product-left single-left">
						<div class="p-one simpleCart_shelfItem">
							<a href="${pageContext.request.contextPath}/adminProductList.do">
								<img src="${pageContext.request.contextPath}/resources/images/MrFit_Logo.png" alt="" />
								<p>상품 관리</p>
							</a>
						</div>
					</div>
					<div class="col-md-4 product-left single-left">
						<div class="p-one simpleCart_shelfItem">
							<a href="#">
								<img src="${pageContext.request.contextPath}/resources/images/MrFit_Logo.png" alt="" />
								<p>회원 관리</p>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!--end-product-->

