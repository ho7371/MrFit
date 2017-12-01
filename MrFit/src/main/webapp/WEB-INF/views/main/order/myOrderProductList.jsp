<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>

<%-- <c:set value="${lvo.pagingBean}" var="pb" /> --%>

<!--start-ckeckout-->
<div class="ckeckout">
	<div class="container">
		<div class="ckeckout-top">
			<div class=" cart-items heading">
				<h3>주문 상세 내역</h3>
				<div class="in-check">
					<ul class="unit">
						<li><span>주문번호</span></li>
						<li><span>주문상품명</span></li>
						<li><span>상품가격</span></li>
						<li><span>상품카테고리</span></li>
						<li><span>상품색상</span></li>
						<li><span>상품사이즈</span></li>
						<li><span>수량</span></li>
						<li><span>이미지</span></li>
						<li><span>상품 리뷰작성</span></li>
						<div class="clearfix"></div>
					</ul>
					<c:forEach items="${list}" var="orderProduct">
					<ul class="cart-header">
						<li><span>${orderProduct.ono}</span></li>
						<li><span>${orderProduct.name}</span></li>
						<li><span>${orderProduct.price}</span></li>
						<li><span>${orderProduct.category}</span></li>
						<li><span>${orderProduct.color_name}</span></li>
						<li><span>${orderProduct.size_name}</span></li>
						<li><span>${orderProduct.quantity}</span></li>
						<li><span>${orderProduct.url}</span></li>
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
					
			</div>
		</div>
	</div>
</div>
<!--end-ckeckout-->


