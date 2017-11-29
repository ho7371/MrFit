<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script>

	$(document).ready(function(c) {
    // 작업이 저장되지 않았을 경우에는 안내 메시지와 확인 창을 보여준다.
/* 		var totalprice = 0;
		<c:forEach items="${requestScope.ovoList}" var="list">
			totalprice += ${list.totalprice}
		</c:forEach> */
		var totalprice=$("#checkTotalprice").text();
		$("#totalprice").text("총 상품금액 : "+totalprice);
		$("#pointCharge").change(function() {
			var pointCharge=$(this).val();
			if(pointCharge%1000!=0){
				alert("포인트는 1000단위로 사용가능 합니다");
				$(this).val(0).focus();
				return false;
			}else if(pointCharge>$("#confirmPoint").val()){
				alert("소유하신 포인트이상 사용 불가!");
				$(this).val(0).focus();
				return false;
			}else if(pointCharge<0){
				alert("0 포인트 이하로는 사용 불가!");
				$(this).val(0).focus();
				return false;
			}
			$("#totalprice").text("총 상품금액 : "+(totalprice-pointCharge));
		});
		$("#equalMemberInfo").click(function() {
			if($("#name").val()=="" && $("#phone").val()=="" && $("#destination").val()==""){
				$("#name").val($("#memberName").text());
				$("#phone").val($("#memberPhone").text());
				$("#destination").val($("#memberAddress").text());
			}else{
				$("#name").val("");
				$("#phone").val("");
				$("#destination").val("");
			}	
		}); //click
		$("#order").click(function() {
			if(!$("#agreeOrder").is(':checked')){
				alert("구매 동의를 하시기 바랍니다.");
				return false;
			}else if($("#name").val()==""){
				alert("배송자 이름을 입력하시기 바랍니다.");
				return false;
			}else if($("#phone").val()==""){
				alert("배송자 휴대폰 번호를 입력하시기 바랍니다.");
				return false;
			}else if($("#destination").val()==""){
				alert("배송자 주소을 입력하시기 바랍니다.");
				return false;
			}else if($("#payMethod1").is(":checked") && $("#insertPerson").val()==""){
				alert("입금자명을 입력하시기 바랍니다.");
				return false;
			}else{	
				return confirm("구매를 진행 하시겠습니까?");
			}
		}); // click
		$("#payMethodTable2").hide();
		$("#payMethodTable3").hide();
		$("#payMethodTable4").hide();
		$("#payMethod1").click(function() {
			if($("#payMethod2").is(":checked") | $("#payMethod3").is(":checked") | $("#payMethod4").is(":checked")){
				$("#payMethod2").prop("checked", false);
				$("#payMethod3").prop("checked", false);
				$("#payMethod4").prop("checked", false);
				$("#payMethodTable2").hide();
				$("#payMethodTable3").hide();
				$("#payMethodTable4").hide();
				$("#payMethod1").prop("checked", true);
			}
			$("#payMethodTable1").show();
		}); // click
		$("#payMethod2").click(function() {
			if($("#payMethod1").is(":checked") | $("#payMethod3").is(":checked") | $("#payMethod4").is(":checked")){
				$("#payMethod1").prop("checked", false);
				$("#payMethod3").prop("checked", false);
				$("#payMethod4").prop("checked", false);
				$("#payMethodTable1").hide();
				$("#payMethodTable3").hide();
				$("#payMethodTable4").hide();
				$("#payMethod2").prop("checked", true);
			}
			$("#payMethodTable2").show();
		}); // click
		$("#payMethod3").click(function() {
			if($("#payMethod1").is(":checked") | $("#payMethod2").is(":checked") | $("#payMethod4").is(":checked")){
				$("#payMethod1").prop("checked", false);
				$("#payMethod2").prop("checked", false);
				$("#payMethod4").prop("checked", false);
				$("#payMethodTable1").hide();
				$("#payMethodTable2").hide();
				$("#payMethodTable4").hide();
				$("#payMethod3").prop("checked", true);
			}
			$("#payMethodTable3").show();
		}); // click
		$("#payMethod4").click(function() {
			if($("#payMethod1").is(":checked") | $("#payMethod2").is(":checked") | $("#payMethod3").is(":checked")){
				$("#payMethod1").prop("checked", false);
				$("#payMethod2").prop("checked", false);
				$("#payMethod3").prop("checked", false);
				$("#payMethodTable1").hide();
				$("#payMethodTable2").hide();
				$("#payMethodTable3").hide();
				$("#payMethod4").prop("checked", true);
			}
			$("#payMethodTable4").show();
		}); // click
		$("#immediatelyPayOrderCancle").click(function() {
			if(confirm("정말로 취소하시겠습니까?")){
				var ono=$("#ono").val();
				var pdno=$("#pdno").val();
				location.href="immediatelyPayOrderCancle.do?ono="+ono+"&pdno="+pdno;
			}
		});
	});// ready
