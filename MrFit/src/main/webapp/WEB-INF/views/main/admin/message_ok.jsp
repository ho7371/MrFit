<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	alert("메시지 가 전달 되었습니다.");
	location.href="${pageContext.request.contextPath}/home.do";
</script>