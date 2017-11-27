<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	alert("리뷰를 성공적으로 작성하셨습니다");
	location.href = "${pageContext.request.contextPath}/myOrderPrductList.do?ono=${ono}&id=${id}";
</script>
