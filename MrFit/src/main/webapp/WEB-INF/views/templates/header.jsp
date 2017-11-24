<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#searchProductBtn").click(
			function() {
			location.href = "findProductByName.do?keyword="+ $("#searchProduct").val();
		}); // click
		$("#logoutAction").click(function() {
			$("#logoutForm").submit();
		});
	});// ready
</script>
<script type="text/javascript">
$(window).scroll(function(){
    if ($(window).scrollTop() >= 300) {
       $('header-bottom').css("position","fixed");
    }
    else {
       $('header-bottom').css("position","relative");
    }
});
</script>

<!--top-header-->
<div class="top-header">
	<div class="container">
		<div class="top-header-main">
			<div class="col-md-4 top-header-left">
				<div class="search-bar">
					<input type="text" value="Search" onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'Search';}"
						id="searchProduct"> <input type="submit" value=""
						id="searchProductBtn">
				</div>
			</div>
			<div class="col-md-4 top-header-middle">
				<a href="${pageContext.request.contextPath}/home.do">
				<%-- <img src="${pageContext.request.contextPath}/resources/images/Logo.jpg" alt="" width="80px"/></a> --%>
				<img src="${pageContext.request.contextPath}/resources/images/TextLogo.jpg" alt="" width="270px"/></a>
			</div>
			
			<div class="col-md-4 top-header-right">
				<div class="cart box_1" align="right">
					<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
					<sec:authorize access="hasRole('ROLE_MEMBER')" var="isMember" />
						<c:choose>
						   <c:when test="${isAdmin}">
							   	<p>
							   		<sec:authentication property="principal.name" />님 <br>
									<a href="${pageContext.request.contextPath}/adminPage.do">관리자페이지</a>
								</p>
								<a href="#" id="logoutAction">로그아웃</a>
								<form action="${pageContext.request.contextPath}/logout.do"
									id="logoutForm" method="post" style="display: none;">
									<sec:csrfInput />
								</form>
							</c:when>
							<c:when test="${isMember}">
								<p>
									<sec:authentication property="principal.name" />님 <br>
									<a href="cartForm.do">
									<img src="${pageContext.request.contextPath}/resources/images/cart-1.png" alt="" />
									 My Cart</a> <br>
									<a href="${pageContext.request.contextPath}/myPage.do">MyPage</a>&nbsp;
									<a href="${pageContext.request.contextPath}/note.do">쪽지함</a>&nbsp;
								</p>
								<a href="#" id="logoutAction">로그아웃</a>
								<form action="${pageContext.request.contextPath}/logout.do"
									id="logoutForm" method="post" style="display: none;">
									<sec:csrfInput />
								</form>
							</c:when>
						   <c:otherwise>
						   		<a href="${pageContext.request.contextPath}/loginForm.do">로그인</a>
								&nbsp;|&nbsp;
								<a href="${pageContext.request.contextPath}/registerForm.do">회원가입</a>
						   </c:otherwise>
						</c:choose>
					
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
				<li class="grid">
					<a href="${pageContext.request.contextPath}/findProductByCategory.do?category=아우터">OUTER</a>
				</li>
				<li class="grid">
					<a href="${pageContext.request.contextPath}/findProductByCategory.do?category=상의">TOP</a>
				</li>
				<li class="grid">
					<a href="${pageContext.request.contextPath}/findProductByCategory.do?category=하의">BOTTOM</a>
				</li>
				<li class="grid">
					<a href="${pageContext.request.contextPath}/notice.do">공지사항</a>
				</li>
				<li class="grid">
					<a href="${pageContext.request.contextPath}/inquiry.do">고객문의</a>
				</li>
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<!--bottom-header-->