<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript">
	$(document).ready(function() {
		$(".reviewForm").hide();
		var check=false;
});
	
	function reviewFormGo(pdno){
		alert("pdno:"+pdno);
		$("#"+pdno).toggle();
		alert("***");
	}
	
</script>

<br>
<h3><a href="${pageContext.request.contextPath}/myOrderList.do?id=<sec:authentication property="principal.id"/>">주문 리스트로 돌아가기</a><br><br></h3>
<!-- ver.2 -->
<div class="ckeckout">
	<div class="container">
		<div class="ckeckout-top">
			<div class=" cart-items heading">
				<h3>주문 상세 내역</h3>
<<<<<<< HEAD
				<div class="in-check">
=======
				<div>
					<ul class="unit2">
						<li><span>이미지</span></li>
						<li><span>주문번호</span></li>
						<li><span>주문상품명</span></li>
						<li><span>상품가격</span></li>
						<li><span>상품카테고리</span></li>
						<li><span>상품색상</span></li>
						<li><span>상품사이즈</span></li>
						<li><span>수량</span></li>						
						<li><span>상품 리뷰작성</span></li>
						<div class="clearfix"></div>
					</ul>
					<c:forEach items="${list}" var="orderProduct">
					<ul class="cart-header0">
					<li><span><img alt="이미지~~" src="${pageContext.request.contextPath}/resources/upload/${orderProduct.url}"class="img-responsive" height="50%" width="50%"/></span></li>
						<li><span>${orderProduct.ono}</span></li>
						<li><span>${orderProduct.name}</span></li>
						<li><span>${orderProduct.price}</span></li>
						<li><span>${orderProduct.category}</span></li>
						<li><span>${orderProduct.color_name}</span></li>
						<li><span>${orderProduct.size_name}</span></li>
						<li><span>${orderProduct.quantity}</span></li>
						<div class="clearfix"></div>
						<c:if test="${orderProduct.reviewCheck==0}">
						 <form action="${pageContext.request.contextPath}/registerProductReview.do">
						 	<input type="hidden" name="ono" value="${orderProduct.ono}">
							<input type="hidden" name="pdno" value="${orderProduct.pdno}">
							<input type="hidden" name="name" value="${orderProduct.name}">
							<input type="hidden" name="color_name" value="${orderProduct.color_name}">
							<input type="hidden" name="size_name" value="${orderProduct.size_name}">
							<input type="hidden" name="id" value="<sec:authentication property="principal.id"/>">
							<input type="text" name="content" required="required">
							<input type="submit" value="리뷰작성">
						 </form>
						 <div class="clearfix"></div>
						</c:if>
					</ul>
					</c:forEach>
				</div>
				
				<%-- 페이징 처리 --%>
				<%-- <div class="container" align="center">
				  		<ul class="pager">
				   			<c:if test="${pb.previousPageGroup==true}">
				   			<li><a href="myOrderPrductList.do?ono=${orderProduct.ono}&id=<sec:authentication property="principal.id"/>&pageNo=${pb.startPageOfPageGroup-1}">Previous</a></li>
				   			</c:if>
				   			<c:forEach begin="${pb.startPageOfPageGroup}" 
				   			end="${pb.endPageOfPageGroup}" var="pageNum">
				   			<c:choose>
				   				<c:when test="${pageNum==pb.nowPage}">
								<li>${pageNum}&nbsp;&nbsp;</li>
								</c:when>
								<c:otherwise>
								<li><a href="myOrderPrductList.do?ono=${orderProduct.ono}&id=<sec:authentication property="principal.id"/>&pageNo=${pageNum}">${pageNum}</a>&nbsp;&nbsp;</li>
								</c:otherwise>
				   			</c:choose>
				   			</c:forEach>
				   			<c:if test="${pb.nextPageGroup==true}">
				    		<li><a href="myOrderPrductList.do?ono=${orderProduct.ono}&id=<sec:authentication property="principal.id"/>&pageNo=${pb.endPageOfPageGroup+1}">Next</a></li>
				    		</c:if>
				 		 </ul>
				</div> --%>
>>>>>>> branch 'master' of https://github.com/ho7371/MrFit.git
					
					<table class="table-board">
  						<thead class="row">
  							<tr>
			    				<th class="col-sm-2">주문 상품</th>
			    				<th class="col-sm-1">주문번호</th>
			     				<th class="col-sm-2">상품명</th>
			     				<th class="col-sm-1">가격</th>
			     				<th class="col-sm-1">카테고리</th>
			     				<th class="col-sm-1">색상</th>
			     				<th class="col-sm-1">사이즈</th>
			     				<th class="col-sm-1">수량</th>
			     				<th class="col-sm-2">상품 리뷰</th>
			      			</tr>		
  						</thead>
						<c:forEach items="${list}" var="orderProduct">
  							<tbody>
								<tr>
									<td><img alt="상품 대표사진" src=""></td>
									<td>${orderProduct.ono}</td>
									<td>${orderProduct.name}</td>
									<td>${orderProduct.price}</td>
									<td>${orderProduct.category}</td>
									<td>${orderProduct.color_name}</td>
									<td>${orderProduct.size_name}</td>
									<td>${orderProduct.quantity}</td>
									<td>
										<c:choose>
											<c:when test="${orderProduct.reviewCheck==0}">
												<button id="reviewFormGoBtn" onclick='reviewFormGo("${orderProduct.pdno}")'>리뷰 작성하기</button>
											</c:when>
											<c:otherwise>
												-
											</c:otherwise>
										</c:choose>
									</td>
						 		</tr>
						 		<form action="${pageContext.request.contextPath}/registerProductReview.do">
						 			<tr class="reviewForm" id="${orderProduct.pdno}">
						 				<td colspan="8">
											<textarea rows="5" cols="100" name="content" id="rvUContent"></textarea>
						 				</td>
						 				<td colspan="1">
						 					<input type="hidden" name="ono" value="${orderProduct.ono}">
											<input type="hidden" name="pdno" value="${orderProduct.pdno}">
											<input type="hidden" name="name" value="${orderProduct.name}">
											<input type="hidden" name="color_name" value="${orderProduct.color_name}">
											<input type="hidden" name="size_name" value="${orderProduct.size_name}">
											<input type="hidden" name="id" value="<sec:authentication property="principal.id"/>">
											<input type="submit" value="리뷰등록">
						 				</td>
						 			</tr>   
								</form>
							</tbody>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>