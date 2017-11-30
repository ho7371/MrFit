<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				href="adminPointList.do?nowPage=${pb.startPageOfPageGroup-1}">Previous</a></li>
		</c:if>
		<c:forEach begin="${pb.startPageOfPageGroup}"
			end="${pb.endPageOfPageGroup}" var="pageNum">
			<c:choose>
				<c:when test="${pageNum==pb.nowPage}">
					<li>${pageNum}&nbsp;&nbsp;</li>
				</c:when>
				<c:otherwise>
					<li><a href="adminPointList.do?&nowPage=${pageNum}">${pageNum}</a>&nbsp;&nbsp;</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pb.nextPageGroup==true}">
			<li><a
				href="adminPointList.do?nowPage=${pb.endPageOfPageGroup+1}">Next</a></li>
		</c:if>
	</ul>
</div>
