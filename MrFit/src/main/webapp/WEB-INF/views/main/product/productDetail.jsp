<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://cdn.rawgit.com/vast-engineering/jquery-popup-overlay/1.7.13/jquery.popupoverlay.js"></script>

<sec:authorize access="hasRole('ROLE_MEMBER')" var="isMember" />
<c:if test="${isMember}">
	<sec:authentication property='principal.id' var="mId"/>
</c:if>

<!-- FlexSlider -->
<script defer src="js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>  
.tab_item:target {
            display:block;  }
        .tab_item:not(:target) {
            display:none;
        }
  .main_side :target h2 a, /* 클릭된 id 하위의 h2 a, .accordionMenu h2 a:active */
   </style>
<script type="text/javascript">
$(document).ready(function() {
	$(".reviewUForm").hide();
		var productCategory = $(".quick_desc").attr("id");
		var pcno = "";
		var pno = $(".productPno").attr("id");
		
		// 파일명.html#tab1
		// 페이지가 로드될때 URI에 hash의 값이 없으면 hash값을 #tab1으로 설정,
 	    // hash값에 따라서 해당 div가 보여지게됨.	
		

			  if($("#checkScroll").val()=="QnAScroll"){
			   location.hash = "#tab2";
			   $('html, body').animate({
					scrollTop: $('#checkScroll').offset().top
					}, 1);
			  }else if($("#checkScroll").val()=="inquiryScroll"){
				 location.hash = "#tab1";
				$('html, body').animate({
				scrollTop: $('#checkScroll').offset().top
				}, 1); 
			  }else
				 location.hash = "#tab1";
			  
		//리뷰, 상품문의 페이지 이동시 scroll 위치
	/* 		if($("#checkScroll").val()=="QnAScroll"){
			 $('html, body').animate({
				scrollTop: $('#tab2').offset().top
				}, 1); 
			}else if($("#checkScroll").val()=="inquiryScroll"){
				$('html, body').animate({
					scrollTop: $('#tab1').offset().top
					}, 1); 
			}  */
			 
		
		
		//색상을 클릭했을 때 색상에 맞는 size를 ajax를 이용해 가지고 오는 이벤트
		$("#colorCheck").change(function() {
						pcno = $(this).val();
						if ($(this).val() == 0) {
							return false;
		}
		$("#slsSize").html("");
		$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/findProductDetailByColorAjax.do",
				dataType : "json",
				data : "pcno="+ $(this).val()+"&pno="+pno,
				success : function(data) {
					var infoSize = "";
						infoSize = "<h3>사이즈</h3>"
						infoSize += "<select id='sizeSelectAjax'>";
						infoSize += "<option value=0>-[필수] 옵션을 선택해주세요-</option>";
						infoSize += "<option value=0>-----------------------------------------</option>";
					for (var i = 0; i < data.length; i++) {
						infoSize += "<option value='";
						infoSize+=data[i].productSizeVO.psno;
						infoSize+="'>";
						infoSize += "Size : "+data[i].productSizeVO.size_name+" / 재고량 : "+data[i].inventory;
						infoSize += "</option>";
					}
						infoSize += "</select>";
						$("#slsSize").append(infoSize);
				}//success
		});//ajax
	});//change
	$("#insertCart").click(function() {
		if($("#quantity").val()==0){
			alert("1개 이상 주문하셔야 합니다");
			return false;
		}else if($("#colorCheck").val()==0){
			alert("색상을 선택해주세요");
			return false;
		}else if($("#sizeSelectAjax").val()==0){
			alert("사이즈를 선택해주세요");
			return false;
		}
		$("#sendPsno").val($("#sizeSelectAjax :selected").val());
		$("#sendPcno").val(pcno);  
	});//click
	
	//즉시구매
	$("#immediatelyPay").click(function() {
		if($("#quantity").val()==0){
			alert("1개 이상 주문하셔야 합니다");
			return false;
		}else if($("#colorCheck").val()==0){
			alert("색상을 선택해주세요");
			return false;
		}else if($("#sizeSelectAjax").val()==0){
			alert("사이즈를 선택해주세요");
			return false;
		}
		pcno=$("#colorCheck").val();
		var psno=$("#sizeSelectAjax").val();
		var quantity=$("#quantity").val();
		var image=$(".imageSpend").attr("id");
		alert(image);
		location.href="${pageContext.request.contextPath}/immediatelyPay.do?pcno="+pcno+
		"&psno="+psno+"&pno="+pno+"&quantity="+quantity;
/* 		alert(quantity);
		alert(psno);
		alert(pcno);
		alert(1); */
	});//immediatelyPay click
    
  	 	$("#registerPQ").click(function() {
  	 	  	/* openPopup(); */
  	 	  		location.href="${pageContext.request.contextPath}/registerProductQnaView.do?pno="
  	 	  					+pno+"&checkScroll=QnAScroll";
  	 		});
