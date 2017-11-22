<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


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
									<button type="button" class="btn btn-info active">1</button>
									<button type="button" class="btn btn-info active">1</button>
									<button type="button" class="btn btn-info active">1</button>
									<button type="button" class="btn btn-info active">1</button>
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
   	alert($(".memberSize1").attr("id"));
   	alert($(".quick_desc").attr("id"));
   	var productCategory=$(".quick_desc").attr("id");
	var pcno="";
	var pno=$(".productPno").attr("id");
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
		data:"psno="+$(this).val()+"&pcno="+pcno+"&pno="+pno,
		success:function(data){	
				//size1
				if(data.size1<2&&data.size1>-2){
				$("#size1").text(data.size1).css("background-color","#ffffff");
				}else if(data.size1<4&&data.size1>-4){
				$("#size1").text(data.size1).css("background-color","#ffffb3");
				}else if(data.size1<6&&data.size1>-6){
				$("#size1").text(data.size1).css("background-color","#ffcc99");
				}else if(data.size1<8&&data.size1>-8){
				$("#size1").text(data.size1).css("background-color","#ff471a");
				}else{
				$("#size1").text(data.size1).css("background-color","#ff0000");
				}
				//size2
				if(data.size2<2&&data.size2>-2){
				$("#size2").text(data.size2).css("background-color","#ffffff");
				}else if(data.size2<4&&data.size2>-4){
				$("#size2").text(data.size2).css("background-color","#ffffb3");
				}else if(data.size2<6&&data.size2>-6){
				$("#size2").text(data.size2).css("background-color","#ffcc99");
				}else if(data.size2<8&&data.size2>-8){
				$("#size2").text(data.size2).css("background-color","#ff471a");
				}else{
				$("#size2").text(data.size2).css("background-color","#ff0000");
				}
				//size3
				if(data.size3<2&&data.size3>-2){
				$("#size3").text(data.size3).css("background-color","#ffffff");
				}else if(data.size3<4&&data.size3>-4){
				$("#size3").text(data.size3).css("background-color","#ffffb3");
				}else if(data.size3<6&&data.size3>-6){
				$("#size3").text(data.size3).css("background-color","#ffcc99");
				}else if(data.size3<8&&data.size3>-8){
				$("#size3").text(data.size3).css("background-color","#ff471a");
				}else{
				$("#size3").text(data.size3).css("background-color","#ff0000");
				}
				//size4
				if(data.size4<2&&data.size4>-2){
				$("#size4").text(data.size4).css("background-color","#ffffff");
				}else if(data.size4<4&&data.size4>-4){
				$("#size4").text(data.size4).css("background-color","#ffffb3");
				}else if(data.size4<6&&data.size4>-6){
				$("#size4").text(data.size4).css("background-color","#ffcc99");
				}else if(data.size4<8&&data.size4>-8){
				$("#size4").text(data.size4).css("background-color","#ff471a");
				}else{
				$("#size4").text(data.size4).css("background-color","#ff0000");
				}
				//size5
				if(data.size5<2&&data.size5>-2){
				$("#size5").text(data.size5).css("background-color","#ffffff");
				}else if(data.size5<4&&data.size5>-4){
				$("#size5").text(data.size5).css("background-color","#ffffb3");
				}else if(data.size5<6&&data.size5>-6){
				$("#size5").text(data.size5).css("background-color","#ffcc99");
				}else if(data.size5<8&&data.size5>-8){
				$("#size5").text(data.size5).css("background-color","#ff471a");
				}else{
				$("#size5").text(data.size5).css("background-color","#ff0000");
				}
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
									<button type="button" class="btn btn-info active">1</button>
									<button type="button" class="btn btn-info active">1</button>
									<button type="button" class="btn btn-info active">1</button>
									<button type="button" class="btn btn-info active">1</button>
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

				</div>
				<!-- 상품번호 -->
				<div class="productPno" id="${requestScope.pvo.pno}"></div>	
				<div class="col-md-7 single-top-right">
					<div class="details-left-info simpleCart_shelfItem">
						<h3>${requestScope.pvo.name}</h3>
						<p class="availability">Availability: <span class="color">In stock</span></p>
						<div class="price_single">
							<%-- <span class="reducedfrom">${requestScope.pvo.price}</span> --%>
							<span class="actual item_price">${requestScope.pvo.price}</span><a href="#">click for offer</a>
						</div>
						<h2 class="quick">상품설명:</h2>
						<p class="quick_desc" id="${requestScope.pvo.category}">${requestScope.pvo.content}</p>
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
					<input type="submit" value="장바구니담기"/>
					<input type="submit" value="즉시구매"/>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
	<br><br>
	<div class="memberSize1" id=<sec:authentication property="principal.id"/>>
		<h3>오차범위</h3>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th style="background-color:#ffffff;">±2cm</th>
					<th style="background-color:#ffffb3;">±4cm</th>
					<th style="background-color:#ffcc99;">±6cm</th>
					<th style="background-color:#ff471a;">±8cm</th>
					<th style="background-color:#ff0000;">±8cm이상</th>
				</tr>
			</thead>
		</table>
		<h3>사이즈비교</h3>
		<table class="table table-bordered">
			<thead>
				<c:choose>
					<c:when test="${requestScope.pvo.category=='하의'}">
						<tr><th>사이즈</th><th>허리</th><th>허벅지</th><th>밑위</th><th>밑단</th><th>하의 총기장</th></tr>
					</c:when>
					<c:otherwise>
						<tr><th>사이즈</th><th>어깨</th><th>가슴</th><th>소매</th><th>암홀</th><th>상의 총기장</th></tr>
					</c:otherwise>
				</c:choose>
			</thead>
			<tbody>
				<c:forEach items="" var="">
					<tr>
						<td id="sizeName"></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</c:forEach>
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