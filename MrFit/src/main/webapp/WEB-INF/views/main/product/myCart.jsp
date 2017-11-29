<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
$(document).ready(function() {
	var quantity=$(".findQuantity").attr("id");
	
	// 상품 수량변경 클릭시
	$("#updateBtan").click(function() {
		if(confirm('수량을 변경하시겠습니까?')==true){
			var info="";
			info="수량 :<input id='updateQuantity' type='text' value='";
			info+=quantity;
			info+="' size='5'>";
			$("#updateField").html(info);        		
			$("#updateGround").html("<a href='#' class='add-cart cart-check' id='updateBtn1'>수정완료</a>");
		}
	});//click()
	
	// 
	$("#updateGround").on("click", "#updateBtn1", function(){
		location.href="${pageContext.request.contextPath}/updateOrderQuantity.do?ono="
			+$(".findOno").attr("id")+"&pdno="+$(".findPdno").attr("id")
			+"&quantity="+$("#updateQuantity").val()+"&price="+$(".findPrice").attr("id");
	});//on()
	
	/* $('.close1').on('click', function(c){
		$('.cart-header').fadeOut('slow', function(c){
			$('.cart-header').remove();
		});
	});   */
	
	// 
	$('.close2').on('click', function(c){
		$('.cart-header1').fadeOut('slow', function(c){
			$('.cart-header1').remove();
		});
	}); 
	
	$('.close3').on('click', function(c){
		$('.cart-header2').fadeOut('slow', function(c){
			$('.cart-header2').remove();
		});
	}); 
	
	$("#orderForm").click(function() {
		return confirm("상품을 주문하시겠습니까?");
	}); //click
	
	$(".updateBtn").click(function() {
		if(confirm('수량을 변경하시겠습니까?')){
			var quantity = $(this).parent().find(".productCount").val();
			var price = $(this).parent().find(".hiddenPrice").val();
			var pdno = $(this).parent().find(".hiddenPdno").val();
			alert("보낼 데이터 : quantity-"+quantity+", price-"+price+", pdno-"+pdno);
				$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/updateOrderQuantity.do",				
					data:"ono=${ovo.ono}&pdno="+pdno+"&quantity="+quantity+"&price="+price,
					dataType: "json",
					beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	                },
					success:function(data){
						alert(data.quantity);
						// ajax 통신 성공시 동작
					},	
					timeout:1000,	
					error:function(){
						// ajax 통신 실패시 동작
					}//callback			
				});//ajax
		}else{
			return false;
		}
	});
	
});//ready
function delConfirm(){
	return confirm('상품을 삭제하시겠습니까?');
}
</script>

<!--start-ckeckout-->
   <div class="ckeckout">
      <div class="container">
         <div class="ckeckout-top">
         <div class=" cart-items heading">
          <h3>My Shopping Bag ( ${requestScope.ovo.orderProductList.size()} )</h3>
          
          <table class="table-board">
				<thead>
					<tr>
						<th>&nbsp;</th><th>상품이미지</th><th>상품명</th><th>사이즈</th><th>색상</th><th>수량</th><th>비고</th>
					</tr>
				</thead>
				<tbody>
					 <c:forEach items="${requestScope.ovo.orderProductList}" var="j">
						<tr>
							<td>
								<div class="findOno" id="${ovo.ono}"></div>
	               				<div class="findPdno" id="${j.pdno}"></div>
	               				<a onclick="return delConfirm();"
	               					href="${pageContext.request.contextPath}/deleteCart.do?quantity=${j.quantity}&ono=${ovo.ono}&pdno=${j.pdno}&price=${j.price}"> 
									<img alt="삭제하기" src="${pageContext.request.contextPath}/resources/images/close-1.png">
								</a>
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/findProductDetailByPno.do?pno=${ovo.ono}" >
			                		<img alt="사진~~~" src="${pageContext.request.contextPath}/resources/upload/${j.url}" class="img-responsive" height="50%" width="50%"/>
			                	</a>
							</td>
							<td>${j.name}</td>
							<td>${j.size_name}</td>
							<td>${j.color_name}</td>
							<td>수량 : <input type="number" class="productCount" value="${j.quantity}">
								<input type="hidden" class="hiddenPdno" value="${j.pdno}">
								<input type="hidden" class="hiddenPrice" value="${j.price}"><br>
							</td>
							<td>
								<button class="updateBtn">수량변경</button>
							</td>
						</tr>
					</c:forEach> 
				</tbody>
			</table>
            <div><a href="orderForm.do" class="add-cart cart-check" id = "orderForm">주문하기</a></div>
			</div>
		</div>  
	</div>
</div>
   <!--end-ckeckout-->