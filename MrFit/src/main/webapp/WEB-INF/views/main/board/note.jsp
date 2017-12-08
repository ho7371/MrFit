<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script>
	$(document).ready(function(c) {
		$('.close1').on('click', function(c) {
			$('.cart-header').fadeOut('slow', function(c) {
				$('.cart-header').remove();
			});
		});
	});
</script>
<script>
	$(document).ready(function(c) {
		$('.close2').on('click', function(c) {
			$('.cart-header1').fadeOut('slow', function(c) {
				$('.cart-header1').remove();
			});
		});
	});
</script>
<script>
	$(document).ready(function(c) {
		$('.close3').on('click', function(c) {
			$('.cart-header2').fadeOut('slow', function(c) {
				$('.cart-header2').remove();
			});
		});
	});
</script>
<!--start-ckeckout-->
<div class="ckeckout">
	<div class="container">
		<div class="ckeckout-top">
			<div class=" cart-items heading">
			<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
			<sec:authorize access="hasRole('ROLE_MEMBER')" var="isMember" />
						  
				<h3>쪽지함</h3>
				<c:if test="${isAdmin}">
					<div style="float:right;">
						<a href="${pageContext.request.contextPath}/commonMemberList.do?status=1">
							<button style="margin-bottom: 1em;color: white;">쪽지보내기</button>
						</a>
					</div>
				</c:if>
				
				<table class="table-board">
					<thead>
						<tr class="success">
							<c:choose>
								<c:when test="${isAdmin}">
									<th>쪽지번호</th><th>받는사람</th><th>받은내용</th><th>받은날짜</th>
								</c:when>
								<c:otherwise>
									<th>쪽지번호</th><th>보낸사람</th><th>보낸내용</th><th>보낸날짜</th>
								</c:otherwise>
							</c:choose>
						</tr>
					</thead>
						<tbody><%-- 쪽지함 돌릴 때 사용할 코드 --%>						
							<c:choose>
								<c:when test="${isAdmin}"> <!-- 관리자가 보는 쪽지 리스트 -->
									<c:forEach items="${requestScope.lvo.list}" var="i">
										<tr>
											<td>${i.note_no}</td>
											<td>${i.id}</td>
											<td>${i.content}</td>
											<td>${i.send_date}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise><!-- 회원이 보는 쪽지 리스트 -->
									<c:forEach items="${requestScope.lvo.list}" var="i">
										<tr>
											<td>${i.note_no}</td>
											<td>관리자</td>
											<td>${i.content}</td>
											<td>${i.send_date}</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose> 
						</tbody>					
					</table>
				</div>
			</div>
		</div>
	</div>

<!--end-ckeckout-->

<%-- 페이징 처리 --%>
<c:choose>
	<c:when test="${isAdmin}"><!-- 관리자가 보는 페이징 -->
		<div class="pagingInfo" align="center">
			<ul class="pagination">
				<c:set value="${lvo.pagingBean}" var="pb"/>
				<c:if test="${pb.previousPageGroup==true}">
		   			<li>
		   				<a href="adminNoteList.do?nowPage=${pb.startPageOfPageGroup-1}">Previous</a>
		   			</li>
		   			</c:if>
		   				<c:forEach begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}" var="pageNum">
			   			
			   				<c:choose>
			   					<c:when test="${pageNum==pb.nowPage}">
									<li><a>${pageNum}</a></li>
								</c:when>
							<c:otherwise>
								<li>
									<a href="adminNoteList.do?nowPage=${pageNum}">${pageNum}</a>
									
								</li>
							</c:otherwise>
		   				</c:choose>
		   			</c:forEach>
		   			<c:if test="${pb.nextPageGroup==true}">
		    			<li>
		    				<a href="adminNoteList.do?nowPage=${pb.endPageOfPageGroup+1}">Next</a>
		    			</li>
		    		</c:if>
			</ul>	 		
		</div>
	</c:when>
	<c:otherwise><!-- 회원이 보는 페이징 -->
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
									<li><a>${pageNum}</a></li>
								</c:when>
							<c:otherwise>
								<li>
									<a href="memberNoteList.do?nowPage=${pageNum}">${pageNum}</a>
									
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
	</c:otherwise>
</c:choose>


