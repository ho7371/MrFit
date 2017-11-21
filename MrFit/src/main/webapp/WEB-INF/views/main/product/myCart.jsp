<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--start-ckeckout-->
   <div class="ckeckout">
      <div class="container">
         <div class="ckeckout-top">
         <div class=" cart-items heading">
          <h3>My Shopping Bag ( ${requestScope.ovoList.size()} )</h3>
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
            
         <div class="in-check" align="center">
            <ul class="unit">
               <li><span>Item</span></li>
				<li><span>Product Name</span></li>		
				<li><span>Size / Color / Quantity</span> </li>
				<li><span>Total Price</span></li>
				<li><span>Note</span></li>
               <div class="clearfix"> </div>
            </ul>
			<c:forEach items="${requestScope.ovoList}" var="i">
            <ul class="cart-header">
               <div class="close1"> </div>
                  <li class="ring-in"><a href="single.html" >
                  <img src="${pageContext.request.contextPath}/resources/images/shoes-1.png" class="img-responsive" height="50%" width="50%"/>
                  </a>
                  </li>
                  <c:forEach items="${i.orderProductList}" var="j">
						<li><span>${j.name}</span></li>
						<li><span>${j.size_name} / ${j.color_name}  <input type = "number" value ="${j.quantity}" id = "changeQuantity" size="5"></span></li>
				  </c:forEach>
						<li><span>${i.totalprice}</span></li>
						<li><a href="#" class="add-cart cart-check">주문하기</a></li>
               <div class="clearfix"> </div>
            </ul>
            </c:forEach>
            <%-- <ul class=" cart-header1">
               <div class="close2"> </div>
                  <li class="ring-in"><a href="single.html" >
                  <!-- <img src="images/s-2.jpg" class="img-responsive" alt=""> -->
                  <img src="${pageContext.request.contextPath}/resources/images/shoes-2.png" class="img-responsive" height="50%" width="50%"/>
                  </a>
                  </li>
                  <li><span>Elliot Shoes</span></li>
                  <li><span>$ 300.00</span></li>
                  <li><span>In Stock</span></li>
                  <li> <a href="single.html" class="add-cart cart-check">ADD TO CART</a></li>
                  <div class="clearfix"> </div>
            </ul>
            <ul class="cart-header2">
               <div class="close3"> </div>
                  <li class="ring-in"><a href="single.html" >
                  <!-- <img src="images/s-4.jpg" class="img-responsive" alt=""> -->
                  <img src="${pageContext.request.contextPath}/resources/images/shoes-3.png" class="img-responsive" height="50%" width="50%"/>
                  </a>
                  </li>
                  <li><span>Woo Dress</span></li>
                  <li><span>$ 360.00</span></li>
                  <li><span>In Stock</span></li>
                  <li> <a href="single.html" class="add-cart cart-check">ADD TO CART</a></li>
                  <div class="clearfix"> </div>
            </ul> --%>
         </div>
         </div>  
       </div>
      </div>
   </div>
   <!--end-ckeckout-->