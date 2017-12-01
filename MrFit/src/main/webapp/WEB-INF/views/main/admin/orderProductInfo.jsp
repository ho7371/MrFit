<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="in-check" align="center">
            <ul class="unit">
            	<li><span>이미지</span></li>
               <li><span>상품번호</span></li>
				<li><span>상품명</span></li>		
				<li><span>Size / Color / Quantity</span> </li>
				<li><span>가격</span></li>
               <div class="clearfix"></div>
            </ul>
			<c:forEach items="${requestScope.list}" var="i">
	            <ul class="cart-header">
	            	<li><a href="single.html" >
                 	 <img src="${pageContext.request.contextPath}/resources/upload/${i.url}" class="img-responsive" height="50%" width="50%"/></a>
                  	</li>
	                <li><span>${i.pno}</span></li>
	                <li><span>${i.name}</span></li>
	                <li><span>${i.size_name} / ${i.color_name} / ${i.quantity}</span></li>
	                <li><span>${i.price}</span></li>
	               <div class="clearfix"> </div>
	            </ul>
            </c:forEach>
</div>