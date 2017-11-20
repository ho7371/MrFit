<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

	
<h3>My page_info</h3>
 <sec:csrfInput/><%-- csrf 토큰 --%>	
 <sec:authentication var="userInfo" property="principal"/>
아이디 : <sec:authentication property="principal.id"/><br>
이름 : <sec:authentication property="principal.name"/><br>
주소 : <sec:authentication property="principal.address"/><br>
email : <sec:authentication property="principal.email"/><br>
answer : <sec:authentication property="principal.answer"/><br>
등급 : <sec:authentication property="principal.gradeVO.grade"/><br>
<hr>
<!-- 위와 아래 두가지 방법 다 가능하다  -->
<%-- 주소 : ${userInfo.address} --%>

<form action="${pageContext.request.contextPath}/updateMemberForm.do">
	<input type="submit" value="정보수정">
</form>