</script>
<!--start-ckeckout-->
<form action="${pageContext.request.contextPath}/order.do">
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
	            <ul class="cart-header">
	                  <li class="ring-in"><a href="single.html" >
	                  <%-- <img src="${pageContext.request.contextPath}/resources/images/shoes-1.png" class="img-responsive" height="50%" width="50%"/> --%>
	                  <img src="${pageContext.request.contextPath}/resources/upload/${requestScope.image}" class="img-responsive" height="50%" width="50%"/>
	                  </a>
	                  </li>    
							<li><span>${requestScope.pvo.name}</span></li>
							<li><span>${requestScope.pdvo.productSizeVO.size_name} / ${requestScope.pdvo.color_name} / ${requestScope.quantity}</span></li>
							<li><span id="checkTotalprice">${requestScope.totalprice}</span></li>
	               <div class="clearfix"> </div>
	            </ul>
	         </div>
	         <br><br><br>
<%-- 주문 정보 --%>
	         <div class = "in-check">
	         	<ul class="unit">
	               <li><span></span></li>
					<li><span></span></li>		
					<li><span>주문 정보</span> </li>
					<li><span></span></li>
	               <div class="clearfix"></div>
	            </ul>
	            <br><br><br>
	            <table class="cart-header">
	            	<tr>
	            		<th>
	            			<div id = "totalprice"></div>
	            		</th>
	            	</tr>
	            	<tr>
	            		<th>
	            		<input id="confirmPoint" value="<sec:authentication property='principal.point' />" style="display: none;">
	            			<div align="center">포인트 : <input id="pointCharge" name="payPoint" type = "number" step="1000" min="0" value = "0" size="7" width="4">  ( 사용 가능 포인트 금액 : <sec:authentication property="principal.point" /> )</div>
	            		</th>
	            	</tr>
	            </table>
	          </div>
	          <br><br><br>
<%-- 주문자 정보 --%>
	         <div class = "in-check">
	         	<ul class="unit">
	               <li><span></span></li>
					<li><span></span></li>		
					<li><span>주문자 정보</span> </li>
					<li><span></span></li>
	               <div class="clearfix"></div>
	            </ul>
	            <br><br><br>
	            <div>
		          	<table class="cart-header">
		          		<tr>
		          			<th>이름 : <span id = "memberName"><sec:authentication property="principal.name"/></span>  </th>
		          		</tr>
		          		<tr>
		          			<th>등급 : [<sec:authentication property="principal.gradeVO.grade"/> ] &nbsp;  적립 비율 : [ <sec:authentication property="principal.gradeVO.percent"/>% ]</th>
		          		</tr>
		          		<tr>
		          			<th>이메일 : <sec:authentication property="principal.email"/></th>
		          		</tr>
		          		<tr>
		          			<th>연락처 : <span id = "memberPhone" value ="<sec:authentication property="principal.phone"/>"><sec:authentication property="principal.phone"/></span></th>
		          		</tr>
		          		<tr>
		          			<th>주소 : <span id = "memberAddress" value ="<sec:authentication property="principal.address"/>"><sec:authentication property="principal.address"/></span></th>
		          		</tr>
		          	</table>
		         </div>
	          </div>
	          <br><br><br>
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
	            <br><br><br>
	            <div>
		          	<table class="cart-header">
		          		<tr>
		          			<th>이름 : <input type = "text" name = "name" id = "name" required="required"> </th>
		          		</tr>
		          		<tr>
		          			<th>연락처 : <input type = "text" name = "phone" id = "phone" required="required"> </th>
		          		</tr>
		          		<tr>
		          			<th>주소 : <input type = "text" name = "destination" id = "destination" required="required"> </th>
		          		</tr>
		          	</table>
		         </div>
	          </div>
	          <br><br><br>
