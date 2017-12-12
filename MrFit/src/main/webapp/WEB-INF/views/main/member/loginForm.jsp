<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!--start-account-->
	<div class="account">
		<div class="container"> 
			<div class="account-bottom">
				<div class="col-md-6 account-left" style="text-align: center;">
					<img alt="" src="${pageContext.request.contextPath}/resources/images/Logo.jpg" style="width: 250px;">
				</div>
				<div class="col-md-6 account-left">
					<%-- 로그인 폼 --%>
					<form action="${pageContext.request.contextPath}/login.do" method="post" id="loginForm">
						<sec:csrfInput/><%-- csrf 토큰 --%>
						<div class="account-top heading">
							<h3>LOGIN CUSTOMER</h3>
						</div>
						<div class="address">
							<span>아이디</span>
							<input type="text" name="id" size="10" required="required">
						</div>
						<div class="address">
							<span>패스워드</span>
							 <input type="password" name="password" size="10" required="required">
						</div>
						<div class="address">
							<input type="submit" value="Login">							
						<button style="margin-bottom: 1px; color: white;" onclick="location.href='findIdPasswordForm.do'">아이디|비밀번호 찾기</button>
						</div>
					</form>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!--end-account-->