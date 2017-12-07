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
<script>
	$(document).ready(function(c) {
		$("#registerButton").click(function() {
			alert($("#selectStatusType :selected").val());
			$("#status").val($("#selectStatusType :selected").val());
		});//click
	});//ready
</script>

<!--start-ckeckout-->
<div class="ckeckout">
	<div class="container">
		<div class="ckeckout-top">
			<div style="float: left; width: 33%">
				<img alt="고객문의 등록" style="height:300px; width:300px;" id="inquiryRegister"
	 				src="${pageContext.request.contextPath}/resources/images/고객문의아이콘.png">
			</div>
			<div class="cart-items heading" style="float: left; width: 66%">
				<!-- <h3><font style="text-align: center;">고객문의 등록</font></h3> -->
				<div>
					<select id="selectStatusType">
						<option selected="selected" value="public">공개글</option>
						<option value="private">비밀글</option>
					</select>
				</div>
				<div>
				<div class="contact-bottom"> 
					<form action="${pageContext.request.contextPath}/registerInquiry.do" method="post">
						<sec:csrfInput/><%-- csrf 토큰 --%>
						<div class="col-md-6 contact-left">
						<input type="hidden" name = "status" value = "" id = "status">
						<input type="text" name="title" placeholder="제목" size="39" required="required">					
						<textarea name="content" placeholder="고객문의 본문"></textarea>
						<input type="submit" value="고객문의 등록" id = "registerButton">
					</div>
					</form>	
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<!--end-ckeckout-->







