<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script>
	$(document).ready(function(c) {
		$('.close1').on('click', function(c) {
			$('.cart-header').fadeOut('slow', function(c) {
				$('.cart-header').remove();
			});
		});
	});
</script>
<script>
	$(document).ready(function(c) {
		$('.close2').on('click', function(c) {
			$('.cart-header1').fadeOut('slow', function(c) {
				$('.cart-header1').remove();
			});
		});
	});
</script>
<script>
	$(document).ready(function(c) {
		$('.close3').on('click', function(c) {
			$('.cart-header2').fadeOut('slow', function(c) {
				$('.cart-header2').remove();
			});
		});
	});
</script>
<!--start-ckeckout--> 
<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
<sec:authorize access="hasRole('ROLE_MEMBER')" var="isMember" />
<div class="ckeckout">
	<div class="container">
		<div class="ckeckout-top">
			<div class=" cart-items heading">
				<h3>고객문의</h3>
				<table class="table-board">
					<thead>
						<tr>
							<th>No</th><th>Title</th><th>Writer</th><th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.list}" var="i">
							<tr>
								<td>${i.bno}</td>
								<td>
									<c:choose>
										<c:when test="${isAdmin}">
											<a href="${pageContext.request.contextPath}/inquiryDetail.do?bno=${i.bno}">${i.title}</a>
										</c:when>
										<c:when test="${i.id != mvo.id && i.security=='private' && isMember}">
											비밀글입니다.
										</c:when>
										<c:otherwise>
											<a href="${pageContext.request.contextPath}/inquiryDetail.do?bno=${i.bno}">${i.title}</a>
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