<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	alert("이미 리뷰를 작성하셨습니다");
	location.href = "${pageContext.request.contextPath}/myOrderPrductList.do?ono=${ono}";
</script>
