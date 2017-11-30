<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#searchTypeForm").submit(function(){
			if($("#searchTypeForm [name=id]").val()==""){
				alert("검색할 아이디를 입력하세요.");
				return false;
			}
		});
	});
</script>
<h3>포인트 이력</h3>
<%-- 검색 --%>
<div align="right">
	<a href="${pageContext.request.contextPath}/adminPointList.do">전체 포인트 이력</a>&nbsp; | &nbsp;
	<a href="${pageContext.request.contextPath}/adminSearchPointByStatus.do?status=상품구입">상품 구입 이력</a>&nbsp; | &nbsp;
	<a href="${pageContext.request.contextPath}/adminSearchPointByStatus.do?status=관리자 지급">관리자 지급 이력</a> &nbsp;
	<form action="${pageContext.request.contextPath}/adminSearchPoint.do" id="searchTypeForm">
		<input type="text" name="id" placeholder="아이디">
		<input type="submit" value="검색">
	</form>
</div>
<%-- 포인트 이력 테이블 --%>
<table class="table-board">
		<thead>
		<tr class="success">
			<th class="title">번호</th>
			<th>회원ID </th>
			<th>포인트 </th>
			<th>지급시각</th>
			<th>지급형태</th>
			</tr>
		</thead>
		<c:forEach var="point" items="${lvo.list}" varStatus="i">	
			<tbody>						
				<tr>
				    <td>${point.point_no}</td>				
					<td>${point.id}</td>
					<td>${point.updown}</td>
					<td>${point.change_date}</td>
					<td>${point.status}</td>
				</tr>	
			</tbody>					
		</c:forEach>
	</table>
	
<%-- 페이징 처리 --%>
<c:set value="${lvo.pagingBean}" var="pb" />
<div class="container" align="center">
	<ul class="pager">
		<c:if test="${pb.previousPageGroup==true}">
			<li><a
				href="adminSearchPoint.do?nowPage=${pb.startPageOfPageGroup-1}&id=${lvo.list[0].id}">Previous</a></li>
		</c:if>
		<c:forEach begin="${pb.startPageOfPageGroup}"
			end="${pb.endPageOfPageGroup}" var="pageNum">
			<c:choose>
				<c:when test="${pageNum==pb.nowPage}">
					<li>${pageNum}&nbsp;&nbsp;</li>
				</c:when>
				<c:otherwise>
					<li><a href="adminSearchPoint.do?&nowPage=${pageNum}&id=${lvo.list[0].id}">${pageNum}</a>&nbsp;&nbsp;</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pb.nextPageGroup==true}">
			<li><a
				href="adminSearchPoint.do?nowPage=${pb.endPageOfPageGroup+1}&id=${lvo.list[0].id}">Next</a></li>
		</c:if>
	</ul>
</div>
