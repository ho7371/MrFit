<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">	
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	       $("#searchProduct").keypress(function (e) {
	           if (e.which == 13){
	        	   location.href = "findProductByName.do?nowPage=1&keyword="+ $(this).val();
	           }
	       });
		$("#searchProductBtn").click(
			function() {
			location.href = "findProductByName.do?nowPage=1&keyword="+ $("#searchProduct").val();
		}); // click
		$("#logoutAction").click(function() {
			$("#logoutForm").submit();
		});
	});// ready
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
			<%-- 검색 --%>
			<div class="col-md-4 top-header-left">
				<div class="search-bar">
					<input type="text" value="Search" onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'Search';}"
						id="searchProduct"> <input type="submit" value=""
						id="searchProductBtn">
				</div>
			</div>
			
			<%-- 로고 --%>
			<div class="col-md-4 top-header-middle">
				<a href="${pageContext.request.contextPath}/home.do">
				<%-- <img src="${pageContext.request.contextPath}/resources/images/Logo.jpg" alt="" width="80px"/></a> --%>
				<img src="${pageContext.request.contextPath}/resources/images/TextLogo.jpg" alt="" width="270px"/></a>
			</div>
			
			<%-- 회원 페이지 --%>
			<div class="col-md-4 top-header-right">
				<div class="cart box_1" align="right">
					<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
					<sec:authorize access="hasRole('ROLE_MEMBER')" var="isMember" />
						<c:choose>
						   <c:when test="${isAdmin}">
							   	<p>
							   		<sec:authentication property="principal.name" />님 &nbsp;&nbsp;
									<a href="${pageContext.request.contextPath}/adminNoteList.do"style="text-decoration: none;"><font color="#8c2830"><span class="glyphicon glyphicon-envelope"></span></font></a><br>
									<a href="${pageContext.request.contextPath}/adminPage.do"style="text-decoration: none;"><font color="#8c2830">관리자페이지</font></a>&nbsp;&nbsp;
									<a href="#" id="logoutAction"style="text-decoration: none;"><font color="#8c2830">로그아웃</font></a>
								</p>
								
								<form action="${pageContext.request.contextPath}/logout.do"
									id="logoutForm" method="post" style="display: none;">
									<sec:csrfInput />
								</form>
							</c:when>
							<c:when test="${isMember}">
								<p style="font-style: inherit;">
									<sec:authentication property="principal.name" />님 <br>
									포인트 : <sec:authentication property="principal.point" />&nbsp;&nbsp;
									<a href="${pageContext.request.contextPath}/memberNoteList.do" style="text-decoration: none;"><font color="#8c2830"><span class="glyphicon glyphicon-envelope"></span></font></a><br>
										<a href="cartForm.do" style="text-decoration: none;">
									<%--  <img src="${pageContext.request.contextPath}/resources/images/cart-1.png" alt="" />  --%>
									<font color="#8c2830">MyCart</font></a>&nbsp;&nbsp;
									<a href="${pageContext.request.contextPath}/myPage.do" style="text-decoration: none;"><font color="#8c2830"> MyPage</font></a>&nbsp;&nbsp;
									<a href="#" id="logoutAction" style="text-decoration: none;"><font color="#8c2830">로그아웃</font></a>
								</p>
								
								<form action="${pageContext.request.contextPath}/logout.do"
									id="logoutForm" method="post" style="display: none;">
									<sec:csrfInput />
								</form>
							</c:when>
						   <c:otherwise>
						   		<a href="${pageContext.request.contextPath}/loginForm.do"style="text-decoration: none;"><font color="#8c2830">로그인</font></a>&nbsp;&nbsp;
								<a href="${pageContext.request.contextPath}/registerForm.do"style="text-decoration: none;"><font color="#8c2830">회원가입</font></a>
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
<div class="header-bottom" style=" border-bottom: solid 1px #999999;border-top: solid 1px #999999;">
	<div class="container">
		<div class="top-nav">
			<ul class="memenu skyblue">
				<li class="grid"><a href="${pageContext.request.contextPath}/findProductByCategory.do?category=outer">OUTER</a></li>
				<li class="grid"><a href="${pageContext.request.contextPath}/findProductByCategory.do?category=top">TOP</a></li>
				<li class="grid"><a href="${pageContext.request.contextPath}/findProductByCategory.do?category=bottom">BOTTOM</a></li>
				<li class="grid"><a href="${pageContext.request.contextPath}/notice.do">공지사항</a></li>
				<li class="grid"><a href="${pageContext.request.contextPath}/inquiry.do">고객문의</a></li>
				<li class="grid"><a href="${pageContext.request.contextPath}/contact.do">Contact Us</a></li>
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<!--bottom-header-->