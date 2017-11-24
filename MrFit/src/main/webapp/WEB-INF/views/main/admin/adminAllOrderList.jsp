<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
${lvo.list}

<c:set value="${lvo.pagingBean}" var="pb" />
<div class="container" align="center">
  		<ul class="pager">
   			<c:if test="${pb.previousPageGroup==true}">
   			<li><a href="adminAllOrderList.do?pageNo=${pb.startPageOfPageGroup-1}">Previous</a></li>
   			</c:if>
   			<c:forEach begin="${pb.startPageOfPageGroup}" 
   			end="${pb.endPageOfPageGroup}" var="pageNum">
   			<c:choose>
   				<c:when test="${pageNum==pb.nowPage}">
				<li>${pageNum}&nbsp;&nbsp;</li>
				</c:when>
				<c:otherwise>
				<li><a href="adminAllOrderList.do?&pageNo=${pageNum}">${pageNum}</a>&nbsp;&nbsp;</li>
				</c:otherwise>
   			</c:choose>
   			</c:forEach>
   			<c:if test="${pb.nextPageGroup==true}">
    		<li><a href="adminAllOrderList.do?pageNo=${pb.endPageOfPageGroup+1}">Next</a></li>
    		</c:if>
 		 </ul>
</div>