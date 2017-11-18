<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#IdForm").submit(function() {
			if ($("#IdForm :input[name=email]").val() == "") {
				alert("공란을 입력하세요!");
				return false;
			}
		});
		$("#PwForm").submit(function() {
			if ($("#PwForm :input[name=id]").val() == "") {
				alert("공란을 입력하세요!");
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
						<form action="${pageContext.request.contextPath}/findIdByEmailAndName.do" method="post" id="IdForm">
					<sec:csrfInput/><%-- csrf 토큰 --%>
					<div class="account-top heading">
						<h3>아이디 찾기</h3>
					</div>
					<div class="address">
						<span>E-mail</span>
						<input type="text" name="email" size="10">
					</div>
					<div class="address">
						<span>Name</span>
						 <input type="text" name="name" size="10">
					</div>
					<div class="address">
						<input type="submit" value="아이디 찾기">
					</div>
					</form>
				</div>
				<div class="col-md-6 account-left">
					<form action="${pageContext.request.contextPath}/findQnaByIdNameEmail.do" method="post" id="PwForm">
					<sec:csrfInput/><%-- csrf 토큰 --%>
					<div class="account-top heading">
						<h3>비밀번호 찾기</h3>
					</div>
					<div class="address">
						<span>ID</span>
						<input type="text" name="id" size="10">
					</div>
					<div class="address">
						<span>Name</span>
						<input type="text" name="name" size="10">
					</div>
					<div class="address">
						<span>E-mail</span>
						<input type="text" name="email" size="10">
					</div>
					<div class="address">
						<input type="submit" value="비밀번호 찾기">
					</div>
					</form>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--end-account-->