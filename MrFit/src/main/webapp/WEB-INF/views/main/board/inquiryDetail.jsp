<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
<script src="https://cdn.rawgit.com/vast-engineering/jquery-popup-overlay/1.7.13/jquery.popupoverlay.js"></script>
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
					</c:when>
					<c:otherwise>
						<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
						<c:if test="${isAdmin}">
							<button class="my_popup_open btn btn-default" onclick='selectSendReply("${ivo.iqno}")'>댓글달기</button>
						</c:if>
					</c:otherwise>
				</c:choose>
					
					
					<%-- 쪽지 창  --%>
					<div id="my_popup" style="display: none;">
						<h4 align="center">댓글</h4>
						<textarea rows="20" cols="70" id = "message" name = "message"></textarea><br>
						<div align="center">
						<input type="hidden" id="hiddenIqno" value="">
						<input type ="button" id = "messageBtn" value = "전송">
					    <button class="my_popup_close" type ="button">Close</button>
						</div>
					</div>
					
					
					<script type="text/javascript">
						function selectSendReply(iqno){
							 $('#my_popup').popup({
						    	  opacity: 0.3,
						    	  transition: 'all 0.3s'
						      });
							 $('#my_popup #hiddenIqno').val(iqno);
							 alert("전송될 고객문의 번호 : "+iqno);
						}
						
						$(document).ready(function(){
							 $("#messageBtn").click(function() {
						    	  if(confirm("메세지를 보내시겠습니까?")){
							    	  location.href="inquiryReply.do?message="+$("#message").val()+"&iqno="+$("#hiddenIqno").val();
						    	  }else{
						    		  return false;
						    	  }
						      	
						      }); // click
						      
						      $(".my_popup_close").click(function() {
						        	if($("#message").val() != ""){
						        		$("#message").val("");
						        	}
						        })
						}); //ready
					</script>
				</div>
			</div>
		</div>
	</div>
</div>