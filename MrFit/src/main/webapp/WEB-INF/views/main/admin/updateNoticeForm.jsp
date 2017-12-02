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
				<br><br>
				<form action="${pageContext.request.contextPath}/updateNotice.do">
				<input type="hidden" name="bno" value="${bvo.bno}">
				제목 : <input type="text" id="title" name="title" value="${bvo.title}"><br>
				내용<br>
				<textarea rows="20" cols="90" id="content" name="content">
				${bvo.content}
				</textarea>	<br>
				<input type="submit" value="공지사항 수정">
					</form>			
					
			
				</div>
			</div>
		</div>
	</div>
	
<!--end-ckeckout-->