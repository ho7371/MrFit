<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!--start-ckeckout-->
<div class="ckeckout">
	<div class="container">
		<div class="ckeckout-top">
			<div class=" cart-items heading">
				<h3>쪽지 보내기</h3>
				<div class="col-md-2"></div>
				<div class="col-md-8">
				<div class="contact-bottom"> 
					<div class="col-md-6 contact-left"> 
					<form action="${pageContext.request.contextPath}/registerNote.do" method="post">
					<sec:csrfInput/><%-- csrf 토큰 --%>
					<div class="col-md-6 contact-left"> 
						<input type="text" name="receiver" placeholder="받는이" required>
					</div>
					<div class="col-md-6 contact-left">
						<textarea name="content" placeholder="쪽지 본문"></textarea>
						<input type="submit" value="SEND">
					</div>
					</form>	
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
</div>
<!--end-ckeckout-->