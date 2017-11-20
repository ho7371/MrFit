<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	/* 	$(document).ready(function() {
	 $("#msupdateform input").attr("disabled", true);
	
	 $("#msupdateform").on("click","button[name='msupdatebtn1']",function() {
	 $("#msupdateform input").attr("disabled", false);
	 $("#msupdate").html('<button name="msupdatebtn2" type="button">수정완료</button>');
	 });
	
	 $("#msupdateform").on("click","button[name='msupdatebtn2']",function() {
	 var params = jQuery("#msupdateform").serialize();
	 alert(params);
	 $.ajax({
	 type:"post",
	 url:"${pageContext.request.contextPath}/updateMemberSize.do",
	 data:params,
	 dataType:"json",
	 beforeSend : function(xhr){  
	 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	 },
	 success:function(data){
	 alert("수정완료!");
	 $("#msupdateform input").attr("disabled", true);
	 $("#msupdate").html('<button name="msupdatebtn1" type="button">수정</button>');
	 },
	 error:function(){
	 alert(1);
	 }
	 }); //ajax
	 alert(2);
	 }); 
	 });		*/
</script>
<!--start-account-->
<div class="account">
	<div class="container">
		<div class="account-bottom">
			<div class="col-md-3 account-left"></div>
			<div class="col-md-6 account-left">
				<form
					action="${pageContext.request.contextPath}/updateMemberSizeForm.do"
					method="get" id="msupdateform">
					<%-- 					<input type="hidden" name="id" value="<sec:authentication property="principal.id"/>"> --%>
					<div class="account-top heading">
						<h3>Member Size</h3>
					</div>
					<div class="address">
						<span>Name</span>
						<sec:authentication property="principal.name" />
						님의 치수정보.
					</div>
					<div class="address">
						<span>어깨</span>
						<sec:authentication property="principal.msvo.shoulder" />
					</div>
					<div class="address">
						<span>가슴</span>
						<sec:authentication property="principal.msvo.chest" />
					</div>
					<div class="address">
						<span>소매</span>
						<sec:authentication property="principal.msvo.sleeve" />
					</div>
					<div class="address">
						<span>암홀</span>
						<sec:authentication property="principal.msvo.armhole" />
					</div>
					<div class="address">
						<span>상의 총 기장</span>
						<sec:authentication property="principal.msvo.toplength" />
					</div>
					<div class="address">
						<span>허리</span>
						<sec:authentication property="principal.msvo.waist" />
					</div>
					<div class="address">
						<span>밑위</span>
						<sec:authentication property="principal.msvo.crotch" />
					</div>
					<div class="address">
						<span>허벅지</span>
						<sec:authentication property="principal.msvo.thigh" />
					</div>
					<div class="address">
						<span>밑단</span>
						<sec:authentication property="principal.msvo.hem" />
					</div>
					<div class="address">
						<span>하의 총 기장</span>
						<sec:authentication property="principal.msvo.bottomlength" />
					</div>
					<div class="address">
						<input type="submit" value="수정">
					</div>
				</form>
			</div>
			<div class="col-md-3 account-left"></div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!--end-account-->