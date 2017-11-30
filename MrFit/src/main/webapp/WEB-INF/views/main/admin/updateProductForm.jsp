<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	
</script>

	<!-- Product -->
<!--start-account-->
	<div class="account">
		<div class="container"> 
			<div class="account-bottom">
				<div class="col-md-6 account-left">
				<form method="post" action="${pageContext.request.contextPath}/admin/updateProduct.do" id="regForm">
					<sec:csrfInput/><%-- csrf 토큰 --%>
					<div class="account-top heading">
						<h3>Update PRODUCT</h3>
					</div>
					<!--detail size and inventory -->
						<table class="address" style="padding: 10px;">
							<thead>
								<tr>
								<th><input type="text" value="색상" size="10" readonly="readonly"></th>
								<th><input type="text" value="사이즈" size="10" readonly="readonly"></th>
								<th><input type="text" value="재고수량" size="10" readonly="readonly"></th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${pdvolist}" var="list">
								<tr>
								<td><input type="text" value="${list.color_name}" size="10" readonly="readonly">
								<input type="hidden" name="pdno" value="${list.pdno}">
								<input type="hidden" name="pcno" value="${list.pcno}">
								</td>
								<td><input type="text" value="${list.productSizeVO.size_name}" size="10" readonly="readonly">
								<input type="hidden" name="psno" value="${list.psno}">
								</td>
								<td><input type="text" name="inventory"  size="10" maxlength="10" required="required" value="${list.inventory}">
								</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					<div class="address new">
						<input type="submit" value="업데이트">
					</div>
				</form>	
				</div>
				<div class="col-md-6 account-left">
					
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--end-account-->