<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal.id"/> --%>
<!--start-single-->
	<div class="single contact">
		<div class="container">
			<div class="single-main">
				<div class="col-md-9 single-main-left">
				<div class="sngl-top">
					<div class="col-md-5 single-top-left">	
 						<div class="flexslider" >
							<ul class="slides">
								<li data-thumb="images/s1.jpg" >
									<img height=350px width=250px src="${pageContext.request.contextPath}/resources/images/s1.jpg" />
						<%--		</li>
							<li data-thumb="images/s2.jpg">
									<img height=350px width=250px src="${pageContext.request.contextPath}/resources/images/s2.jpg" />
								</li>
								<li data-thumb="images/s3.jpg">
									<img height=350px width=250px src="${pageContext.request.contextPath}/resources/images/s3.jpg" />
								</li>
								<li data-thumb="images/s4.jpg">
									<img height=350px width=250px src="${pageContext.request.contextPath}/resources/images/s4.jpg" />
								</li> --%>
							</ul> 
						</div> 
<!-- FlexSlider -->
  <script defer src="js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
<script type="text/javascript">
$(document).ready(function(){
	var pcno="";
	//색상을 클릭했을 때 색상에 맞는 size를 ajax를 이용해 가지고 오는 이벤트
	$("#colorCheck").change(function() {
		pcno=$(this).val();
		if($(this).val()==0){
			return false;
		}
		$("#slsSize").html("");
				$.ajax({
				type:"get",
				url:"${pageContext.request.contextPath}/findProductDetailByColorAjax.do",
				dataType:"json",
				data:"pcno="+$(this).val(),
				success:function(data){	
					var infoSize="";
					infoSize="<h3>사이즈</h3>"
					infoSize+="<select id='sizeSelectAjax'>";
					infoSize+="<option>-[필수] 옵션을 선택해주세요-</option>";
					infoSize+="<option>-----------------------------------------</option>";
					for(var i=0;i<data.length;i++){	
					infoSize+="<option value='"
					infoSize+=data[i].psno;
					infoSize+="'>";
					infoSize+="Size : "+data[i].size_name;
					infoSize+="</option>";
					}   
					infoSize+="</select>";
					$("#slsSize").append(infoSize);
				}//success
			});//ajax
	});//change
	
	// 동적으로 생긴 사이즈 와 회원의 사이즈를 비교하기 위한 On 이벤트 
	$("#slsSize").on("change", "#sizeSelectAjax", function(){
	alert($(this).val());	
	$.ajax({
		type:"get",
		url:"${pageContext.request.contextPath}/findProductDetailBySizeAjax.do",
		dataType:"json",
		data:"psno="+$(this).val()+"&pcno="+pcno,
		success:function(data){
			alert(1);
		}//success
	});//ajax
	
	});//on 이벤트
});//ready
</script>
<script>
// Can also be used with $(document).ready()
$(window).load(function() {
  $('.flexslider').flexslider({
    animation: "slide",
    controlNav: "thumbnails"
  });
});
</script>
				</div>	
				<div class="col-md-7 single-top-right">
					<div class="details-left-info simpleCart_shelfItem">
						<h3>${requestScope.pvo.name}</h3>
						<p class="availability">Availability: <span class="color">In stock</span></p>
						<div class="price_single">
							<%-- <span class="reducedfrom">${requestScope.pvo.price}</span> --%>
							<span class="actual item_price">${requestScope.pvo.price}</span><a href="#">click for offer</a>
						</div>
						<h2 class="quick">상품설명:</h2>
						<p class="quick_desc">${requestScope.pvo.content}</p>
						<ul class="product-colors">
							<h3>색상 </h3>
									<select id="colorCheck">
									<option value="0">-[필수] 옵션을 선택해주세요-</option>
									<option value="0">-----------------------------------------</option>
									<c:forEach items="${requestScope.clist}" var="clist">
									<option class="colorSelect" value="${clist.pcno}">${clist.color_name}</option>
									</c:forEach>
								</select> 
							<div class="clear" id="slsSize"> 
							<h3>사이즈</h3>
							<select id="sizeSelectAjax">
							<option>-[필수] 옵션을 선택해주세요-</option>
							<option>-----------------------------------------</option>
							</select> 
							</div>
						</ul>
					
						<div class="quantity_box">
							<ul class="product-qty">
								<span>주문수량:</span>
								<!-- quantity 주문갯수 -->
								<input type="number" name="quantity" min="0">
							</ul>
						</div>
					<div class="clearfix"> </div>
				<div class="single-but item_add">
					<input type="submit" value="add to cart"/>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	<div>
	<table>
	<thead>
	<tr>
	<th></th><th></th><th></th><th></th><th></th><th></th>
	</tr>
	</thead>
	<tbody>
	<tr>
	</tr>
	</tbody>
	</table>
	</div>
	
					<div class="latest products">
						<div class="product-one">
							<div class="col-md-4 product-left single-left"> 
								<div class="p-one simpleCart_shelfItem" style="width: 250px; height: 165px; overflow: hidden"  >
									
									<a href="#">
								<img style="height: 80%; width: auto;" src="${pageContext.request.contextPath}/resources/images/s2.jpg" alt="" />
								<div class="mask mask1">
									<span>Quick View</span>
								</div>
							</a>
		
							</div>
							<div class="col-md-4 product-left single-left"> 
								<div class="p-one simpleCart_shelfItem">
									<a href="#">
								<img src="images/shoes-2.png" alt="" />
								<div class="mask mask1">
									<span>Quick View</span>
								</div>
							</a>
									<h4>Aenean placerat</h4>
									<p><a class="item_add" href="#"><i></i> <span class=" item_price">$329</span></a></p>
									
								</div>
							</div>
							<div class="col-md-4 product-left single-left"> 
								<div class="p-one simpleCart_shelfItem">
									<a href="#">
								<img src="images/shoes-3.png" alt="" />
								<div class="mask mask1">
									<span>Quick View</span>
								</div>
							</a>
									<h4>Aenean placerat</h4>
									<p><a class="item_add" href="#"><i></i> <span class=" item_price">$329</span></a></p>									
								</div>
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="product-one">
							<div class="col-md-4 product-left single-left"> 
								<div class="p-one simpleCart_shelfItem">
									<a href="#">
								<img src="images/shoes-13.png" alt="" />
								<div class="mask mask1">
									<span>Quick View</span>
								</div>
							</a>
									<h4>Aenean placerat</h4>
									<p><a class="item_add" href="#"><i></i> <span class=" item_price">$329</span></a></p>									
								</div>
							</div>
							<div class="col-md-4 product-left single-left"> 
								<div class="p-one simpleCart_shelfItem">
									<a href="#">
								<img src="images/shoes-5.png" alt="" />
								<div class="mask mask1">
									<span>Quick View</span>
								</div>
							</a>
									<h4>Aenean placerat</h4>
									<p><a class="item_add" href="#"><i></i> <span class=" item_price">$329</span></a></p>									
								</div>
							</div>
							<div class="col-md-4 product-left single-left"> 
								<div class="p-one simpleCart_shelfItem">
									<a href="#">
								<img src="images/shoes-6.png" alt="" />
								<div class="mask mask1">
									<span>Quick View</span>
								</div>
								</a>
									<h4>Aenean placerat</h4>
									<p><a class="item_add" href="#"><i></i> <span class=" item_price">$329</span></a></p>				
								</div>
							</div>
							<div class="clearfix"> </div>
						</div>
					</div>
				</div>
				<!-- <div class="col-md-3 single-right">
					<h3>Categories</h3>
					<ul class="product-categories">
						<li><a href="#">Blucher Shoe</a> <span class="count">(14)</span></li>
						<li><a href="#">Clog Shoe</a> <span class="count">(2)</span></li>
						<li><a href="#">Snow Boot Shoe</a> <span class="count">(2)</span></li>
						<li><a href="#">Galesh Shoe</a> <span class="count">(11)</span></li>
						<li><a href="#">pataugas Shoe</a> <span class="count">(3)</span></li>
						<li><a href="#">Jazz Shoe</a> <span class="count">(3)</span></li>
					</ul>
					<h3>Colors</h3>
					<ul class="product-categories">
						<li><a href="#">Green</a> <span class="count">(14)</span></li>
						<li><a href="#">Blue</a> <span class="count">(2)</span></li>
						<li><a href="#">Red</a> <span class="count">(2)</span></li>
						<li><a href="#">Gray</a> <span class="count">(8)</span></li>
						<li><a href="#">Green</a> <span class="count">(11)</span></li>
						<li><a href="#">Yellow</a> <span class="count">(2)</span></li>
					</ul>
					<h3>Sizes</h3>
					<ul class="product-categories">
						<li><a href="#">5.5</a> <span class="count">(14)</span></li>
						<li><a href="#">6</a> <span class="count">(2)</span></li>
						<li><a href="#">6.5</a> <span class="count">(2)</span></li>
						<li><a href="#">7</a> <span class="count">(8)</span></li>
						<li><a href="#">7.5</a> <span class="count">(11)</span></li>
					</ul>
					<h3>Price</h3>
					<ul class="product-categories p1">
						<li><a href="#">600$-700$</a> <span class="count">(14)</span></li>
						<li><a href="#">700$-800$</a> <span class="count">(2)</span></li>
						<li><a href="#">800$-900$</a> <span class="count">(2)</span></li>
						<li><a href="#">900$-1000$</a> <span class="count">(8)</span></li>
						<li><a href="#">1000$-1100$</a> <span class="count">(11)</span></li>
					</ul>
				</div> -->
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--end-single-->