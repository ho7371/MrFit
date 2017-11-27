<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<div class="account">
	<div class="container">
		<div class="account-bottom">
			<div class="col-md-6 account-left">
				<!-- Form을 없애야 합니다. : 진호 -->
					<%-- <sec:csrfInput />	csrf 토큰 --%>
					<div class="account-top heading">
						<h3>My Page</h3>
					</div>
					<div class="address">
						<span>아이디</span> <input type="text" name="id" id="memberId"
							value="<sec:authentication property="principal.id"/>"
							readonly="readonly"> <span id="idCheckView"></span>
					</div>
					<div class="address">
						<span>이름</span> <input type="text" name="name"
							value="<sec:authentication property="principal.name"/>"
							readonly="readonly">
					</div>
					<div class="address">
						<span>전화</span> <input type="text" name="phone"
							value="<sec:authentication property="principal.phone"/>"
							readonly="readonly">
					</div>
					<div class="address">
						<span>주소</span> <input type="text" name="address"
							value="<sec:authentication property="principal.address"/>"
							readonly="readonly">
					</div>
					<div class="address">
						<span>email</span> <input type="text" name="email"
							value="<sec:authentication property="principal.email"/>"
							readonly="readonly">
					</div>
					<div class="address">
						<form action="${pageContext.request.contextPath}/updateMemberForm.do">
							<input type="submit" value="정보수정">
						</form>
					</div>
				</form>
			</div>
			<div class="col-md-6 account-left"></div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>




