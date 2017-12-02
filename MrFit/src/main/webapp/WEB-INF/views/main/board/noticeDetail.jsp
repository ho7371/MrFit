<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<div class="ckeckout">
	<div class="container">
		<div class="ckeckout-top">
			<div class=" cart-items heading">
				<h3>공지사항</h3>
				<!-- 관리자 입장시 공지사항 등록/삭제 버튼 생성 -->
				<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
					<c:if test="${isAdmin}">
					<div style="float:right;">
						<a href="${pageContext.request.contextPath}/updateNoticeForm.do?bno=${bvo.bno }"><button style="margin-bottom: 20px;">공지사항 수정</button></a>
						</div>
					</c:if>
				<table class="table-board">
					<thead>
						<tr>
							<th>No</th><th>Title</th><th>Writer</th><th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${bvo.bno}</td><td>${bvo.title}</td><td>${bvo.id}</td><td>${bvo.regdate}</td>
						</tr>
					</tbody>
					<thead>
						<tr><th colspan="4">본문</th></tr>
					</thead>
					<tbody>
						<tr><td colspan="4" style="height: 400px;">${bvo.content}</td></tr>
					</tbody>
				</table>
				<br>
								<c:if test="${isAdmin}">
									<a href="${pageContext.request.contextPath}/deleteNotice.do?bno=${bvo.bno}"><button style="margin-bottom: 20px;">${bvo.bno}번 공지 삭제</button></a>
								</c:if> 
					
			
				</div>
			</div>
		</div>
	</div>
</div>
<!--end-ckeckout-->