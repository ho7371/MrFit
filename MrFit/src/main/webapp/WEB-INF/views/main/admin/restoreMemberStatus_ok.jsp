<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	alert("탈퇴 회원이 활성화 되었습니다.");
	location.href="${pageContext.request.contextPath}/commonMemberList.do?status=1&pageNo=1";
</script>