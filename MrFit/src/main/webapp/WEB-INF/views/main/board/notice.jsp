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
					<div style="float:right;">
						<a href="${pageContext.request.contextPath}/registerNoticeForm.do"><button style="margin-bottom: 20px;">공지사항 등록</button></a>
					</div>
				</c:if>
						
				<table class="table-board">
					<thead>
						<tr>
							<th>No</th><th>Title</th><th>Writer</th><th>작성일</th><th>비고</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${lvo.list}" var="nlist">
							<tr>
								<td>${nlist.bno}</td>
								<td>
									<a href="${pageContext.request.contextPath}/noticeDetail.do?bno=${nlist.bno}">
									${nlist.title}</a>
								</td>
								<td>관리자</td>
								<td>${nlist.regdate}</td>
								<td>
									<c:if test="${isAdmin}">
										<a href="${pageContext.request.contextPath}/deleteNotice.do?bno=${nlist.bno}"><button class="btn btn-default">삭제</button></a>
									</c:if>
								</td>
							</tr>
						</c:forEach> 
					</tbody>
				</table>
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

