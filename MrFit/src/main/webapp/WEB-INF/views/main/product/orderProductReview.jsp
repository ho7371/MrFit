<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<h2>상품리뷰작성</h2>
<form action="${pageContext.request.contextPath}/orderProductReview.do">
	<input type="hidden" name="pdno" value="${prvo.pdno}">
상품 명 : ${prvo.name}<br>
상품 색상 : ${prvo.color_name}<br>
상품 사이즈 : ${prvo.size_name}<br>
	<input type="hidden" name="id" value="<sec:authentication property="principal.id"/>"><br>
상품 리뷰 : <input type="text" name="content" value="작성해주세요" required="required"><br>
	<input type="submit" value="리뷰작성">
</form>





