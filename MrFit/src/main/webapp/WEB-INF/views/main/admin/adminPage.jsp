<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:csrfInput/><%-- csrf 토큰 --%>	

<!--start-product-->
<div class="product">
	<div class="container">
		<div class="product-main">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="product-one">
					<div class="col-md-4 product-left single-left">
						<div class="p-one simpleCart_shelfItem" style="padding: 20px;">
							<a href="${pageContext.request.contextPath}/adminAllOrderList.do">
								<img src="${pageContext.request.contextPath}/resources/images/Logo.jpg" alt="" />
								<p>주문 관리</p>
							</a>
						</div>
					</div>
					<div class="col-md-4 product-left single-left">
						<div class="p-one simpleCart_shelfItem" style="padding: 20px;">
							<a href="${pageContext.request.contextPath}/adminProductList.do">
								<img src="${pageContext.request.contextPath}/resources/images/Logo.jpg" alt="" />
								<p>상품 관리</p>
							</a>
						</div>
					</div>
					<div class="col-md-4 product-left single-left">
						<div class="p-one simpleCart_shelfItem" style="padding: 20px;">
							<a href="${pageContext.request.contextPath}/commonMemberList.do?status=1">
								<img src="${pageContext.request.contextPath}/resources/images/Logo.jpg" alt=""/>
								<p>회원 관리</p>
							</a>
						</div>
					</div>
					<div class="col-md-4 product-left single-left">
						<div class="p-one simpleCart_shelfItem" style="padding: 20px;">
							<a href="${pageContext.request.contextPath}/commonMemberList.do?status=1">
								<img src="${pageContext.request.contextPath}/resources/images/Logo.jpg" alt=""/>
								<p>게시글 관리</p>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!--end-product-->

