<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<h3><a href="${pageContext.request.contextPath}/commonMemberList.do?status=1">리스트로 돌아가기</a><br><br></h3>
<table class="table table-bordered  table-hover boardlist">
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
			<th>관리</th>
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
					<form action="${pageContext.request.contextPath}/adminUnregisterMember.do">
						<input type="hidden" name="id" value="${member.id}">
						<input type="submit" value="삭제">
					</form>
				</td>
			</tr>
		</tbody>					
</table>						











