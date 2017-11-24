<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	alert("검색한 아이디가 존재하지 않습니다.");
	location.href = "${pageContext.request.contextPath}/adminAllOrderList.do";
</script>