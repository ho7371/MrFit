<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#findForm").submit(function() {
			if ($("#findForm :input[name=id]").val() == "") {
				alert("아이디를 입력하세요!");
				return false;
			}
		});
	});
</script>
<!--start-account-->
	<div class="account">
		<div class="container"> 
			<div class="account-bottom">
				<div class="col-md-6 account-left">
					<form>
					<div class="account-top heading">
						<h3>NEW CUSTOMERS</h3>
					</div>
					<div class="address">
						<span>First Name</span>
						<input type="text">
					</div>
					<div class="address">
						<span>Last Name</span>
						<input type="text">
					</div>
					<div class="address">
						<span>Email Address</span>
						<input type="text">
					</div>
					<div class="address">
						<span>Password</span>
						<input type="text">
					</div>
					<div class="address">
						<span>Reenter Password</span>
						<input type="text">
					</div>
					<div class="address new">
						<input type="submit" value="submit">
					</div>
					</form>
				</div>
				<div class="col-md-6 account-left">
					<form action="${pageContext.request.contextPath}/login.do" method="post" id="loginForm">
					<%-- Spring Security에서는 해킹방지를 위해 post방식 정보전송일때는 반드시 csrf 토큰을 삽입해야 전송이 된다
					 		아래 security tag를 쓰면 hidden tag 가 자동 생성된다 --%>
					<sec:csrfInput/><%-- csrf 토큰 --%>
					<div class="account-top heading">
						<h3>REGISTERED CUSTOMERS</h3>
					</div>
					<div class="address">
						<span>아이디</span>
						<input type="text" name="id" size="10">
					</div>
					<div class="address">
						<span>패스워드</span>
						 <input type="password" name="password" size="10">
					</div>
					<div class="address">
						<a class="forgot" href="#">Forgot Your Password?</a>
						<input type="submit" value="Login">
					</div>
					</form>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--end-account-->