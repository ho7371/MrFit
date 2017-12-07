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
			<div class=" cart-items heading">
				<h3>고객문의 등록</h3>
				<hr>
				
				<div class="col-md-4" >
				<br><br><br>
					<img alt="고객문의 등록" style="height:250px; width:250px;" id="inquiryRegister"
	 				src="${pageContext.request.contextPath}/resources/images/고객문의아이콘.png">
				</div>				
				<div class="col-md-8 contact-left"  style="width: 60%;">
				<div>
					<select id="selectStatusType">
						<option selected="selected" value="public">공개글</option>
						<option value="private">비밀글</option>
					</select>
				</div>				
				<div class="contact-bottom"> 
					<form action="${pageContext.request.contextPath}/registerInquiry.do" method="post">
					<sec:csrfInput/><%-- csrf 토큰 --%>
						<input type="hidden" name = "status" value = "" id = "status">
						<input type="text" name="title" placeholder="제목" size="39" required="required">					
						<textarea name="content" placeholder="고객문의 본문"></textarea>
						<input type="submit" value="고객문의 등록" id = "registerButton" style="float:right;">
					</form>	
					<div class="clearfix"> </div>
				</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--end-ckeckout-->