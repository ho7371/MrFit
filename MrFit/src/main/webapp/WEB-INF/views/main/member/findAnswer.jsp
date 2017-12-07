<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#AnswerForm").submit(function() {
			if ($("#AnswerForm :input[name=answer]").val() == "") {
				alert("답변을 입력하세요!");
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
					<div style="width: 200px; height: 250px;">
						<img alt="" src="${pageContext.request.contextPath}/resources/images/pass.jpg">
					</div>
				</div>
				<%-- 비밀번호 찾기 폼 --%>				
				<div class="col-md-6 account-left">
					<form action="${pageContext.request.contextPath}/findMemberByQna.do" method="post" id="AnswerForm">
					<input type="hidden" name="id" value="${memberVO.id }">
					<input type="hidden" name="name" value="${memberVO.name }">
					<input type="hidden" name="email" value="${memberVO.email }">
					<sec:csrfInput/><%-- csrf 토큰 --%>
					<div class="account-top heading">
						<h3>Please Answer The Question</h3>
					</div>
					<div class="address">
						<span>Question</span>
						${question}
					</div>
					<div class="address">
						<span>Answer</span>
						 <input type="text" name="answer" size="10">
					</div>
					<div class="address">
						<input type="submit" value="확인">
					</div>
					</form>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!--end-account-->