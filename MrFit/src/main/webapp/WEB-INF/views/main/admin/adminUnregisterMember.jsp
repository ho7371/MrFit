<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	alert("회원이 탈퇴(휴면계정/권한삭제)되었습니다. ");
	location.href="${pageContext.request.contextPath}/commonMemberList.do?status=1";
</script>