<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!--start-account-->
<div class="account">
	<div class="container">
		<div class="account-bottom">
			<div class="col-md-3 account-left"></div>
				<div class="col-md-6 account-left">
					<form action="${pageContext.request.contextPath}/updateMemberSizeForm.do"
						method="get" id="msupdateform">
					<div class="account-top heading">
						<h3>Member Size</h3>
					</div>
					<div class="address">
						<span>Name</span>
						<sec:authentication property="principal.name" />
						님의 치수정보.
					</div>
					
					<table>
							<thead>
								<tr><th>어깨</th><th>가슴</th><th>소매</th><th>암홀</th><th>상의총기장</th></tr>
							</thead>
							<tbody>
								<tr>
								<td><sec:authentication property="principal.msvo.shoulder"/></td>
								<td><sec:authentication property="principal.msvo.chest"/></td>
								<td><sec:authentication property="principal.msvo.sleeve"/></td>
								<td><sec:authentication property="principal.msvo.armhole"/></td>
								<td><sec:authentication property="principal.msvo.toplength"/></td>
							</tr>
							</tbody>
							<thead>
								<tr><th>허리</th><th>밑위</th><th>허벅지</th><th>밑단</th><th>하의총기장</th></tr>
							</thead>
							<tbody>
								<tr>
									<td><sec:authentication property="principal.msvo.waist"/></td>
									<td><sec:authentication property="principal.msvo.crotch"/></td>
									<td><sec:authentication property="principal.msvo.thigh"/></td>
									<td><sec:authentication property="principal.msvo.hem"/></td>
									<td><sec:authentication property="principal.msvo.bottomlength"/></td>
								</tr>
							</tbody>
						</table>
						<input type="submit" value="수정하기">
					</form>
				</div>
			<div class="col-md-3 account-left"></div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!--end-account-->