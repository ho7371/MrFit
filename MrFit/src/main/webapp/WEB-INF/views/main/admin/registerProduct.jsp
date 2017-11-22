<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">

</script>
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
<!--start-account-->
	<div class="account">
		<div class="container"> 
			<div class="account-bottom">
				<div class="col-md-6 account-left">
				<form method="post" action="${pageContext.request.contextPath}/registerProduct.do" id="regForm">
					<sec:csrfInput/><%-- csrf 토큰 --%>
					<div class="account-top heading">
						<h3>REGISTER PRODUCT</h3>
					</div>
					<div class="address">
						<span>상품명</span>
						<input type="text" name="name" id="">
					</div>
					<div class="address">
						<span>Category</span> <select id="category">
							<option value="0">-[필수] 카테고리를 선택해주세요-</option>
							<option value="0">-----------------------------------------</option>
							<option value="상의">상의</option>
							<option value="하의">하의</option>
							<option value="아우터">아우터</option>
						</select>
					</div>
					<div class="address">
						<span>상품내용</span>
						<textarea class="form-control" id="comments" name="content" placeholder="Contents" rows="5" required="required" style="resize: none;"></textarea>
					</div>
					<div class="address">
						<span>가격</span>
						<input type="text" name="price">
					</div>		
					<div class="address new">
						<input type="submit" value="등록">
					</div>
					<!-- product_color -->
						<input type="text" name="" value="">
						<input type="button" value="색상등록" id="addColor">
					<!-- product_size -->
						<input type="checkbox" name="size_name" value="S">Small<br>
  						<input type="checkbox" name="size_name" value="M" >Medium<br>
						<input type="checkbox" name="size_name" value="L" >Large<br>
					<!--detail size and inventory -->
						<table id="">
							<thead>
								<tr><th>어깨</th><th>가슴</th><th>소매</th><th>암홀</th><th>상의총기장</th></tr>
							</thead>
							<tbody>
								<tr>
								<td><input type="number" name="shoulder" size="10" maxlength="3" ></td>
								<td><input type="number" name="chest" size="10" maxlength="3"></td>
								<td><input type="number" name="sleeve" size="10" maxlength="3"></td>
								<td><input type="number" name="armhole" size="10" maxlength="3"></td>
								<td><input type="number" name="toplength" size="10" maxlength="3"></td>
							</tr>
							</tbody>
						</table>
						<table id="">
							<thead>
								<tr><th>허리</th><th>밑위</th><th>허벅지</th><th>밑단</th><th>하의총기장</th></tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="number" name="waist" size="10" maxlength="3"></td>
									<td><input type="number" name="crotch" size="10" maxlength="3"></td>
									<td><input type="number" name="thigh" size="10" maxlength="3"></td>
									<td><input type="number" name="hem" size="10" maxlength="3"></td>
									<td><input type="number" name="bottomlength" size="10" maxlength="3"></td>
								</tr>
							</tbody>
						</table>
				</form>
				</div>
				<div class="col-md-6 account-left">
					
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--end-account-->
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
					
				</div>
			</div>
		</div>
	</div>
</div>
<!--end-single-->