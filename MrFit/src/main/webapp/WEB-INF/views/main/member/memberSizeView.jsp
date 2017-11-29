<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style type="text/css">
	th{
		background: #aef9e9;
	}
	th, td{
		text-align: center;
	}
</style>
<!--start-account-->
<div class="account">
	<div class="container">
		<div class="account-bottom">
			<div class="col-md-3 account-left"></div>
				<%-- 회원 치수 정보 --%>
				<div class="col-md-6 account-left">
					<form action="${pageContext.request.contextPath}/updateMemberSizeForm.do"
						method="get" id="msupdateform">
					<div class="account-top heading">
						<h3>Member Size</h3>
					</div>
					<div class="address">
						<span><sec:authentication property="principal.name" />님의 치수정보</span>
					</div>
					
					<div>
						<table class="table table-bordered">
							<thead><tr><th colspan="3">아우터</th></tr></thead>
							<tbody>
								<tr><td rowspan="6"><img alt="아우터 사이즈표" src="${pageContext.request.contextPath}/resources/images/size_outer.jpg"></td></tr>
								<tr><td>어깨</td><td><sec:authentication property="principal.msvo.shoulder"/></td></tr>
								<tr><td>암홀</td><td><sec:authentication property="principal.msvo.armhole"/></td></tr>
								<tr><td>가슴</td><td><sec:authentication property="principal.msvo.chest"/></td></tr>
								<tr><td>소매</td><td><sec:authentication property="principal.msvo.sleeve"/></td></tr>
								<tr><td>상의총기장</td><td><sec:authentication property="principal.msvo.toplength"/></td></tr>
							</tbody>
						</table>
						<table class="table table-bordered">
							<thead><tr><th colspan="3">상의</th></tr></thead>
							<tbody>
								<tr><td rowspan="6"><img alt="상의 사이즈표" src="${pageContext.request.contextPath}/resources/images/size_top.jpg"></td></tr>
								<tr><td>어깨</td><td><sec:authentication property="principal.msvo.shoulder"/></td></tr>
								<tr><td>암홀</td><td><sec:authentication property="principal.msvo.armhole"/></td></tr>
								<tr><td>가슴</td><td><sec:authentication property="principal.msvo.chest"/></td></tr>
								<tr><td>소매</td><td><sec:authentication property="principal.msvo.sleeve"/></td></tr>
								<tr><td>상의총기장</td><td><sec:authentication property="principal.msvo.toplength"/></td></tr>
							</tbody>
						</table>
						<table class="table table-bordered">
							<thead><tr><th colspan="3">하의</th></tr></thead>
							<tbody>
								<tr><td rowspan="6"><img alt="하의 사이즈표" src="${pageContext.request.contextPath}/resources/images/size_bottom.jpg"></td></tr>
								<tr><td>허리</td><td><sec:authentication property="principal.msvo.waist"/></td></tr>
								<tr><td>밑위</td><td><sec:authentication property="principal.msvo.crotch"/></td></tr>
								<tr><td>허벅지</td><td><sec:authentication property="principal.msvo.thigh"/></td></tr>
								<tr><td>밑단</td><td><sec:authentication property="principal.msvo.hem"/></td></tr>
								<tr><td>하의총기장</td><td><sec:authentication property="principal.msvo.bottomlength"/></td></tr>
							</tbody>
						</table>
					</div>
						<input type="submit" value="수정하기">
					</form>
				</div>
			<div class="col-md-3 account-left"></div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!--end-account-->