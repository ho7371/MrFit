<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!--start-ckeckout-->
<div class="ckeckout">
	<div class="container">
		<div class="ckeckout-top">
			<div class=" cart-items heading">
				<h3>공지사항 등록</h3>
				<form action="${pageContext.request.contextPath}/registerNotice.do">
				제목 : <input type="text" id="title" name="title"><br>
				내용<br>
				<textarea rows="30" cols="30" id="content" name="content">
				</textarea>	<br>
				<input type="submit" value="상품 등록">
					</form>			
					
			
				</div>
			</div>
		</div>
	</div>
	
<!--end-ckeckout-->