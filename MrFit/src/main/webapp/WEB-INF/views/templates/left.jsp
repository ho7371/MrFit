<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#findForm").submit(function() {
			if ($("#findForm :input[name=id]").val() == "") {
				alert("아이디를 입력하세요!");
				return false;
			}
		});
	});
</script>
<form id="findForm"
	action="${pageContext.request.contextPath}/findMemberById.do">
	아이디 <input type="text" name="id" size="5"> <input type="submit"
		value="검색">
</form>
<br>

<%-- 
		  spring-security-taglibs 조건 표현 
        인증 안된(로그인 안한) 사용자 메뉴 : 인증되면 안보여야 하는 메뉴 
<sec:authorize access="!isAuthenticated()">
	<li><a href="${pageContext.request.contextPath}/login_form.do">로그인</a></li>
	<li><a href="${pageContext.request.contextPath}/join_member_form.do">회원가입</a></li>
</sec:authorize>

인증된(로그인한) 사용자 메뉴 : 인증 안된상태에서 안보여야 하는 메뉴
<sec:authorize access="isAuthenticated()">
	<li><a href="javascript:logout()">로그아웃</a>
</sec:authorize>
		  
구체적인 ROLE을 판단해야 할 경우 		  
<sec:authorize access="hasRole('ROLE_ADMIN') and hasRole('ROLE_MEMBER')">
<p>Must have ROLE_ADMIN and ROLE_MEMBER</p>
</sec:authorize>
<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')">
<p>Must have ROLE_ADMIN or ROLE_MEMBER</p>
</sec:authorize>
<sec:authorize access="!hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')">
<p>Must not have ROLE_ADMIN or ROLE_MEMBER</p>
</sec:authorize>
		
 --%>
<sec:authorize access="!hasRole('ROLE_MEMBER')">
	<br>
	<form action="${pageContext.request.contextPath}/login.do"
		method="post" id="loginForm">
		<%-- Spring Security에서는 해킹방지를 위해
		 post방식 정보전송일때는 반드시 csrf 토큰을 삽입해야 전송이 된다
		 아래 security tag를 쓰면 hidden tag 가 자동 생성된다 
		   --%>
		<sec:csrfInput/><%-- csrf 토큰 --%>
		아이디 <input type="text" name="id" size="10"><br>
		패스워드 <input type="password" name="password" size="10"><br>
		<input type="submit" value="로그인">
	</form>
	<a href="${pageContext.request.contextPath}/member/registerForm.do">회원가입</a>
	<br>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_MEMBER')">
	<%-- 
Spring Security를 이용하면 Authentication Bean 이 생성
로그인 한 사용자의 정보는 Authentication 객체의 principal 에 저장된다 
 --%>
	<sec:authentication property="principal.name" />님 <br>
	<a href="${pageContext.request.contextPath}/enterCafe.do">카페가기</a>
	<br>
	<%-- <a href="${pageContext.request.contextPath}/logout.do">로그아웃</a> --%>
	<%-- spring security logout은 다음과 같은 처리가 필요하다
	로그인 로그아웃은 모두 post 방식 요청으로 해야 하면  csrf 토큰처리가 필요하다 --%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#logoutAction").click(function() {
				$("#logoutForm").submit();
			});
		});
	</script>
	<a href="#" id="logoutAction">로그아웃</a>
	<form id="logoutForm"
		action="${pageContext.request.contextPath}/logout.do" method="post"
		style="display: none">
		<sec:csrfInput />
	</form>


	<br>
	<a href="${pageContext.request.contextPath}/updateForm.do">회원정보수정</a>

<br>
<br>
파일업로드테스트
<br>
<a
	href="${pageContext.request.contextPath}/product/registerProductForm_FileUpload.do">상품등록(파일업로드)</a>
<br>
<a
	href="${pageContext.request.contextPath}/product/multifileupload_form.do">멀티파일업로드</a>
<br>
<!-- FileUploadController에서 처리한다 -->
</sec:authorize>
<br>
<br>
<sec:authorize access="hasRole('ROLE_ADMIN') and hasRole('ROLE_MEMBER')">
	관리자이자 회원일 때 보여야 하는 메뉴
</sec:authorize>

