<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	alert("새로운 비밀번호가 등록되었습니다 \n 관리자 페이지로 이동합니다");
	location.href="${pageContext.request.contextPath}/adminPage.do";
</script>