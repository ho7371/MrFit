<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	$(document).ready(function(c) {
		var totalprice = 0;
		<c:forEach items="${requestScope.ovoList}" var="list">
			totalprice += ${list.totalprice}
		</c:forEach>
		$("#totalprice").text("총 상품금액 : "+totalprice);
	});// ready
</script>
<!--start-ckeckout-->
   <div class="ckeckout">
      <div class="container">
         <div class="ckeckout-top">
         <div class=" cart-items heading">
          <div class="in-check">
          <h3>주문할 상품</h3>
          </div>
          <%-- 상품 리스트 --%>
          <div class="in-check" align="center">
            <ul class="unit">
               <li><span>Item</span></li>
				<li><span>Product Name</span></li>		
				<li><span>Size / Color / Quantity</span> </li>
				<li><span>Total Price</span></li>
               <div class="clearfix"> </div>
            </ul>
			<c:forEach items="${requestScope.ovoList}" var="i">
            <ul class="cart-header">
                  <li class="ring-in"><a href="single.html" >
                  <img src="${pageContext.request.contextPath}/resources/images/shoes-1.png" class="img-responsive" height="50%" width="50%"/>
                  </a>
                  </li>
                  <c:forEach items="${i.orderProductList}" var="j">
						<li><span>${j.name}</span></li>
						<li><span>${j.size_name} / ${j.color_name} / ${j.quantity}</span></li>
				  </c:forEach>
						<li><span>${i.totalprice}</span></li>
               <div class="clearfix"> </div>
            </ul>
            </c:forEach>
         </div>
         	<%-- 결제 정보 --%>
	         <div class = "in-check">
	         	<ul class="unit">
	               <li><span></span></li>
					<li><span></span></li>		
					<li><span>결제 정보</span> </li>
					<li><span></span></li>
	               <div class="clearfix"></div>
	            </ul>
	           <%--  <ul class="cart-header">
	            	<li><span></span></li>
					<li><span></span></li> 
		            <li><span ></span></li>
		            <li><span></span></li>
		            <div class="clearfix"> </div>
	            </ul>
	            <ul class="cart-header">
		            <li><span></span></li>
		            <li><span></span></li>
		            <li ><span>
		            		포인트 : <input type = "text" value = "0" size="7" width="4">  ( 사용 가능 포인트 금액 : ${ovoList[0].memberVO.point } )
		            </span></li>
		            <li><span></span></li>
		            <div class="clearfix"> </div>
	            </ul> --%>
	            <table class="cart-header">
	            	<tr>
	            		<th>
	            			<div id = "totalprice" align="center"></div>
	            		</th>
	            	</tr>
	            	<tr>
	            		<th>
	            			<div align="center">포인트 : <input type = "text" value = "0" size="7" width="4">  ( 사용 가능 포인트 금액 : ${ovoList[0].memberVO.point } )</div>
	            		</th>
	            	</tr>
	            </table>
	          </div>
	          <%-- 주문자 정보 --%>
	         <div class = "in-check">
	         	<ul class="unit">
	               <li><span></span></li>
					<li><span></span></li>		
					<li><span>주문자 정보</span> </li>
					<li><span></span></li>
	               <div class="clearfix"></div>
	            </ul>
	            <div>
		          	<table class="cart-header">
		          		<tr>
		          			<th>이름 : ${ovoList[0].memberVO.name} </th>
		          		</tr>
		          		<tr>
		          			<th>등급 : [ ${ovoList[0].memberVO.gradeVO.grade} ] &nbsp;  적립 비율 : [ ${ovoList[0].memberVO.gradeVO.percent} ]</th>
		          		</tr>
		          		<tr>
		          			<th>이메일 : ${ovoList[0].memberVO.email}</th>
		          		</tr>
		          		<tr>
		          			<th>연락처 : ${ovoList[0].memberVO.phone}</th>
		          		</tr>
		          		<tr>
		          			<th>주소 : ${ovoList[0].memberVO.address}</th>
		          		</tr>
		          	</table>
		         </div>
	          </div>
	          <%-- 배송지 정보 --%>
	          <div class = "in-check">
	         	<ul class="unit">
	               <li><span></span></li>
					<li><span></span></li>		
					<li><span>주문자 정보</span> </li>
	               <div class="clearfix"></div>
					<li><span><input type = "checkbox" id = "equalMemberInfo"> 위 정보와 같음</span></li>
	            </ul>
	            <div>
		          	<table class="cart-header">
		          		<tr>
		          			<th>이름 : <input type = "text" name = "name"> </th>
		          		</tr>
		          		<tr>
		          			<th>연락처 : <input type = "text" name = "phone"> </th>
		          		</tr>
		          		<tr>
		          			<th>주소 : <input type = "text" name = "name"> </th>
		          		</tr>
		          		<!-- <tr>
		          			<th>배송메시지 : <input type = "text" name = "name"> </th>
		          		</tr>
		          		<tr>
		          			<th>이름 : <input type = "text" name = "name"> </th>
		          		</tr> -->
		          	</table>
		         </div>
	          </div>
         </div>  
         <div align="right"><a href="orderForm.do" class="add-cart cart-check" id = "orderForm">주문하기</a></div>
       </div>
      </div>
   </div>
   <!--end-ckeckout-->