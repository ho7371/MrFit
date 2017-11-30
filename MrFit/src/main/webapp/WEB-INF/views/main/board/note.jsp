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
					<a href="${pageContext.request.contextPath}/commonMemberList.do?status=1">쪽지보내기</a>
				</c:if>
				<div class="in-check">
					<ul class="unit">
					<%-- 쪽지함 돌릴 때 사용할 코드--%>
						<c:choose>
							<c:when test="${isAdmin}">
								<li><span>쪽지번호</span></li>
								<li><span>받는사람</span></li>
								<li><span>받은내용</span></li>
								<li><span>받은날짜</span></li>
							</c:when>
							<c:otherwise>
								<li><span>쪽지번호</span></li>
								<li><span>보낸사람</span></li>
								<li><span>보낸내용</span></li>
								<li><span>보낸날짜</span></li>
							</c:otherwise>
						</c:choose>
						
						<div class="clearfix"></div>
					</ul>
						<%-- 쪽지함 돌릴 때 사용할 코드 --%>
						<c:choose>
							<c:when test="${isAdmin}"> <!-- 관리자가 보는 쪽지 리스트 -->
								<c:forEach items="${requestScope.lvo.list}" var="i">
									<ul class="cart-header">
										<li><span>${i.note_no}</span></li>
										<li><span>${i.id}</span></li>
										<li><span>${i.content}</span></li>
										<li><span>${i.send_date}</span></li>
										<div class="clearfix"></div>
									</ul>
								</c:forEach>
							</c:when>
							<c:otherwise><!-- 회원이 보는 쪽지 리스트 -->
								<c:forEach items="${requestScope.lvo.list}" var="i">
									<ul class="cart-header">
										<li><span>${i.note_no}</span></li>
										<li><span>관리자</span></li>
										<li><span>${i.content}</span></li>
										<li><span>${i.send_date}</span></li>
										<div class="clearfix"></div>
									</ul>
								</c:forEach>
							</c:otherwise>
						</c:choose> 
				</div>
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
									<li><a>${pageNum}</a>&nbsp;</li>
								</c:when>
							<c:otherwise>
								<li>
									<a href="adminNoteList.do?nowPage=${pageNum}">${pageNum}</a>
									&nbsp;
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
	</c:otherwise>
</c:choose>


