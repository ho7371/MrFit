<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!--start-ckeckout--> 
<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
<sec:authorize access="hasRole('ROLE_MEMBER')" var="isMember" />
<div class="ckeckout">
	<div class="container">
		<div class="ckeckout-top">
			<div class=" cart-items heading">
				<h3>고객문의</h3>
				<sec:authorize access="hasRole('ROLE_MEMBER')" var="isMember" />
					<c:if test="${isMember}">
						<div style="float:right;">
							<a href="${pageContext.request.contextPath}/registerInquiryForm.do"><button style="margin-bottom: 20px;">고객문의 등록</button></a>
						</div>
					</c:if>
				<table class="table-board">
					<thead>
						<tr>
							<th>No</th><th>Title</th><th>Writer</th><th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.list}" var="i">
							<tr>
								<td>${i.iqno}</td>
								<td>
									<c:choose>
										<c:when test="${isAdmin}">
											<a href="${pageContext.request.contextPath}/inquiryDetail.do?iqno=${i.iqno}">${i.title}</a>
										</c:when>
										<c:when test="${i.id != mvo.id && i.security=='private' && isMember}">
											비밀글입니다.
										</c:when>
										<c:otherwise>
											<a href="${pageContext.request.contextPath}/inquiryDetail.do?iqno=${i.iqno}">${i.title}</a>
										</c:otherwise>
									</c:choose>
								</td>
								<td>${i.id}</td>
								<td>${i.regdate}</td>
							</tr>
						</c:forEach> 
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!--end-ckeckout-->