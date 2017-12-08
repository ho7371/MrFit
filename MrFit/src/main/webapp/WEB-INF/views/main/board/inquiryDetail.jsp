<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
<script src="https://cdn.rawgit.com/vast-engineering/jquery-popup-overlay/1.7.13/jquery.popupoverlay.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	 $("#messageBtn").click(function() {
	   	 if(confirm("댓글을 작성하시겠습니까?")){
		 	location.href="inquiryReply.do?message="+$("#message").val()+"&iqno="+$("#hiddenIqno").val();
	   	 }else{
	   	 	return false;
	   	 }
     }); // click
     
     $(".my_popup_close").click(function() {
       	if($("#message").val() != ""){
       		$("#message").val("");
       	}
     });
}); //ready
function selectSendReply(iqno){
	 $('#my_popup').popup({
    	  opacity: 0.3,
    	  transition: 'all 0.3s'
      });
	 $('#my_popup #hiddenIqno').val(iqno);
	 alert("전송될 고객문의 번호 : "+iqno);
}
function showReplyForm(){
	if ( $("#updateReplyTable").css('display') == 'none'){
		$("#updateReplyTable").css('display','block');
		$("#updateReplyFormBtn").html('댓글취소');
	}else{
		$("#updateReplyTable").css('display','none');
		$("#updateReplyFormBtn").html('댓글수정');
	}
}
</script>
<div class="ckeckout">
	<div class="container">
		<div class="ckeckout-top">
			<div class=" cart-items heading">
				<h3>문의 글</h3>
				<sec:authentication property='principal.id' var="isId"/>
				<c:if test="${ivo.id==isId}">
					<div style="float:right;">
						<a href="${pageContext.request.contextPath}/updateInquiryForm.do?iqno=${ivo.iqno}"><button style="margin-bottom: 20px;">문의 수정</button></a>
					</div>
				</c:if>
				<table class="table-board">
					<thead>
						<tr>
							<th>No</th><th>Title</th><th>Writer</th><th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${ivo.iqno}</td><td>${ivo.title}</td><td>${ivo.id}</td><td>${ivo.regdate}</td>
						</tr>
					</tbody>
					<thead>
						<tr><th colspan="4">본문</th></tr>
					</thead>
					<tbody>
						<tr><td colspan="4" style="height: 400px;">${ivo.content}</td></tr>
					</tbody>
				</table>
				<br>
				<c:if test="${ivo.id==isId}">
					<div>
						<a href="${pageContext.request.contextPath}/deleteInquiry.do?iqno=${ivo.iqno}"><button>문의 삭제</button></a>
					</div>
				</c:if>
				<c:choose>
					<c:when test="${ivo.inquiryReplyVO != null}">
						<table class="table-board inquiry">
							<thead><tr><th colspan="2">관리자 댓글</th></tr></thead>
							<tbody>
								<tr><td colspan="2">${ivo.inquiryReplyVO.content}</td></tr>
								<tr>
									<td style="background-color: #181b2a; color: white;">작성일</td><td>${ivo.inquiryReplyVO.regdate}</td>
								</tr>
							</tbody>
						</table>
						<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
						
						<table class="table-board" style="display: none;" id="updateReplyTable">
							<thead>
								<tr><th colspan="2">수정할 내용</th></tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<form action="updateInquiryReply.do" method="post" id="updateReplyForm">
											<sec:csrfInput/>
											<input type="hidden" name="iqno" value="${ivo.iqno}">
											<input type="hidden" name="iqrno" value="${ivo.inquiryReplyVO.iqrno}">
											<textarea rows="5" cols="60" name="content">${ivo.inquiryReplyVO.content}</textarea>
										</form>
									</td>
									<td>
										<button type="submit" form="updateReplyForm" style="color: white;">수정완료</button>
									</td>
								</tr>
							</tbody>
						</table>
						<c:if test="${isAdmin}">
							<div>
								<button onclick="showReplyForm()" id="updateReplyFormBtn" style="margin:0.5em; color:white;">댓글수정</button>
							</div>
						</c:if>
					</c:when>
					<c:otherwise>
						<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
						<c:if test="${isAdmin}">
							<button class="my_popup_open btn btn-default" onclick='selectSendReply("${ivo.iqno}")' style="color: white;">댓글달기</button>
						</c:if>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
		</div>
	</div>
<%-- 쪽지 창  --%>
<div id="my_popup" style="display: none;">
	<h4 align="center">댓글</h4>
	<textarea rows="20" cols="70" id = "message" name = "message"></textarea><br>
	<div align="center">
	<input type="hidden" id="hiddenIqno" value="">
	<button type ="button" id = "messageBtn">전송</button>
    <button class="my_popup_close" type ="button">Close</button>
	</div>
</div>
