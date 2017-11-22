<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!--start-account-->
	<div class="account">
		<div class="container"> 
			<div class="account-bottom">
			<div class="col-md-3 account-left"></div>
				<div class="col-md-6 account-left">
					<form action="${pageContext.request.contextPath}/updateMemberSize.do" method="post">
						 <sec:csrfInput/><%-- csrf 토큰 --%>
						<input type="hidden" name="id" value="<sec:authentication property="principal.id"/>">
						<div class="account-top heading">
							<h3>Member Size</h3>
						</div>
						<div class="address">
							<span>Name</span>
							<sec:authentication property="principal.name"/> 님의 치수정보.
						</div>
						
						<table>
							<thead>
								<tr><th>어깨</th><th>가슴</th><th>소매</th><th>암홀</th><th>상의총기장</th></tr>
							</thead>
							<tbody>
								<tr>
								<td><input type="number" name="shoulder" size="10" value="<sec:authentication property="principal.msvo.shoulder"/>" maxlength="3" ></td>
								<td><input type="number" name="chest" size="10" value="<sec:authentication property="principal.msvo.chest"/>" maxlength="3"></td>
								<td><input type="number" name="sleeve" size="10" value="<sec:authentication property="principal.msvo.sleeve"/>" maxlength="3"></td>
								<td><input type="number" name="armhole" size="10" value="<sec:authentication property="principal.msvo.armhole"/>" maxlength="3"></td>
								<td><input type="number" name="toplength" size="10" value="<sec:authentication property="principal.msvo.toplength"/>" maxlength="3"></td>
							</tr>
							</tbody>
							<thead>
								<tr><th>허리</th><th>밑위</th><th>허벅지</th><th>밑단</th><th>하의총기장</th></tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="number" name="waist" size="10" value="<sec:authentication property="principal.msvo.waist"/>" maxlength="3"></td>
									<td><input type="number" name="crotch" size="10" value="<sec:authentication property="principal.msvo.crotch"/>"  maxlength="3"></td>
									<td><input type="number" name="thigh" size="10" value="<sec:authentication property="principal.msvo.thigh"/>" maxlength="3"></td>
									<td><input type="number" name="hem" size="10" value="<sec:authentication property="principal.msvo.hem"/>" maxlength="3"></td>
									<td><input type="number" name="bottomlength" size="10" value="<sec:authentication property="principal.msvo.bottomlength"/>" maxlength="3"></td>
								</tr>
							</tbody>
						</table>
						<input type="submit" value="수정완료">
					</form>
				</div>
							<div class="col-md-3 account-left"></div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--end-account-->