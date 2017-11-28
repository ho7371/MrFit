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
				
				<div class="in-check">
					<ul class="unit">
						<li><span>No</span></li>
						<li><span>Title</span></li>
						<li><span>Writer</span></li>
						<li><span>작성일</span></li>
						<div class="clearfix"></div>
					</ul>
					<c:forEach items="${requestScope.list}" var="i">
						<ul class="cart-header">
							<li><span>${i.bno}</span></li>
							<c:choose>
								<c:when test="${i.id != mvo.id && i.security=='private'}">
									<li><span>비밀글입니다.</span></li>
								</c:when>
								<c:otherwise>
									<li><span><a href="${pageContext.request.contextPath}/inquiryDetail.do?bno=${i.bno}">${i.content}</a></span></li>
								</c:otherwise>
							</c:choose>
							
							<li><span>${i.id}</span></li>
							<li><span>${i.regdate}</span></li>
							<div class="clearfix"></div>
						</ul>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
<!--end-ckeckout-->