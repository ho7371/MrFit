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
		$("#equalMemberInfo").click(function() {
			if($("#name").val()=="" && $("#phone").val()=="" && $("#address").val()==""){
				$("#name").val($("#memberName").text());
				$("#phone").val($("#memberPhone").text());
				$("#address").val($("#memberAddress").text());
			}else{
				$("#name").val("");
				$("#phone").val("");
				$("#address").val("");
			}	
		}); //click
		$("#order").click(function() {
			if($("#agreeOrder").is(':checked')){
				return confirm("구매를 진행 하시겠습니까?");
			}else{	
				alert("구매 동의를 하시기 바랍니다.");
				return false;
			}
		}); // click
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
<%-- 주문 정보 --%>
	         <div class = "in-check">
	         	<ul class="unit">
	               <li><span></span></li>
					<li><span></span></li>		
					<li><span>주문 정보</span> </li>
					<li><span></span></li>
	               <div class="clearfix"></div>
	            </ul>
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
		          			<th>이름 : <span id = "memberName">${ovoList[0].memberVO.name}</span>  </th>
		          		</tr>
		          		<tr>
		          			<th>등급 : [ ${ovoList[0].memberVO.gradeVO.grade} ] &nbsp;  적립 비율 : [ ${ovoList[0].memberVO.gradeVO.percent} ]</th>
		          		</tr>
		          		<tr>
		          			<th>이메일 : ${ovoList[0].memberVO.email}</th>
		          		</tr>
		          		<tr>
		          			<th>연락처 : <span id = "memberPhone" value ="${ovoList[0].memberVO.phone}">${ovoList[0].memberVO.phone}</span></th>
		          		</tr>
		          		<tr>
		          			<th>주소 : <span id = "memberAddress" value ="${ovoList[0].memberVO.address}">${ovoList[0].memberVO.address}</span></th>
		          		</tr>
		          	</table>
		         </div>
	          </div>
<%-- 배송지 정보 --%>
	          <div class = "in-check">
	         	<ul class="unit">
	               <li><span></span></li>
					<li><span></span></li>		
					<li><span >배송지 정보</span> </li>
					<li><span></span></li>
					<li><span><input type = "checkbox" id = "equalMemberInfo"> 위 정보와 같음</span></li>
	               <div class="clearfix"></div>
	            </ul>
	            <div>
		          	<table class="cart-header">
		          		<tr>
		          			<th>이름 : <input type = "text" name = "name" id = "name"> </th>
		          		</tr>
		          		<tr>
		          			<th>연락처 : <input type = "text" name = "phone" id = "phone"> </th>
		          		</tr>
		          		<tr>
		          			<th>주소 : <input type = "text" name = "address" id = "address"> </th>
		          		</tr>
		          	</table>
		         </div>
	          </div>
<%-- 결제 정보 --%>
			  <div class = "in-check">
	         	<ul class="unit">
	               <li><span></span></li>
					<li><span></span></li>		
					<li><span >결제 정보</span> </li>
					<li><span></span></li>
	               <div class="clearfix"></div>
	            </ul>
	            <div>
	            	<input type = "radio" name = "" id = "">무통장입금 &nbsp;&nbsp;
	            	<input type = "radio" name = "" id = "">카카오페이 &nbsp;&nbsp;
	            	<input type = "radio" name = "" id = "">추가1 &nbsp;&nbsp;
	            	<input type = "radio" name = "" id = "">추가2 &nbsp;&nbsp;
	            </div>
	            <div>
		          	<table class="cart-header">
		          		<tr>
		          			<th></th>
		          		</tr>
		          		<tr>
		          			<th></th>
		          		</tr>
		          		<tr>
		          			<th></th>
		          		</tr>
		          	</table>
		         </div>
	          </div>	          
         </div>  
         <div align="right">
         	<input type = "checkbox" id = "agreeOrder" name = "agreeOrder"> 결제정보를 확인했으며, 구매진행에 동의합니다 &nbsp;
         	<a href="order.do" class="add-cart cart-check" id = "order">주문하기</a>
         </div>
       </div>
      </div>
   </div>
   <!--end-ckeckout-->