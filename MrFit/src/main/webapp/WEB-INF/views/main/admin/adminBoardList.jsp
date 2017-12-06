<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.rawgit.com/vast-engineering/jquery-popup-overlay/1.7.13/jquery.popupoverlay.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		var currtab=$("#tab").val();
		if(currval=="tab1"){
		 location.hash = "#tab1";			
		}
		if(currval=="tab2"){
			 location.hash = "#tab2";			
			}
		if(currval=="tab3"){
			 location.hash = "#tab3";			
			}
		 
		$("#tab1").click(function() {
			location.href="adminBoardList.do";
		});
		$("#tab2").click(function() {
			location.href="adminBoardListPQna.do";
		});
		$("#tab3").click(function() {
			location.href="adminBoardListQna.do";
		});
	});
</script>
<input type="hidden" value="${tab }" id="tab">
<div class="container">
  <h2>게시물 관리</h2>
	<ul class="nav nav-tabs">
    <li><a data-toggle="tab" href="#menu1" id="tab1">상품리뷰</a></li>
    <li><a data-toggle="tab" href="#menu2" id="tab2">상품문의</a></li>
    <li><a data-toggle="tab" href="#menu3" id="tab3">고객문의</a></li>
  </ul>

  <div class="tab-content">
    <div id="menu1" class="tab-pane fade">
      <h3>상품리뷰</h3>
      <div class="in-check">
      <form>
		<table class="table table-hover">
			<thead class="row">
		  		<tr>
				<th class="col-sm-1">문의번호</th>
				<th class="col-sm-5">내용</th>
				<th class="col-sm-1">색상</th>
				<th class="col-sm-1">사이즈</th>
				<th class="col-sm-1">작성자</th>
				<th class="col-sm-2">날짜</th>
				<th class="col-sm-1">삭제</th>
				</tr>					
			</thead>
		    	<c:set value="${prlvo.pagingBean}" var="prpb"/>
				<c:forEach items="${prlvo.list}" var="list" varStatus="order">
			<tbody>
				<tr>
				<td>${list.rno}</td>
				<td id="${list.id}">${list.content}</td>
				<td>${list.color_name}</td>
				<td>${list.size_name}</td>
				<td>${list.id}</td>
				<td>${list.regdate }</td>
				<td><input type="submit" value="deleteReview.do?rno=${list.rno}">삭제</td>
				</tr>
			</tbody>
				</c:forEach>
		</table>
		</form>
<!-- review table paging처리 -->
		<div class="container" align="center">
			<ul class="pager">
				<c:if test="${prpb.previousPageGroup==true}">
					<li><a href="adminBoardList.do?nowPage=${prpb.startPageOfPageGroup-1}">Previous</a></li>
				</c:if>
				<c:forEach begin="${prpb.startPageOfPageGroup}" 
				end="${prpb.endPageOfPageGroup}" var="pageNum">
					<c:choose>
						<c:when test="${pageNum==prpb.nowPage}">
							<li>${pageNum}&nbsp;&nbsp;</li>
						</c:when>
						<c:otherwise>
							<li><a href="adminBoardList.do?nowPage=${pageNum}">${pageNum}</a>&nbsp;&nbsp;</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${prpb.nextPageGroup==true}">
					<li><a href="adminBoardList.do?nowPage=${prpb.endPageOfPageGroup+1}">Next</a></li>
				</c:if>
			</ul>
		</div>
	</div>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>상품문의</h3>
      <div class="in-check">
      <form>
		<table class="table table-hover">
  			<thead class="row">
    			<tr>
					<th class="col-sm-1">문의번호</th>
					<th class="col-sm-5">내용</th>
					<th class="col-sm-2">작성자</th>
					<th class="col-sm-3">날짜</th>
					<th class="col-sm-1">삭제</th>
      			</tr>					
    		</thead>
    		<c:set value="${pqlist.pagingBean}" var="pqpb"/>
			<c:forEach items="${pqlist.list}" var="pqna" varStatus="order">
			<tbody>
				 <tr>
					<td>${pqna.pqno}</td>
					<td>${pqna.content}</td>
					<td>${pqna.id}</td>
					<td>${pqna.regdate}</td>
					<td><input type="submit" value="deletePQna.do?pqno=${pqna.pqno}">삭제</td>
				</tr>
			</tbody>
			</c:forEach>
		</table>
      </form>
<!-- QnA table paging처리 -->
		<div class="container" align="center">
  			<ul class="pager">
	   			<c:if test="${pqpb.previousPageGroup==true}">
	   				<li><a href="adminBoardListPQna.do?nowPage=${pqpb.startPageOfPageGroup-1}">Previous</a></li>
	   			</c:if>
   				<c:forEach begin="${pqpb.startPageOfPageGroup}" 
   				end="${pqpb.endPageOfPageGroup}" var="pageNum">
   					<c:choose>
   						<c:when test="${pageNum==pqpb.nowPage}">
							<li>${pageNum}&nbsp;&nbsp;</li>
						</c:when>
						<c:otherwise>
							<li><a href="adminBoardListPQna.do?nowPage=${pageNum}">${pageNum}</a>&nbsp;&nbsp;</li>
						</c:otherwise>
   					</c:choose>
   				</c:forEach>
   				<c:if test="${pqpb.nextPageGroup==true}">
    				<li><a href="adminBoardListPQna.do?nowPage=${pqpb.endPageOfPageGroup+1}">Next</a></li>
    			</c:if>
 			</ul>
		</div>
	</div>
    </div>
    <div id="menu3" class="tab-pane fade">
      <h3>고객문의</h3>
      <div class="in-check">
      	<form>
					<table class="table-board">
						<thead>
							<tr>
								<th>No</th><th>Title</th><th>Writer</th><th>작성일</th><th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${inqlvo.list}" var="inqu">
								<tr  style="cursor: pointer;"  onclick="location.href='${pageContext.request.contextPath}/inquiryDetail.do?iqno=${inqu.iqno}'">
									<td>${inqu.iqno}</td>
									<td>${inqu.title}</td>
									<td>${inqu.id}</td>
									<td>${inqu.regdate}</td>
									<td><input type="submit" value="deleteQna.do?iqno=${inqu.iqno}">삭제</td>
								</tr>
							</c:forEach> 
						</tbody>
					</table>
      	</form>
				<div class="pagingInfo" align="center">
					<ul class="pagination">
						<c:set value="${inqlvo.pagingBean}" var="inpb" />
						<c:if test="${inpb.previousPageGroup==true}">
							<li><a href="adminBoardListQna.do?nowPage=${inpb.startPageOfPageGroup-1}">Previous</a></li>
						</c:if>
						<c:forEach begin="${inpb.startPageOfPageGroup}" end="${inpb.endPageOfPageGroup}" var="pageNum">
							<c:choose>
								<c:when test="${pageNum==inpb.nowPage}">
									<li><a>${pageNum}</a>&nbsp;</li>
								</c:when>
								<c:otherwise>
									<li><a href="adminBoardListQna.do?nowPage=${pageNum}">${pageNum}</a>&nbsp;</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${inpb.nextPageGroup==true}">
							<li>
								<a href="adminBoardListQna.do?nowPage=${inpb.endPageOfPageGroup+1}">Next</a>
							</li>
						</c:if>
					</ul>
				</div>
		</div>
		</div>
	</div>
</div>
	<!--end-ckeckout-->
