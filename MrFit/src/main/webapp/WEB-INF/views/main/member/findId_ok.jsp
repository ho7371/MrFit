<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	alert("아이디는 ${lostid} 입니다! \n 확인을 누르면 홈으로 돌아갑니다");
	location.href="${pageContext.request.contextPath}/home.do";
</script>