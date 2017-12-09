<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="ckeckout">
	<div class="container">
		<div class="ckeckout-top">
			<div class=" cart-items heading">
				<h3>포인트 지급</h3>
				<hr>
				<div style="float:right;">
					<a href="${pageContext.request.contextPath}/commonMemberList.do?status=1"><button style="color: white;">리스트로 돌아가기</button></a>
				</div>
				<form action="${pageContext.request.contextPath}/adminGivePointToMember.do" method="post">
				<table class="table-board" style="margin-top: 5em!important;">
					<thead>
						<tr class="success">
							<th class="col-sm-2">id</th>
							<th class="col-sm-2">등급</th>
							<th class="col-sm-3">현재 포인트</th>
							<th class="col-sm-3">지급포인트</th>
							<th class="col-sm-2">변경</th>
						</tr>
					</thead>
					<tbody>	
							<tr>
								<td>${member.id}</td>
								<td>${member.gradeVO.grade}</td>
								<td>${member.point}</td>
								<td>
									<input type="text" name="point"><br>
								</td>
								<td>
									<sec:csrfInput/><%-- csrf 토큰 --%>
									<input type="hidden" name="id" value="${member.id}">
									<input type="submit" value="포인트 지급">
								</td>	
							</tr>
					</tbody>
				</table>
				</form>
			</div>
		</div>
	</div>
</div>





