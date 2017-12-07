<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#PupdateForm").submit(function() {
			if ($("#pw1").val() != $("#pw2").val()) {
				alert("비밀번호가 일치하지 않습니다");
				$("#pw1").val("");
				$("#pw2").val("");
				return false;
			}
		});
	});
</script>
<!--start-account-->
	<div class="account">
		<div class="container"> 
			<div class="account-bottom">
			<div class="col-md-1 account-left"></div>
				<div class="col-md-4 account-left">
					<div style="width: 500px; height: 250px;">
						<img alt=""  src="${pageContext.request.contextPath}/resources/images/pass.jpg">
					</div>
				</div>
				<div class="col-md-6 account-left">
					<%-- 새 비밀번호 설정 폼 --%>
					<form action="${pageContext.request.contextPath}/updatePasswordById.do" method="post" id="PupdateForm">
						<input type="hidden" name="id" value="${upid.id }">
						<sec:csrfInput/><%-- csrf 토큰 --%>
						<div class="account-top heading">
							<h3>Password Reset</h3>
						</div>
						<div class="address">
							<span>Name</span>
							${upid.name} 님 어서오세요!
						</div>
						<div class="address">
							<span>Password</span>
							 <input type="password" name="password" size="10" id="pw1" required="required">
						</div>
						<div class="address">
							<span>Password 재입력</span> 
							<input type="password" size="10" id="pw2" required="required">
						</div>
						<div class="address">
							<input type="submit" value="등록">
						</div>
					</form>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--end-account-->