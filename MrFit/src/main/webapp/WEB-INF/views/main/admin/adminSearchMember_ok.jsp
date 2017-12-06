<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://cdn.rawgit.com/vast-engineering/jquery-popup-overlay/1.7.13/jquery.popupoverlay.js"></script>
<div class="ckeckout">
	<div class="container">
		<div class="ckeckout-top">
			<div class=" cart-items heading">
				<div>
					<a href="${pageContext.request.contextPath}/commonMemberList.do?status=1">
					<button style="float:left;">리스트로 돌아가기</button></a><br><br>
				</div>
			</div>
		</div>

<table class="table-board">
		<thead>
		<tr class="success">
			<th class="title">id</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>email</th>
			<th>point</th>
			<th>누적구매금액</th>
			<th>등급</th>
			<th>강제탈퇴</th>
			<th>포인트지급</th>
			</tr>
		</thead>
		<tbody>	
			<tr>
			    <td>${member.id}</td>				
				<td>${member.name}</td>
				<td>${member.phone}</td>
				<td>${member.address}</td>
				<td>${member.email}</td>
				<td>${member.point} </td>
				<td>${member.totalSpent}</td>
				<td>${member.gradeVO.grade}</td>
				<td>
					<form action="${pageContext.request.contextPath}/adminUnregisterMember.do" method="post">
						<input type="hidden" name="id" value="${member.id}">
						<input type="submit" value="삭제">
					</form>
				</td>
				<td>
					<form action="${pageContext.request.contextPath}/adminGivePointToMemberForm.do" method="post">
						<sec:csrfInput/><%-- csrf 토큰 --%>  
						<input type="hidden" name="id" value="${member.id}">
						<input type="submit" value="포인트 지급">
					</form>
				</td>
			</tr>
		</tbody>					
</table>						

	</div>
</div>









