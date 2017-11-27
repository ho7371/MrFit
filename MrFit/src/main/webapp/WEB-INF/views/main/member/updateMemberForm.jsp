<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
      
 <sec:authorize access="hasRole('ROLE_MEMBER')">
    <div class="account">
		<div class="container"> 
			<div class="account-bottom">
				<div class="col-md-6 account-left">
					<div class="account-top heading">
						<h3>회원 정보 수정</h3>
					</div>
				<form method="post" action="${pageContext.request.contextPath}/updateMemberAction.do">
					<sec:csrfInput/>
					<div class="address">
						<span>아이디</span>
						<input type="text" name="id" id="memberId"
							value="<sec:authentication property="principal.id"/>" readOnly="readOnly">
						<span id="idCheckView"></span>
					</div>
					<div class="address">
						<span>비밀번호</span>
						<input type="password" name="password" required="required">
					</div>
					<div class="address">
						<span>이름</span>
						<input type="text" name="name"
							value="<sec:authentication property="principal.name"/>" required="required">
					</div>
					<div class="address">
						<span>전화</span>
						<input type="text" name="phone"
							value="<sec:authentication property="principal.phone"/>" required="required">
					</div>
					<div class="address">
						<span>주소</span>
						<input type="text" name="address"
							value="<sec:authentication property="principal.address"/>" required="required">
					</div>
					<div class="address">
						<span>email</span>
						<input type="text" name="email"
							value="<sec:authentication property="principal.email"/>" required="required">
					</div>
					<div class="address new">
							<input type="submit" value="회원정보수정!">
					</div>
				</form>
					<!-- </form> -->
				</div>
				<div class="col-md-6 account-left">
					
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
</sec:authorize>    
    
    
   

 <%-- <form method="post" action="${pageContext.request.contextPath}/updateMemberAction.do">
 <sec:csrfInput/>csrf 토큰
		<input type="hidden" name="command" value="update">
		아이디 : <input type="text" name="id"
		value="<sec:authentication property="principal.id"/>" readonly><br>
		패스워드 : <input type="password" name="password" required="required"><br>
		이름 : <input type="text" name="name" 
		value="<sec:authentication property="principal.name"/>" required="required"><br>	
		주소 : <input type="text" name="address" 
		value="<sec:authentication property="principal.address"/>" required="required"><br>
		email : <input type="text" name="email" 
		value="<sec:authentication property="principal.email"/>" required="required"><br>	
		<input type="submit" value="회원정보수정">
		</form>
</sec:authorize>
<h3>회원정보수정</h3> --%>
		
