<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript">
function kakaoPay(){
	alert("이름 : "+$("#name").val()+" 번호 : "+$("#phone").val()+" 배송지 : "+ $("#destination").val()+" 이메일 : "+$("#memberEmail").text());
	IMP.request_pay({
	    pg : 'kakao',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : 1000,
	    buyer_email : $("#memberEmail").text(),
	    buyer_name : $("#name").val(),
	    buyer_tel : $("#phone").val(),
	    buyer_addr : $("#destination").val(),
	    buyer_postcode : '123-456',
	    kakaoOpenApp : true
	}, function(rsp) {
	    if ( rsp.success ) {
	    	alert('결제진행중');
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	jQuery.ajax({
	    		url: "${pageContext.request.contextPath}/kakaoPayComplete.do", //cross-domain error가 발생하지 않도록 주의해주세요
	    		type: 'POST',
	    		beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
	    		dataType: 'json',
	    		data: {
		    		imp_uid : rsp.imp_uid
		    		//기타 필요한 데이터가 있으면 추가 전달
	    		}
	    	}).done(function(data) {
	    		alert('결제 완료');
	    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	    		if ( everythings_fine ) {
	    			var msg = '결제가 완료되었습니다.';
	    			msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    			msg += '\결제 금액 : ' + rsp.paid_amount;
	    			msg += '카드 승인번호 : ' + rsp.apply_num;
	    			
	    			alert(msg);
	    			$("#orderStatus").val("배송준비중");
	    			$("#orderForm").submit();
	    		} else {
	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	    		}
	    		
	    	});
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        
	        alert(msg);
	    }
	});
}

	$(document).ready(function() {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp55065335'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		alert('IMP 결제 객체가 초기화됨');
		
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
				if(confirm("구매를 진행 하시겠습니까?")==true){
					if($("#payMethod4").is(":checked")){
						kakaoPay();
					}else{
						$("#orderForm").submit();
					}
				};
			}
		}); // click
		
		var totalprice = ${ovo.totalprice};
		$("#totalprice").text("총 상품금액 : "+totalprice);
		$("#pointCharge").change(function() {
			var pointCharge=$(this).val();
			if(pointCharge%1000!=0){
				alert("포인트는 1000단위로 사용가능 합니다");
				$(this).val(0).focus();
				$("#totalprice").text("총 상품금액 : "+totalprice);
				return false;
			}
			if(parseInt($("#membersPoint").val())<pointCharge){
				alert("가지고 계신 포인트보다 많이 기입하셨습니다"+"사용할 포인트"+pointCharge+"소유 포인트"+$("#membersPoint").val());
				$(this).val(0).focus();
				$("#totalprice").text("총 상품금액 : "+totalprice);
				return false;
			}
			if(pointCharge<0){
				alert("포인트는 0이상만 기입이 가능합니다");
				$(this).val(0).focus();
				$("#totalprice").text("총 상품금액 : "+totalprice);
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
		$("#payMethodTable4").hide();
		$("#payMethod1").click(function() {
			if($("#payMethod4").is(":checked")){
				$("#payMethod4").prop("checked", false);
				$("#payMethod1").prop("checked", true);
			}
			$("#payMethodTable4").hide();
			$("#payMethodTable1").show();
		}); // click
		$("#payMethod4").click(function() {
			if($("#payMethod1").is(":checked")){
				$("#payMethod1").prop("checked", false);
				$("#payMethod4").prop("checked", true);
			}
			$("#payMethodTable1").hide();
			$("#payMethodTable4").show();
		}); // click
	});// ready
</script>

<!--start-ckeckout-->
<form action="${pageContext.request.contextPath}/order.do" id = "orderForm">
<input type="hidden" name="orderStatus" id="orderStatus" value="입금대기">
   <div class="ckeckout">
      <div class="container">
         <div class="ckeckout-top">
         	<div class=" cart-items heading">
          		<div class="in-check">
          		<h3 class="main-title">주문할 상품</h3>
          		</div>
          		
<%-- 주문할 상품 목록 테이블 --%>
				<table class="table-board">
					<thead>
						<tr>
							<th>상품사진</th><th>상품명</th><th>사이즈</th><th>색상</th><th>주문수량</th>
						</tr>
					</thead>
					<tbody>
						 <c:forEach items="${requestScope.ovo.orderProductList}" var="j">
						 <input type="hidden" name="pdno" value="${j.pdno}">
						 <input type="hidden" name="quantity" value="${j.quantity}">
							<tr>
								<td>
									<a href="${pageContext.request.contextPath}/findProductDetailByPno.do?pno=${ovo.ono}" >
				                		<img alt="이미지~~" src="${pageContext.request.contextPath}/resources/upload/${j.url}" class="img-responsive" height="50%" width="50%"/>
				                	</a>
								</td>
								<td>${j.name}</td>
								<td>${j.size_name}</td>
								<td>${j.color_name}</td>
								<td>${j.quantity}</td>
							</tr>
						</c:forEach> 
					</tbody>
				</table>
				<br><br><br>
<%-- 주문 정보 테이블 --%>
				<table class="table-board">
					<thead>
						<tr>
							<th>주문정보</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div id = "totalprice" style="font-size: 8;">총 상품 금액 : ${ovo.totalprice}</div>
								<input type="hidden" name="totalprice" value="${ovo.totalprice}">
							</td>
						</tr>
						<tr>
							<td>
								<input id="membersPoint" value="${requestScope.point}" style="display: none;">
								<div align="center">포인트 : <input id="pointCharge" name="payPoint" type = "number" min="0" step="1000" value = "0" size="7" width="4"> 
								 ( 사용 가능 포인트 금액 : ${requestScope.point})
								 </div>
							</td>
						</tr>
					</tbody>
				</table>
	         	</div>
	       	</div>
	          <br><br><br>
	        <div>
				<div class = "col-md-6">
				<%-- 주문자 정보 --%>
			         <div class = "in-check">
				          	<table class="table-board">
					          	<thead align="center">
					          		<tr>
					          			<th>주문자정보</th>
					          		</tr>
					          	</thead>
				          		<tbody>
					          		<tr>
					          			<td>이름 : <span id = "memberName">${ovo.memberVO.name}</span></td>
					          		</tr>
					          		
					          		<tr>
					          			<td>이메일 : <span id = "memberEmail">${ovo.memberVO.email}</span> &nbsp;
					          			연락처 : <span id = "memberPhone" value ="${ovo.memberVO.phone}">${ovo.memberVO.phone}</span></td>
					          		</tr>
					          		<tr>
					          			<td>주소 : <span id = "memberAddress" value ="${ovo.memberVO.address}">${ovo.memberVO.address}</span></td>
					          		</tr>
					          		<tr>
					          			<td>등급 : [ ${ovo.memberVO.gradeVO.grade} ] &nbsp;  적립 비율 : [ ${ovo.memberVO.gradeVO.percent} ]</td>
					          		</tr>
				          		</tbody>
				          	</table>
				      <br><br><br>
			          </div>
				</div>
				<div class = "col-md-6">
				<%-- 배송지 정보 --%>
			          <div class = "in-check">
			          	<table class="table-board">
			          		<thead>
			          			<tr></tr>
			          			<tr>
				          			<th>배송지 정보 <div align="right"><input type = "checkbox" id = "equalMemberInfo"> 위 정보와 같음</div></th>
			          			</tr>
			          		</thead>
			          		<tbody >
				          		<tr>
				          			<td colspan="2">이름 : <input type = "text" name = "name" id = "name" required="required"></td>
				          		</tr>
				          		<tr>
				          			<td colspan="2">연락처 : <input type = "text" name = "phone" id = "phone" required="required"> </td>
				          		</tr>
				          		<tr>
				          			<td colspan="2">주소 : <input type = "text" name = "destination" id = "destination" required="required"> </td>
				          		</tr>
			          		</tbody>
			          	</table>
			          </div>
			    <br><br><br>
				</div>
			</div>  
<%-- 결제 정보 --%>
			  <div class = "in-check" >
			  	<table class="table-board">
			  		<thead>
						<tr>
							<th>결제 정보</th>
						</tr>		  		
		  			</thead>
			  	</table>
	            <br><br>
		            <div align="center">
		            	<input type = "radio" value="입금대기" name = "depositMethod" id = "payMethod1" checked="checked">무통장입금 &nbsp;&nbsp;
		            	<input type = "radio" value="배송준비중" name = "depositMethod" id = "payMethod4">카카오페이(KakaoPay) &nbsp;&nbsp;
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
		          			<td>우리 은행 : 1002-536-524962 김석환 </td>
		          			<td></td>
		          		</tr>
		          	</table>
		          	<table class="cart-header" id ="payMethodTable4">
		          		<tr>
		          			<td>· 가장 빠른 모바일 결제</td>
		          		</tr>
		          	</table>
		          	<!-- <table class="cart-header" id ="payMethodTable2">
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
		          	</table> -->
		         </div>
	          </div>	          
	         <div align="right" class = "in-check">
	         	<table>
	         		<tbody>
		         		<tr>
		         			<td>
		         				<input type = "checkbox" id = "agreeOrder" name = "agreeOrder"> 결제정보를 확인했으며, 구매진행에 동의합니다 &nbsp;
		         				<input type="hidden" name="ono" value="${ovo.ono}">
		         				<input class="add-cart cart-check" type ="button" id="order" value="주문하기">
		         			</td>
		         		</tr>
	         		</tbody>
	         	</table>
	         </div> 
         </div>  
       </div>
  </form>
  <!--end-ckeckout-->