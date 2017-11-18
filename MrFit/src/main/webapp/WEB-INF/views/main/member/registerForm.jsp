<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
<!--start-account-->
	<div class="account">
		<div class="container"> 
			<div class="account-bottom">
				<div class="col-md-6 account-left">
					<form method="post" action="${pageContext.request.contextPath}/registerMember.do" id="regForm">
					<sec:csrfInput/><%-- csrf 토큰 --%>
					<div class="account-top heading">
						<h3>REGISTER CUSTOMER</h3>
					</div>
					<div class="address">
						<span>아이디</span>
						<input type="text" name="id" id="memberId">
						<span id="idCheckView"></span>
					</div>
					<div class="address">
						<span>비밀번호</span>
						<input type="password" name="password">
					</div>
					<div class="address">
						<span>이름</span>
						<input type="text" name="name">
					</div>
					<div class="address">
						<span>전화</span>
						<input type="text" name="phone">
					</div>
					<div class="address">
						<span>주소</span>
						<input type="text" name="address">
					</div>
					<div class="address">
						<span>email</span>
						<input type="text" name="email">
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
						<input type="submit" value="가입하기">
					</div>
					</form>
				</div>
				<div class="col-md-6 account-left">
					
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--end-account-->

<script type="text/javascript">
	$(document).ready(function(){
		var checkResultId="";		
		$("#regForm").submit(function(){			
			if($("#regForm :input[name=id]").val().trim()==""){
				alert("아이디를 입력하세요");				
				return false;
			}
			if($("#regForm :input[name=password]").val().trim()==""){
				alert("패스워드를 입력하세요");				
				return false;
			}
			if($("#regForm :input[name=name]").val().trim()==""){
				alert("이름을 입력하세요");				
				return false;
			}
			if($("#regForm :input[name=address]").val().trim()==""){
				alert("주소를 입력하세요");				
				return false;
			}	
			if(checkResultId==""){
				alert("아이디 중복확인을 하세요");
				return false;
			}		
		});
		$("#regForm :input[name=id]").keyup(function(){
			var id=$(this).val().trim();
			if(id.length<4 || id.length>10){
				$("#idCheckView").html("아이디는 4자이상 10자 이하여야 함!").css(
						"background","pink");
				checkResultId="";
				return;
			}
			// spring security 적용시 ajax post 방식은 아래와 같이 beforeSend property에서 csrf 값을 셋팅해야 함 
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/idcheckAjax.do",				
				data:"id="+id,	
				beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
				success:function(data){						
					if(data=="fail"){
					$("#idCheckView").html(id+" 사용불가!").css("background","red");
						checkResultId="";
					}else{						
						$("#idCheckView").html(id+" 사용가능!").css(
								"background","yellow");		
						checkResultId=id;
					}					
				}//callback			
			});//ajax
		});//keyup
	});//ready
</script>

<%-- 	위에 있는 REGISTER CUSTOMER 부분에 적용시킬 것 - 진호 
<form method="post" action="${pageContext.request.contextPath}/registerMember.do" id="regForm">
<sec:csrfInput/>csrf 토큰
아이디 <input type="text" name="id" id="memberId"><span id="idCheckView"></span><br>
비밀번호 <input type="password" name="password"><br>
이름 <input type="text" name="name"><br>
전화 <input type="text" name="phone"><br>
주소 <input type="text" name="address"><br>
이메일 <input type="text" name="email"><br>
<input type="submit" value="가입하기">
</form>
 --%>

<%--	  register.jsp -- MemberController
								|
								register_result.jsp 
								가입정보 출력 
								새로고침시 재등록 되지 않는다 
				ajax(jquery)로 
				id 중복확인을 한다 				
		 --%>


