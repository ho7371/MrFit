<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!--start-ckeckout--> 
<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
<sec:authorize access="hasRole('ROLE_MEMBER')" var="isMember" />
<div class="ckeckout">
	<div class="container">
		<div class="ckeckout-top">
			<div class=" cart-items heading">
				<h3>고객문의</h3>
				<sec:authorize access="hasRole('ROLE_MEMBER')" var="isMember" />
					<c:if test="${isMember}">
						<div style="float:right;">
							<a href="${pageContext.request.contextPath}/registerInquiryForm.do"><button style="margin-bottom: 20px;">고객문의 등록</button></a>
						</div>
					</c:if>
				<table class="table-board">
					<thead>
						<tr>
							<th>No</th><th>Title</th><th>Writer</th><th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.lvo.list}" var="i">
						<c:choose>
							<c:when test="${isAdmin}">
							<tr  style="cursor: pointer;"  onclick="location.href='${pageContext.request.contextPath}/inquiryDetail.do?iqno=${i.iqno}'">
								<td>${i.iqno}</td>
								<td>${i.title}</td>
								<td>${i.id}</td>
								<td>${i.regdate}</td>
							</tr>
							</c:when>
							<c:when test="${user =='user' && i.security=='private'}">
							<tr  style="cursor: pointer;"  <%-- onclick="location.href='${pageContext.request.contextPath}/inquiryDetail.do?iqno=${i.iqno}' --%>">
								<td>${i.iqno}</td>
								<td>비밀글입니다.</td>
								<td>${i.id}</td>
								<td>${i.regdate}</td>
							</tr>
							</c:when>
							<c:when test="${i.security=='private' && i.id != mvo.id && isMember}">
							<tr>
								<td>${i.iqno}</td>
								<td>비밀글입니다.</td>
								<td>${i.id}</td>
								<td>${i.regdate}</td>
							</tr>
							</c:when>
							<c:otherwise>
								<tr  style="cursor: pointer;"  onclick="location.href='${pageContext.request.contextPath}/inquiryDetail.do?iqno=${i.iqno}'">
								<td>${i.iqno}</td>
								<td>${i.title}</td>
								<td>${i.id}</td>
								<td>${i.regdate}</td>
								</tr>
							</c:otherwise>
						</c:choose>
						</c:forEach> 
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!--end-ckeckout-->
<div class="pagingInfo" align="center">
	<ul class="pagination">
		<c:set value="${lvo.pagingBean}" var="pb"/>
		<c:if test="${pb.previousPageGroup==true}">
   			<li>
   				<a href="memberNoteList.do?nowPage=${pb.startPageOfPageGroup-1}">Previous</a>
   			</li>
   			</c:if>
   				<c:forEach begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}" var="pageNum">
	   			
	   				<c:choose>
	   					<c:when test="${pageNum==pb.nowPage}">
							<li><a>${pageNum}</a>&nbsp;</li>
						</c:when>
					<c:otherwise>
						<li>
							<a href="memberNoteList.do?nowPage=${pageNum}">${pageNum}</a>
							&nbsp;
						</li>
					</c:otherwise>
   				</c:choose>
   			</c:forEach>
   			<c:if test="${pb.nextPageGroup==true}">
    			<li>
    				<a href="memberNoteList.do?nowPage=${pb.endPageOfPageGroup+1}">Next</a>
    			</li>
    		</c:if>
	</ul>	 		
</div>