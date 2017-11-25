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
						<a href="${pageContext.request.contextPath}/registerNoticeForm.do">공지사항 등록</a>
					</c:if>
				<div class="in-check">
					<ul class="unit">
						<li><span>No</span></li>
						<li><span>Title</span></li>
						<li><span>Writer</span></li>
						<li><span>hit</span></li>
						<li><span>작성일</span></li>
						<div class="clearfix"></div>
					</ul>
					
					<%--공지사항 읽어오기 백단 완료되면 이것 사용함
						<c:forEach items="" var="">
							<ul class="cart-header">
								<li><span>1</span></li>
								<li><span>공지사항 1번</span></li>
								<li><span>관리자</span></li>
								<li><span>조회수</span></li>
								<li><span>2017/11/19</span></li>
								<c:if test="${isAdmin}">
									<a href="${pageContext.request.contextPath}/deleteNotice.do?글번호=${글번호}">${글번호} 공지 삭제</a>
								</c:if>
								<div class="clearfix"></div>
							</ul>
						</c:forEach> 
					--%>
					
					<ul class="cart-header">
						<li><span>1</span></li>
						<li><span>공지사항 1번</span></li>
						<li><span>관리자</span></li>
						<li><span>조회수</span></li>
						<li><span>2017/11/19</span></li>
						<div class="clearfix"></div>
					</ul>
					<ul class="cart-header">
						<li><span>2</span></li>
						<li><span>공지사항 2번</span></li>
						<li><span>관리자</span></li>
						<li><span>조회수</span></li>
						<li><span>2017/11/19</span></li>
						<div class="clearfix"></div>
					</ul>
					<ul class="cart-header">
						<li><span>3</span></li>
						<li><span>공지사항 3번</span></li>
						<li><span>관리자</span></li>
						<li><span>조회수</span></li>
						<li><span>2017/11/19</span></li>
						<div class="clearfix"></div>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!--end-ckeckout-->