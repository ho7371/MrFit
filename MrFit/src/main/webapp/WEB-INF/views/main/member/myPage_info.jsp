<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


	<div class="account">
		<div class="container"> 
			<div class="account-bottom">
				<div class="col-md-6 account-left">
				<!-- Form을 없애야 합니다. : 진호 -->
					<form method="post" action="${pageContext.request.contextPath}/registerMember.do" id="regForm">
					<sec:csrfInput/><%-- csrf 토큰 --%>
					<div class="account-top heading">
						<h3>My Page</h3>
					</div>
					<div class="address">
						<span>아이디</span>
						<input type="text" name="id" id="memberId" readonly="readonly">
						<span id="idCheckView"></span>
					</div>
					<div class="address">
						<span>비밀번호</span>
						<input type="password" name="password" readonly="readonly">
					</div>
					<div class="address">
						<span>이름</span>
						<input type="text" name="name" readonly="readonly">
					</div>
					<div class="address">
						<span>전화</span>
						<input type="text" name="phone" readonly="readonly">
					</div>
					<div class="address">
						<span>주소</span>
						<input type="text" name="address" readonly="readonly">
					</div>
					<div class="address">
						<span>email</span>
						<input type="text" name="email" readonly="readonly">
					</div>
					<div class="address">
						<span>비밀번호 확인 질문</span>
						<select name="qno">
							<option value="">--질문 선택--</option>
							<c:forEach items="${list}" var="qvo">
								<option value="${qvo.qno}">${qvo.question}</option>
							</c:forEach>
						</select>
					</div>
					<div class="address">
						<span>질문답변</span>
						<input type="text" name="answer">
					</div>
					<div class="address new">
						<!-- <input type="submit" value="가입하기"> -->
					</div>
					</form>
				</div>
				<a href="#">회원정보 수정하기</a>
				<div class="col-md-6 account-left">
					
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	
	
	<!--  영훈아 어래에 너가 작성한 코드를 위 코드에 삽입하면 돼~ -->
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