<%-- 결제 정보 --%>
			  <div class = "in-check" >
	         	<ul class="unit">
	               <li><span></span></li>
					<li><span></span></li>		
					<li><span >결제 정보</span> </li>
					<li><span></span></li>
	               <div class="clearfix"></div>
	            </ul>
	            <br><br>
	            <div align="center">
	            	<input type = "radio" value="1" name = "depositMethod" id = "payMethod1" checked="checked">무통장입금 &nbsp;&nbsp;
	            	<input type = "radio" value="2" name = "depositMethod" id = "payMethod2">신용카드 &nbsp;&nbsp;
	            	<input type = "radio" value="3" name = "depositMethod" id = "payMethod3">페이코(PAYCO) &nbsp;&nbsp;
	            	<input type = "radio" value="4" name = "depositMethod" id = "payMethod4">카카오페이(KakaoPay) &nbsp;&nbsp;
	            </div>
	            <br><br><br>
	            <div align="center">
		          	<table class="cart-header" id ="payMethodTable1">
		          		<tr>
		          			<th>입금자명 : </th><td><input type = "text" name = "" id = "insertPerson"></td>
		          			<td rowspan ="2" colspan = "3" style="font-size: 2;">
		          			· 선택된 입금계좌로 인터넷 뱅킹, 은행방문 등을 통해 입금해 주세요.  <br>
							· 반드시 입금 기한 내에 정확한 결제금액을 입금해 주세요. <br>
							· 입금 기한이 지나면 주문은 자동취소됩니다.
		          			</td>
		          		</tr>
		          		<tr>
		          			<th>입금 은행 : </th>
		          			<td>
		          				우리 은행 : 1002-536-524962 김석환 
		          			</td>
		          			<td></td>
		          		</tr>
		          	</table>
		          	<table class="cart-header" id ="payMethodTable2">
		          		<tr>
		          			<td>
		          			· 안심클릭 및 인터넷안전결제(IPS)서비스로 128bit SSL로 암호화된 결제 창이 새로 뜹니다. <br>
							· 결제후, 카드명세서에 [KCP.CO.KR]로 표시되며, 카드 정보는 상점에 남지 않습니다.
							</td>
		          		</tr>
		          	</table>
		          	<table class="cart-header" id ="payMethodTable3">
		          		<tr>
		          			<td>
		          			★ 11월 한정 혜택1. 생애 첫결제 7,000원 할인 (신한/하나/롯데/NH 35,000원 결제시) <Br>
   							★ 11월 한정 혜택2. 1,500원 할인 (신한/하나/롯데/NH 2만원 이상 결제시, 기간 內 2회 제공) <br>
  							 (“★”프로모션은 예산 소진 시 자동 종료) <br>
							1) 생애 첫 결제 시 3,500원 쿠폰 제공(단, 10,000원 이상 결제 시) <br>
							2) PAYCO 슈퍼세이브 : 최대 10,000p 적립, 등급별 라운지 혜택 제공 <br>
							   [슈퍼세이브 자세히보기]   <Br>
							3) PAYCO 포인트(유상충전)로 결제 시 3% 상시 할인 <br>  
							휴대폰과 카드 명의자가 동일해야 결제 가능하며, 결제금액 제한은 없습니다.
		          			</td>
		          		</tr>
		          	</table>
		          	<table class="cart-header" id ="payMethodTable4">
		          		<tr>
		          			<td>· 가장 빠른 모바일 결제</td>
		          		</tr>
		          	</table>
		         </div>
	          </div>	          
         </div>  
         <div align="right">
         	<input type = "checkbox" id = "agreeOrder" name = "agreeOrder"> 결제정보를 확인했으며, 구매진행에 동의합니다 &nbsp;
         	<input type="hidden" id="ono" name="ono" value="${requestScope.ono}">
         	<input type="hidden" id="pdno" name="pdno" value="${requestScope.pdvo.pdno}" style="display:none">
			<!-- 주문수량과 총수량을 줄여주기 위해서 -->
			<input type="hidden" name="quantity" value="${requestScope.quantity}" style="display:none">
         	<input class="add-cart cart-check" type ="submit" id="order" value="주문하기">
         	<input type="button" id="immediatelyPayOrderCancle" value="취소하기">
         	<!-- <a href="order.do" class="add-cart cart-check" id = "order">주문하기</a> -->
         </div> 
       </div>
      </div>
   </div>
   </form>
   <!--end-ckeckout-->