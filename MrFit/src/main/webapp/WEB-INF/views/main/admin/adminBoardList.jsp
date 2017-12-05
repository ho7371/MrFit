<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.rawgit.com/vast-engineering/jquery-popup-overlay/1.7.13/jquery.popupoverlay.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<div class="container">
  <h2>게시물 관리</h2>

  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
    <li><a data-toggle="tab" href="#menu1">Menu 1</a></li>
    <li><a data-toggle="tab" href="#menu2">Menu 2</a></li>
    <li><a data-toggle="tab" href="#menu3">Menu 3</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>HOME</h3>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>Menu 1</h3>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>Menu 2</h3>
    </div>
    <div id="menu3" class="tab-pane fade">
      <h3>Menu 3</h3>
    </div>
  </div>
</div>
<!-- start review table -->
<div class="ckeckout">
	<div class="container" style="padding-left: 0px;">
		<div class="ckeckout-top">
			<div class=" cart-items heading">
				<section class="buttons">
					<ul class="nav nav-tabs">
						<li><a href="#tab1" style="font-size:20px">상품리뷰</a></li>
						<li><a href="#tab2" style="font-size:20px">상품문의</a></li>
						<li><a href="#tab3" style="font-size:20px">고객문의</a></li>
					</ul>
        		</section>

<!-- 상품리뷰 -->
<div class="tab_item" id="tab1">
	<div class="in-check">
		<table class="table table-hover">
			<thead class="row">
		  		<tr>
				<th class="col-sm-1">문의번호</th>
				<th class="col-sm-5">내용</th>
				<th class="col-sm-1">색상</th>
				<th class="col-sm-1">사이즈</th>
				<th class="col-sm-1">작성자</th>
				<th class="col-sm-2">날짜</th>
				<th class="col-sm-1">수정</th>
				</tr>					
			</thead>
		    	<c:set value="${prlvo.pagingBean}" var="pb"/>
				<c:forEach items="${prlvo.list}" var="list" varStatus="order">
			<tbody>
				<tr>
				<td>${list.rno}</td>
				<td id="${list.id}">${list.content}</td>
				<td>${list.color_name}</td>
				<td>${list.size_name}</td>
				<td>${list.id}</td>
				<td>${list.regdate }</td>
				</tr>
			</tbody>
				</c:forEach>
		</table>
<!-- review table paging처리 -->
		<div class="container" align="center">
			<ul class="pager">
				<c:if test="${pb.previousPageGroup==true}">
					<li><a href="findProductDetailByPno.do?pno=${requestScope.pno}&pageNo=${pb.startPageOfPageGroup-1}&checkScroll=inquiryScroll">Previous</a></li>
				</c:if>
				<c:forEach begin="${pb.startPageOfPageGroup}" 
				end="${pb.endPageOfPageGroup}" var="pageNum">
					<c:choose>
						<c:when test="${pageNum==pb.nowPage}">
							<li>${pageNum}&nbsp;&nbsp;</li>
						</c:when>
						<c:otherwise>
							<li><a href="findProductDetailByPno.do?pno=${requestScope.pno}&pageNo=${pageNum}&checkScroll=inquiryScroll">${pageNum}</a>&nbsp;&nbsp;</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pb.nextPageGroup==true}">
					<li><a href="findProductDetailByPno.do?pno=${requestScope.pno}&pageNo=${pb.endPageOfPageGroup+1}&checkScroll=inquiryScroll">Next</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</div>
<!-- end review table  -->		

<!-- star QnA table -->
<div class="tab_item" id="tab2">
	<div class="in-check">
		<table class="table table-hover">
  			<thead class="row">
    			<tr>
					<th class="col-sm-1">문의번호</th>
					<th class="col-sm-6">내용</th>
					<th class="col-sm-2">작성자</th>
					<th class="col-sm-3">날짜</th>
      			</tr>					
    		</thead>
    		<c:set value="${lpqlist.pagingBean}" var="pqpb"/>
			<c:forEach items="${lpqlist.list}" var="pqlist" varStatus="order">
			<tbody>
				 <tr>
					<td>${pqlist.pqno}</td>
					<td>${pqlist.content}</td>
					<td>${pqlist.id}</td>
					<td>${pqlist.regdate}</td>
				</tr>
			</tbody>
			</c:forEach>
		</table>
<!-- QnA table paging처리 -->
		<div class="container" align="center">
  			<ul class="pager">
	   			<c:if test="${pqpb.previousPageGroup==true}">
	   				<li><a href="findProductDetailByPno.do?pno=${requestScope.pno}&pqPageNo=${pqpb.startPageOfPageGroup-1}&checkScroll=QnAScroll">Previous</a></li>
	   			</c:if>
   				<c:forEach begin="${pqpb.startPageOfPageGroup}" 
   				end="${pqpb.endPageOfPageGroup}" var="pageNum">
   					<c:choose>
   						<c:when test="${pageNum==pqpb.nowPage}">
							<li>${pageNum}&nbsp;&nbsp;</li>
						</c:when>
						<c:otherwise>
							<li><a href="findProductDetailByPno.do?pno=${requestScope.pno}&pqPageNo=${pageNum}&checkScroll=QnAScroll">${pageNum}</a>&nbsp;&nbsp;</li>
						</c:otherwise>
   					</c:choose>
   				</c:forEach>
   				<c:if test="${pqpb.nextPageGroup==true}">
    				<li><a href="findProductDetailByPno.do?pno=${requestScope.pno}&pqPageNo=${pqpb.endPageOfPageGroup+1}&checkScroll=QnAScroll">Next</a></li>
    			</c:if>
 			</ul>
		</div>
	</div>
</div>
<!-- end QnA table -->		

<!-- inquiry table -->
<div class="tab_item" id="tab3">				
	<div class="ckeckout">
		<div class="container">
			<div class="ckeckout-top">
				<div class=" cart-items heading">
					<h3>고객문의</h3>
					<table class="table-board">
						<thead>
							<tr>
								<th>No</th><th>Title</th><th>Writer</th><th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.lvo.list}" var="i">
								<tr  style="cursor: pointer;"  onclick="location.href='${pageContext.request.contextPath}/inquiryDetail.do?iqno=${i.iqno}'">
									<td>${i.iqno}</td>
									<td>${i.title}</td>
									<td>${i.id}</td>
									<td>${i.regdate}</td>
								</tr>
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
</div>
<!-- inquiry table end -->
</div>
</div>
</div>
</div>