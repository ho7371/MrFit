<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#searchProductBtn").click(function() {
			location.href="findProductByName.do?keyword="+$("#searchProduct").val();
		});// click
	});// ready
</script>
	<!--top-header-->
	<div class="top-header">
		<div class="container">
			<div class="top-header-main">
				<div class="col-md-4 top-header-left">
					<div class="search-bar">
						<input type="text" value="Search" onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = 'Search';}" id = "searchProduct">
						<input type="submit" value="" id = "searchProductBtn">
					</div>
				</div>
				<div class="col-md-4 top-header-middle">
					<a href="${pageContext.request.contextPath}/home.do"><img src="${pageContext.request.contextPath}/resources/images/logo-4.png" alt="" /></a>
				</div>
				<div class="col-md-4 top-header-right">
					<div class="cart box_1">
						<a href="checkout.html">
							<h3>
								<div class="total">
									<span class="simpleCart_total"></span> (<span
										id="simpleCart_quantity" class="simpleCart_quantity"></span>
									items)
								</div>
								<img src="${pageContext.request.contextPath}/resources/images/cart-1.png" alt="" />
						</a>
						<sec:authorize access="!hasRole('ROLE_ADMIN') and !hasRole('ROLE_MEMBER')">
						<a href="${pageContext.request.contextPath}/loginForm.do">로그인</a>
						&nbsp;|&nbsp;
						<a href="${pageContext.request.contextPath}/registerForm.do">회원가입</a>
						</sec:authorize>
					<sec:authorize
						access="hasRole('ROLE_ADMIN') or hasRole('ROLE_MEMBER')">
						<sec:authentication property="principal.name" />님 <br>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_ADMIN') or hasRole('ROLE_MEMBER')">
						<p>
							<a href="javascript:;" class="simpleCart_empty">Empty Cart</a>
							<a href="${pageContext.request.contextPath}/myPage.do">마이페이지</a>&nbsp;
							<a href="#">쪽지함</a>&nbsp; 
							<a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
						</p>
					</sec:authorize>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--top-header-->
	<!--bottom-header-->
	<div class="header-bottom">
		<div class="container">
			<div class="top-nav">
				<ul class="memenu skyblue">
					<li class="grid"><a href="#">OUTER</a></li>
					<li class="grid"><a href="#">TOP</a></li>
					<li class="grid"><a href="#">BOTTOM</a></li>
					<li class="grid"><a href="${pageContext.request.contextPath}/notice.do">공지사항</a></li>
					<li class="grid"><a href="${pageContext.request.contextPath}/inquiry.do">고객문의</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!--bottom-header-->