<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>

<h2>my OrderProduct List</h2>

<!--start-ckeckout-->
<div class="ckeckout">
	<div class="container">
		<div class="ckeckout-top">
			<div class=" cart-items heading">
				<h3>(특정 주문의)주문 내역</h3>
				<div class="in-check">
					<ul class="unit">
						<li><span>No</span></li>
						<li><span>Title</span></li>
						<li><span>Writer</span></li>
						<li><span>hit</span></li>
						<li><span>작성일</span></li>
						<div class="clearfix"></div>
					</ul>
					<ul class="cart-header">
						<li><span>1</span></li>
						<li><span>공지사항 1번</span></li>
						<li><span>관리자</span></li>
						<li><span>조회수</span></li>
						<li><span>2017/11/19</span></li>
						<div class="clearfix"></div>
					</ul>
					<ul class="cart-header">
						<li><span>2</span></li>
						<li><span>공지사항 2번</span></li>
						<li><span>관리자</span></li>
						<li><span>조회수</span></li>
						<li><span>2017/11/19</span></li>
						<div class="clearfix"></div>
					</ul>
					<ul class="cart-header">
						<li><span>3</span></li>
						<li><span>공지사항 3번</span></li>
						<li><span>관리자</span></li>
						<li><span>조회수</span></li>
						<li><span>2017/11/19</span></li>
						<div class="clearfix"></div>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!--end-ckeckout-->


<c:forEach items="${list}" var="orderProduct">
주문번호 :	${orderProduct.ono}<br>
상품이름 :	${orderProduct.name}<br>
상품가격 : 	${orderProduct.price}<br>
상품종류 : 	${orderProduct.category}<br>
상품색상 : 	${orderProduct.color_name}<br>
상품사이즈 :	${orderProduct.size_name}<br>
주문수량 :	${orderProduct.quantity}<br>
이미지 : 	${orderProduct.url}<br>
	<br><hr>
</c:forEach>









