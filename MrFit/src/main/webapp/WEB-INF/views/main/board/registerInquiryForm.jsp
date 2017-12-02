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
				<h3>고객문의 등록</h3>
				<div class="col-md-2"></div>
				<div class="col-md-8">
				<div class="contact-bottom"> 
					<form action="${pageContext.request.contextPath}/registerInquiry.do" method="post">
						<sec:csrfInput/><%-- csrf 토큰 --%>
						<div class="col-md-6 contact-left"> 
						<input type="text" name="title" placeholder="제목" size="39" required>					
						<textarea name="content" placeholder="고객문의 본문"></textarea>
						<input type="submit" value="고객문의 등록">
					</div>
					</form>	
					<div class="clearfix"> </div>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
</div>
<!--end-ckeckout-->