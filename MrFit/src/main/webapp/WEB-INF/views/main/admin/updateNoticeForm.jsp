<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!--start-ckeckout-->
<div class="ckeckout">
	<div class="container">
		<div class="ckeckout-top">
			<div class=" cart-items heading">
				<h3>공지사항 수정</h3>
				<div class="col-md-3">
				<br><br><br>
					<img alt="" align="middle" src="${pageContext.request.contextPath}/resources/images/notice_image.png">
				</div>
				
				<form action="${pageContext.request.contextPath}/updateNotice.do" >
				<input type="hidden" name="bno" value="${bvo.bno}">
				제목 : <input type="text" id="title" name="title" value="${bvo.title}"><br>
				내용<br>
				<textarea rows="15" cols="60" id="content" name="content">
				${bvo.content}
				</textarea>	<br>
				<input type="submit" style="margin-left: 55%"  value="공지사항 수정">
					</form>			
					
			
				</div>
			</div>
		</div>
	</div>
	
<!--end-ckeckout-->