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
				<h3>공지사항 등록</h3>
				<hr>
				
				<div class="col-md-3" >
				<br><br><br>
					<img alt="" src="${pageContext.request.contextPath}/resources/images/notice_image.png">
				</div>				
				<div class="col-md-8 contact-left"  style="width: 50%;">				
				<div class="contact-bottom"> 
					<form action="${pageContext.request.contextPath}/registerNotice.do" method="post">
					<sec:csrfInput/><%-- csrf 토큰 --%>
						<input type="text" name="title" placeholder="제목"  required><br>
				
						<textarea name="content" placeholder="공지사항 본문" ></textarea>
						<br><input type="submit" style="float:right;"  value="공지사항 등록" >
					
					</form>	
					<div class="clearfix"> </div>
				</div>
				<!-- <div class="col-md-2"></div> -->
				</div>
			</div>
		</div>
	</div>
</div>
<!--end-ckeckout-->