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
					<%-- 회원 정보 수정 폼 --%>
					<form method="post" action="${pageContext.request.contextPath}/updateMemberAction.do"
						id="updateForm">
						<sec:csrfInput/>
						<div class="address">
							<span>아이디</span>
							<input type="text" name="id" id="memberId"
								value="<sec:authentication property="principal.id"/>" readOnly="readOnly">
							<span id="idCheckView"></span>
						</div>
						<div class="address">
							<span>비밀번호</span>
							<input type="password" name="password" id="password">
						</div>
						<div class="address">
							<span>비밀번호 확인</span>
							<input type="password" id="CheckPassword">
							<span id="passwordCheckView"></span>
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
				</div>
				<div class="col-md-6 account-left"></div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</sec:authorize>    
    
<script type="text/javascript">
	var checkResultPassword="";
	$("#updateForm").submit(function(){
		if(checkResultPassword==""){
			alert("비밀번호 확인을 하세요");
			return false;
		}
	});
	$(document).ready(function(){ 
		$("#CheckPassword").keyup(function(){
			var password=$("#password").val().trim();
			var passwordCheck=$("#CheckPassword").val().trim();
			if(password==passwordCheck){
				$("#passwordCheckView").html("비밀번호 일치").css("background","yellow");		
				checkResultPassword=password;
				return;
			}else{
				$("#passwordCheckView").html("비밀번호 불일치").css("background","red");
				checkResultPassword="";
				return;
			}
		});
	});//ready
</script>
