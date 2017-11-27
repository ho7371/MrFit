<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	alert('${requestScope.memberVO.name}님! 회원가입에 성공하였습니다.');
	location.href="${pageContext.request.contextPath}/home.do";
</script>

