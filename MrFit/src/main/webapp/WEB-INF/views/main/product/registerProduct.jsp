<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--start-single-->
<div class="single contact">
	<div class="container">
		<div class="single-main">
			<div class="col-md-9 single-main-left">
				<div class="sngl-top">
					<div class="col-md-5 single-top-left">
						<div class="flexslider">
							<!-- image upload -->
							
						</div>
					</div>
					<!-- Product -->
					
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
							<!-- product_color -->
							<ul class="product-colors">
								<h3>색상</h3>
								<select id="colorCheck">
									<option value="0">-[필수] 옵션을 선택해주세요-</option>
									<option value="0">-----------------------------------------</option>
									<c:forEach items="${requestScope.clist}" var="clist">
										<option class="colorSelect" value="${clist.pcno}">${clist.color_name}</option>
									</c:forEach>
								</select>
								<!-- product_size -->
								<div class="clear" id="slsSize">
									<h3>사이즈</h3>
									<select id="sizeSelectAjax">
										<option>-[필수] 옵션을 선택해주세요-</option>
										<option>-----------------------------------------</option>
									</select>
								</div>
							</ul>
							<!-- 재고량등록 -->
							<div class="quantity_box">
								<ul class="product-qty">
									<span>주문수량:</span>
									<!-- quantity 주문갯수 -->
									<input type="number" name="quantity" min="0">
								</ul>
							</div>
							<div class="clearfix"></div>
							<div class="single-but item_add">
								<input type="submit" value="장바구니담기" /> <input type="submit"
									value="즉시구매" />
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
					<br> <br>
					<div class="memberSize1"
						id=<sec:authentication property="principal.id"/>>
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
									<c:when test="${requestScope.pvo.category=='하의'}">
										<tr>
											<th>사이즈</th>
											<th>허리</th>
											<th>허벅지</th>
											<th>밑위</th>
											<th>밑단</th>
											<th>하의 총기장</th>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<th>사이즈</th>
											<th>어깨</th>
											<th>가슴</th>
											<th>소매</th>
											<th>암홀</th>
											<th>상의 총기장</th>
										</tr>
									</c:otherwise>
								</c:choose>
							</thead>
							<%-- <tbody>
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
							</tbody> --%>
						</table>
					</div>


					<!-- review table -->
					<table>
						<thead>
							<tr>
								<th>리뷰번호</th>
								<th>색상명</th>
								<th>사이즈명</th>
								<th>작성자</th>
								<th>날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="prvolist" var="list">
								<tr>
									<td>${list.rno }</td>
									<td>${list.color_name}</td>
									<td>${list.size_name }</td>
									<td>${list.id }</td>
									<td>${list.regdate }</td>
								</tr>
								<tr>
									<td>${list.content }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--end-single-->