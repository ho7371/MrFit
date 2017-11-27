<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!--start-ckeckout-->
   <div class="ckeckout">
      <div class="container">
         <div class="ckeckout-top">
         <div class=" cart-items heading">
          <h3>My Shopping Bag ( ${requestScope.ovo.orderProductList.size()} )</h3>
          <script type="text/javascript">
          $(document).ready(function() {
        	  var quantity=$(".findQuantity").attr("id");
          	$("#updateBtan").click(function() {
          		alert(1);
          		var info="";
          		info="수량 :<input id='updateQuantity' type='text' value='";
          		info+=quantity;
          		info+="' size='5'>";
          		$("#updateField").html(info);        		
          		$("#updateGround").html(
          				"<a href='#' class='add-cart cart-check' id='updateBtn1'>수정완료</a>");
          	});//click
        	$("#updateGround").on("click", "#updateBtn1", function(){
        		location.href="${pageContext.request.contextPath}/updateOrderQuantity.do?ono="
        			+$(".findOno").attr("id")+"&pdno="+$(".findPdno").attr("id")
        			+"&quantity="+$("#updateQuantity").val()+"&price="+$(".findPrice").attr("id");
        	});
          });//ready
          </script>
            <script>$(document).ready(function(c) {
               $('.close1').on('click', function(c){
                  $('.cart-header').fadeOut('slow', function(c){
                     $('.cart-header').remove();
                  });
                  });     
               });
            </script>
         <script>$(document).ready(function(c) {
               $('.close2').on('click', function(c){
                  $('.cart-header1').fadeOut('slow', function(c){
                     $('.cart-header1').remove();
                  });
                  });     
               });
            </script>
            <script>$(document).ready(function(c) {
               $('.close3').on('click', function(c){
                  $('.cart-header2').fadeOut('slow', function(c){
                     $('.cart-header2').remove();
                  });
                  });     
               });
            </script>
            <script type="text/javascript">
            	$(document).ready(function() {
					$("#orderForm").click(function() {
						return confirm("상품을 주문하시겠습니까?");
					}); //click
				}); // ready
            </script>

         <div class="in-check" align="center">
             
            <ul class="unit">
               <li><span>Item</span></li>
				<li><span>Product Name</span></li>		
				<li><span>Size / Color / Quantity</span> </li>
				<li><span>Note</span></li>
			
               <div class="clearfix"></div>
            </ul>
			<%-- <c:forEach items="${requestScope.ovoList}" var="i"> --%>
	      <c:forEach items="${requestScope.ovo.orderProductList}" var="j">
	            <ul class="cart-header">
					<div class="findOno" id="${ovo.ono}"></div>
	                <div class="findPdno" id="${j.pdno}"></div>
	                <li>
	                	<a href="${pageContext.request.contextPath}/deleteCart.do?quantity=${j.quantity}&ono=${ovo.ono}&pdno=${j.pdno}&price=${j.price}" > 
						<div class="close1"></div>
						</a>
	                </li>
	                <li class="ring-in">		
		                <a href="${pageContext.request.contextPath}/findProductDetailByPno.do?pno=${ovo.ono}" >
		                <img alt="사진~~~" src="${pageContext.request.contextPath}/resources/upload/${j.url}" class="img-responsive" height="50%" width="50%"/>
		                </a>
	                </li>
					<li><span>${j.name}</span></li>
					<li>
						<span>size: ${j.size_name}<br> color: ${j.color_name}<br></span>
						<span id="updateField" style="font-size: 20px;">수량 : ${j.quantity}</span>
					</li>
					<li>
						<span class="findQuantity" id="${j.quantity}"></span>
						<span class="findPrice" id="${j.price}"></span>
					</li>
					 <li id="updateGround">
						<a href="#" class="add-cart cart-check" id="updateBtan">수정하기</a>
					 </li>						
	               <div class="clearfix"> </div>
	            </ul>
			</c:forEach>
            <div><a href="orderForm.do" class="add-cart cart-check" id = "orderForm">주문하기</a></div>
         </div>
         </div>  
       </div>
      </div>
   </div>
   <!--end-ckeckout-->