<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!--start-ckeckout-->
   <div class="ckeckout">
      <div class="container">
         <div class="ckeckout-top">
         <div class=" cart-items heading">
          <h3>My Shopping Bag ( ${requestScope.ovoList.size()} )</h3>
          <script type="text/javascript">
          $(document).ready(function() {
        	  var quantity=$(".findQuantity").attr("id");
          	$("#updateBtan").click(function() {
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
        			+"&quantity="+$("#updateQuantity").val();
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
				<li><span>Total Price</span></li>
				<li><span>Note</span></li>
			
               <div class="clearfix"></div>
            </ul>
			<c:forEach items="${requestScope.ovoList}" var="i">
			<div class="findOno" id="${i.ono}"></div>
            <ul class="cart-header">
               <div class="close1"></div>
                  <li class="ring-in"><a href="single.html" >
                  <%-- <img src="${pageContext.request.contextPath}/resources/images/shoes-1.png" class="img-responsive" height="50%" width="50%"/> --%>
             	  <img src="${pageContext.request.contextPath}/resources/upload/${i.orderProductList[0].url}" class="img-responsive" height="50%" width="50%"/>
                  </a>
                  </li>
                  <c:forEach items="${i.orderProductList}" var="j">
                  		<div class="findPdno" id="${j.pdno}"></div>
						<li><span>${j.name}</span></li>
						<li><span>size: ${j.size_name}<br>
						color: ${j.color_name}<br>
						<span id="updateField" style="font-size: 20px;">수량 : 	${j.quantity}</span>
						</span></li>
						<span class="findQuantity" id="${j.quantity}"></span>
				  </c:forEach>
						<li><span>${i.totalprice}</span></li>
						
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