<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<h3>포인트 지급</h3>
<hr>
아이디 : ${member.id}<br>
등급 : ${member.gradeVO.grade}<br>
현재 포인트 : ${member.point}<br>
<form action="${pageContext.request.contextPath}/adminGivePointToMember.do" method="post">
			<sec:csrfInput/><%-- csrf 토큰 --%>
지급 포인트 :	<input type="text" name="point"><br>
			<input type="hidden" name="id" value="${member.id}">
			<input type="submit" value="포인트 지급">
</form>