$("#quantity").change(function() {
	 var a=$("#sizeSelectAjax :selected").text().split(":");
	if(parseInt($(this).val())>parseInt(a[2].toString())){
		alert("재고량보다 많습니다");
		$(this).val(0).focus();
		return false;
	}else if($(this).val()<0){
		alert("주문수량을 다시 한번 확인해 주세요");
		$(this).val(0).focus();
		return false; 
	}
});
});//ready

function rvUpdateForm(rno){
	alert("rno:"+rno);
	$("#rno"+rno).toggle();
	alert("***");
}// function rvUpdateForm

function rvUpdate(rno){
	alert(' rno : '+rno);
   	var content = $("#rvUContent"+rno).val();
   	alert(content);
   	
   	if(confirm("리뷰를 수정하시겠습니까?")){
	  		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/reviewUpdateAjax.do",				
			data:"rno="+rno+"&content="+content,	
			beforeSend : function(xhr){   
               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
           },
           contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
			success:function(data){						
				$("#listContent"+rno).text(data.content);
				$("#rno"+rno).toggle();
			}//callback			
		});//ajax
	 	}else{
		  	return false;
	  	}//confirm 종료
}

</script>
<script>
	// Can also be used with $(document).ready()
	$(window).load(function() {
		$('.flexslider').flexslider({
			animation : "slide",
			controlNav : "thumbnails"
		});
	});
</script>

<%-- 
<!-- 지울 부분 -->
${requestScope.psglist}
<br><br>
<!-- 지울 부분 -->
${requestScope.pvo } --%>


