<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<h3>공지사항</h3>
				<!-- 관리자 입장시 공지사항 등록/삭제 버튼 생성 -->
				<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
					<c:if test="${isAdmin}">
						<a href="${pageContext.request.contextPath}/registerNoticeForm.do">공지사항 등록</a>
					</c:if>
				<div class="in-check">
					<ul class="unit">
						<li><span>No</span></li>
						<li><span>Title</span></li>
						<li><span>Writer</span></li>					
						<li><span>작성일</span></li>
						<div class="clearfix"></div>
					</ul>
					
					<%--공지사항 읽어오기 백단 완료되면 이것 사용함--%>
						<c:forEach items="${lvo.list}" var="nlist">
						<a href="${pageContext.request.contextPath}/noticeDetail.do?bno=${nlist.bno}">
							<ul class="cart-header">
								<li><span>${nlist.bno }</span></li>
								<li><span>${nlist.title}</span></li>
								<li><span>${nlist.id}</span></li>
								<li><span>${nlist.regdate}</span></li>
								 <c:if test="${isAdmin}">
									<a href="${pageContext.request.contextPath}/deleteNotice.do?bno=${nlist.bno}">${nlist.bno}번 공지 삭제</a>
								</c:if>
								<div class="clearfix"></div>
							</ul>
							</a>
						</c:forEach> 
					
					
		
				</div>
			</div>
		</div>
	</div>
</div>
<!--end-ckeckout-->
<c:set value="${lvo.pagingBean}" var="pb" />
<div class="pagingInfo" align="center">
	<ul class="pagination">
		<c:if test="${pb.previousPageGroup==true}">
   			<li>
   				<a href="notice.do?pageNo=${pb.startPageOfPageGroup-1}">Previous</a>
   			</li>
   			</c:if>
   				<c:forEach begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}" var="pageNum">
	   				<c:choose>
	   					<c:when test="${pageNum==pb.nowPage}">
							<li><a>${pageNum}</a>&nbsp;</li>
						</c:when>
					<c:otherwise>
						<li>
							<a href="notice.do?pageNo=${pageNum}">${pageNum}</a>
							&nbsp;
						</li>
					</c:otherwise>
   				</c:choose>
   			</c:forEach>
   			<c:if test="${pb.nextPageGroup==true}">
    			<li>
    				<a href="notice.do?pageNo=${pb.endPageOfPageGroup+1}">Next</a>
    			</li>
    		</c:if>
	</ul>	 		
</div> 	

