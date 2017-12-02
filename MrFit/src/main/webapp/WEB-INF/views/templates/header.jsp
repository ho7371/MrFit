<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
							   		<sec:authentication property="principal.name" />님 <br>
									<a href="${pageContext.request.contextPath}/adminPage.do"><button style="margin-bottom: 1px;">관리자페이지</button></a>
									<a href="${pageContext.request.contextPath}/adminNoteList.do"><button style="margin-bottom: 1px;">쪽지함</button></a>
									<a href="#" id="logoutAction"><button style="margin-bottom: 1px;">로그아웃</button></a>
								</p>
								
								<form action="${pageContext.request.contextPath}/logout.do"
									id="logoutForm" method="post" style="display: none;">
									<sec:csrfInput />
								</form>
							</c:when>
							<c:when test="${isMember}">
								<p>
									<sec:authentication property="principal.name" />님 <br>
																		<a href="cartForm.do">
									<%-- <img src="${pageContext.request.contextPath}/resources/images/cart-1.png" alt="" /> --%>
									<button style="margin-bottom: 1px;"> MyCart</button></a>
									<a href="${pageContext.request.contextPath}/myPage.do"><button style="margin-bottom:1px;">MyPage</button></a>
									<a href="${pageContext.request.contextPath}/memberNoteList.do"><button style="margin-bottom: 1px;">쪽지함</button></a>
									<br><a href="#" id="logoutAction"><button style="margin-bottom: 1px;">로그아웃</button></a>
								</p>
								
								<form action="${pageContext.request.contextPath}/logout.do"
									id="logoutForm" method="post" style="display: none;">
									<sec:csrfInput />
								</form>
							</c:when>
						   <c:otherwise>
						   		<a href="${pageContext.request.contextPath}/loginForm.do"><button style="margin-top: 3px;">로그인</button></a>
								<a href="${pageContext.request.contextPath}/registerForm.do"><button style="margin-bottom: 1px;">회원가입</button></a>
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