<!--start-single-->
<div class="single contact">
	<div class="container">
		<div class="single-main">
			<div class="col-md-9 single-main-left">
				<div class="sngl-top">
					<div class="col-md-5 single-top-left">
						<div class="flexslider">
							<!--아래 div는 이미지 url 보내기 위해 생성한 영역 -->
							<div class="imageSpend" id="${requestScope.pvo.imageList[0].url}"></div>
							<ul class="slides">
								<li data-thumb="images/s1.jpg"><img height=350px; width=250px; src="${pageContext.request.contextPath}/resources/upload/${requestScope.pvo.imageList[0].url}" />
							${imgList.url }							
		 
							</ul>
						</div>
					</div>
					<!-- 상품번호 -->
					<form name="detailForm" action="${pageContext.request.contextPath}/registerCart.do" onsubmit="return checkRegisterCart()">
						<%-- <input type="hidden" name="pvo" id="" value="${pvo}">
						<input type="hidden" name="pno" id="" value="${pvo.pno}"> --%>						
						<input type="hidden" name="psno" id="sendPsno" value="">
						<input type="hidden" name="pcno" id="sendPcno" value="">
						<input type="hidden" name="pno"  value="${pvo.pno}">
						<input type="hidden" name="price" value="${pvo.price}">
					<div class="productPno" id="${requestScope.pvo.pno}"></div>
					<div class="col-md-7 single-top-right">
						<div class="details-left-info simpleCart_shelfItem">
							<h3>${requestScope.pvo.name}</h3>
							<p class="availability">
								Availability: <span class="color">In stock</span>
							</p>
							<div class="price_single">
								<%-- <span class="reducedfrom">${requestScope.pvo.price}</span> --%>
								<span class="actual item_price">${requestScope.pvo.price}</span><a
									href="#">click for offer</a>
							</div>
							<h2 class="quick">상품설명:</h2>
							<p class="quick_desc" id="${requestScope.pvo.category}">${requestScope.pvo.content}</p>
							<ul class="product-colors">
								<h3>색상</h3>
								<select id="colorCheck">
									<option value="0">-[필수] 옵션을 선택해주세요-</option>
									<option value="0">-----------------------------------------</option>
									<c:forEach items="${requestScope.clist}" var="clist">
										<option class="colorSelect" id="pcno" value="${clist.pcno}">${clist.color_name}</option>
									</c:forEach>
								</select>
								<div class="clear" id="slsSize">
									<h3>사이즈</h3>
									<select id="sizeSelectAjax">
										<option value="0">-[필수] 옵션을 선택해주세요-</option>
										<option id="psno" value="0">-----------------------------------------</option>
									</select>
									<input type="hidden" id="sizeInventory" value="0">
								</div>
							</ul>

							<div class="quantity_box">
								<ul class="product-qty">
									<span>주문수량:</span>
									<!-- quantity 주문갯수 -->
									<input type="number" name="quantity" id="quantity" min="0" required="required">
								</ul>
							</div>
							<div class="clearfix"></div>
							<div class="single-but item_add">
							<sec:authorize access="hasRole('ROLE_MEMBER')" var="isMember" />
							<c:choose>
								<c:when test="${isMember}">
									<!-- <input type="submit" value="장바구니담기" id= "insertCart"/> -->
									<button type="submit" class="btn btn-default" id= "insertCart">
										<span class="glyphicon glyphicon-shopping-cart"></span> 장바구니담기
									</button>
									<!-- <input type="button" id="immediatelyPay" value="즉시주문"  style="background-color: orange; " /> -->
									<button type="button" class="btn btn-default" id= "immediatelyPay">
										<span class="glyphicon glyphicon-usd"></span> 즉시주문
									</button>
								</c:when>
								<c:otherwise>
									<!-- <input type="submit" value="장바구니담기" id= "insertCart" disabled="disabled"/> 
									<input type="button" id="immediatelyPay" value="즉시주문" disabled="disabled"  style="background-color: orange; "/> -->
									<button type="submit" class="btn btn-default" id= "insertCart" disabled="disabled">
										<span class="glyphicon glyphicon-shopping-cart"></span> 장바구니담기
									</button>
									<button type="submit" class="btn btn-default" id= "immediatelyPay" disabled="disabled">
										<span class="glyphicon glyphicon-usd"></span> 즉시주문
									</button>
								</c:otherwise>
							</c:choose>
							</div>
						</div>
						</form>
					</div>
					<div class="clearfix"></div>
					<br>
					<br>
					<div class="memberSize1" id=${requestScope.id}>
						<h3>오차범위</h3>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th style="background-color: #ffffff;">±2cm</th>
									<th style="background-color: #ffffb3;">±4cm</th>
									<th style="background-color: #ffcc99;">±6cm</th>
									<th style="background-color: #ff471a;">±8cm</th>
									<th style="background-color: #ff0000;">±8cm이상</th>
								</tr>
							</thead>
						</table>
						<h3>사이즈비교</h3>
						<table class="table table-bordered">
							<thead>
								<c:choose>
									<c:when test="${requestScope.pvo.category=='bottom'}">
										<tr>
											<th>사이즈</th><th>허리</th><th>허벅지</th><th>밑위</th><th>밑단</th><th>하의 총기장</th>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<th>사이즈</th><th>어깨</th><th>가슴</th><th>소매</th><th>암홀</th><th>상의 총기장</th>
										</tr>
									</c:otherwise>
								</c:choose>
							</thead>
							<!-- 치수 등록을 하지 않은 경우  css 처리하지 않아야 함 -->
							<tbody>
								 <c:forEach items="${requestScope.psList}" var="psList" varStatus="i">
									<tr>
										<td>${psList.size_name}</td>
										<td style="background-color:${psglist[i.index].sizeGap1}">${psList.size1}</td>
										<td style="background-color:${psglist[i.index].sizeGap2}">${psList.size2}</td>
										<td style="background-color:${psglist[i.index].sizeGap3}">${psList.size3}</td>
										<td style="background-color:${psglist[i.index].sizeGap4}">${psList.size4}</td>
										<td style="background-color:${psglist[i.index].sizeGap5}">${psList.size5}</td>
									</tr>
								</c:forEach> 
							</tbody>
						</table>
					</div>
					<!-- 이미지  -->
					<div>
					<c:forEach items="${requestScope.pvo.imageList}" varStatus="j">
					<img src="${pageContext.request.contextPath}/resources/upload/${requestScope.pvo.imageList[j.count].url}" />
					</c:forEach>									
					</div>
					
					<aside id="main_side">
					<!-- 스크롤 위치고정용 -->
					<input id="checkScroll" value="${requestScope.checkScroll}" style="display: none;">
					<input id="checkvHas" value="${requestScope.vHash}" style="display: none;">
					<!-- start review table -->
					<div class="ckeckout">
						<div class="container" style="padding-left: 0px;">
							<div class="ckeckout-top">
								<div class=" cart-items heading">
									 <section class="buttons">            							
									<ul class="nav nav-tabs">
										<li><a href="#tab1" style="font-size:20px">상품리뷰</a></li>
										<li><a href="#tab2" style="font-size:20px">상품문의</a></li>
									</ul>
									<!-- 	<label for="review"><a href="#tab1" style="font-size:30px">상퓸리뷰</a></label>
            							<label for="productQnA"><a href="#tab2" style="font-size:30px">상품문의</a></label> -->
        							</section> 
								<!-- 	<ul class="nav nav-tabs">
										<li><a href="#tab1" style="font-size:20px">상품리뷰</a></li>
										<li><a href="#tab2" style="font-size:20px">상품문의</a></li>
									</ul> -->
									<!-- 상품리뷰 -->
        						<sec:authentication property='principal.id' var="mId"/>
        						 <div class="tab_item" id="tab1">
									<div class="in-check">
									<table class="table table-hover">
  					  				<thead class="row">
			    					  <tr>
			    					   <th class="col-sm-1">리뷰번호</th>
			     					   <th class="col-sm-5">내용</th>
			     					   <th class="col-sm-1">색상</th>
			     					   <th class="col-sm-1">사이즈</th>
			     					   <th class="col-sm-1">작성자</th>
			     					   <th class="col-sm-2">날짜</th>
			     					    <th class="col-sm-1">수정</th>
			      					 </tr>					
				    				 </thead>
				    				<c:set value="${prlvo.pagingBean}" var="pb"/>
									<c:forEach items="${prlvo.list}" var="list" varStatus="order">
								    <tbody>
								      <tr>
								        <td>${list.rno}</td>
								        <td id="${list.id}">${list.content}</td>
								        <td>${list.color_name}</td>
								        <td>${list.size_name}</td>
								        <td>${list.id}</td>
								        <td>${list.regdate }</td>
								       	<td>
					        				<c:choose>
								        		<c:when test="${list.id==mId}">
													<button id="reviewUFormGoBtn"
														onclick='rvUpdateForm("${list.rno}")'>리뷰 수정하기</button>
								        		</c:when>
												<c:otherwise>
													-
												</c:otherwise>
								    		</c:choose>
								        </td>
								      </tr>
								      <tr class="reviewUForm" id="rno${list.rno}">
								      	<td colspan="8">
											<textarea rows="5" cols="100" name="content" id="rvUContent${list.rno}">${list.content}</textarea>
						 				</td>
						 				<td>
						 					<input type="hidden" id="rno" value="${list.rno}">
						 					<button id = "rvUBtn" onclick='rvUpdate("${list.rno}")'>수정하기</button>
						 				</td>
								      </tr>
								    </tbody>
								 </c:forEach>
								 </table>
								 									
							<!-- review table paging처리 -->
							<div class="container" align="center">
			  					<ul class="pager">
			   						<c:if test="${pb.previousPageGroup==true}">
			   							<li><a href="findProductDetailByPno.do?pno=${requestScope.pno}&pageNo=${pb.startPageOfPageGroup-1}&checkScroll=inquiryScroll">Previous</a></li>
			   						</c:if>
			   						<c:forEach begin="${pb.startPageOfPageGroup}" 
			   								end="${pb.endPageOfPageGroup}" var="pageNum">
			   							<c:choose>
			   								<c:when test="${pageNum==pb.nowPage}">
												<li>${pageNum}&nbsp;&nbsp;</li>
											</c:when>
											<c:otherwise>
												<li><a href="findProductDetailByPno.do?pno=${requestScope.pno}&pageNo=${pageNum}&checkScroll=inquiryScroll">${pageNum}</a>&nbsp;&nbsp;</li>
											</c:otherwise>
			   							</c:choose>
			   						</c:forEach>
			   						<c:if test="${pb.nextPageGroup==true}">
			    						<li><a href="findProductDetailByPno.do?pno=${requestScope.pno}&pageNo=${pb.endPageOfPageGroup+1}&checkScroll=inquiryScroll">Next</a></li>
			    					</c:if>
			 					 </ul>
								</div>
							<!-- end review table  -->										
						</div>
			 </div>
				<!-- star QnA table -->
			<div class="tab_item" id="tab2">
			 <div align="right">
				<c:if test="${isMember}">
				<button id="registerPQ" type="button" class="btn btn-primary btn-sm">문의 글쓰기</button>
				</c:if>
				</div>
				 <div class="in-check">
				   <table class="table table-hover">
  					  <thead class="row">
    					  <tr>
    					    <th class="col-sm-1">문의번호</th>
     					   <th class="col-sm-6">내용</th>
     					   <th class="col-sm-1">작성자</th>
     					   <th class="col-sm-3">날짜</th>
     					   <th class="col-sm-1">비고</th>
      					 </tr>					
    				 </thead>
    				<c:set value="${lpqlist.pagingBean}" var="pqpb"/>
					<c:forEach items="${lpqlist.list}" var="pqlist" varStatus="order">
				    <tbody>
				      <c:choose>
				      <c:when test="${pqlist.security=='private'&&pqlist.id!=mId}">
				      <tr>
				        <td>${pqlist.pqno}</td>
				        <td>비공개 게시물입니다</td>
				        <td>${pqlist.id}</td>
				        <td>${pqlist.regdate}</td>
				        <<td><td>
				      </tr>
				    </c:when>
				    <c:otherwise>
				     <tr>
				        <td>${pqlist.pqno}</td>
				        <td>${pqlist.content}</td>
				        <td>${pqlist.id}</td>
				        <td>${pqlist.regdate}</td>
				        <c:if test="${pqlist.id==mId}">
				        <td><button type="button">삭제</button></td>
				        </c:if>
				      </tr>
				    </c:otherwise>
				    </c:choose>
				    </tbody>
				 </c:forEach>
				 </table>
				 	<!-- QnA table paging처리 -->
				<div class="container" align="center">
  					<ul class="pager">
   						<c:if test="${pqpb.previousPageGroup==true}">
   							<li><a href="findProductDetailByPno.do?pno=${requestScope.pno}&pqPageNo=${pqpb.startPageOfPageGroup-1}&checkScroll=QnAScroll">Previous</a></li>
   						</c:if>
   						<c:forEach begin="${pqpb.startPageOfPageGroup}" 
   								end="${pqpb.endPageOfPageGroup}" var="pageNum">
   							<c:choose>
   								<c:when test="${pageNum==pqpb.nowPage}">
									<li>${pageNum}&nbsp;&nbsp;</li>
								</c:when>
								<c:otherwise>
									<li><a href="findProductDetailByPno.do?pno=${requestScope.pno}&pqPageNo=${pageNum}&checkScroll=QnAScroll">${pageNum}</a>&nbsp;&nbsp;</li>
								</c:otherwise>
   							</c:choose>
   						</c:forEach>
   						<c:if test="${pqpb.nextPageGroup==true}">
    						<li><a href="findProductDetailByPno.do?pno=${requestScope.pno}&pqPageNo=${pqpb.endPageOfPageGroup+1}&checkScroll=QnAScroll">Next</a></li>
    					</c:if>
 					 </ul>
					</div>
      				<!-- end QnA table -->						
			  </div>
      	     </div>
			</div>
		 </div>
    	</div>
	</div>
 </aside>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--end-single-->