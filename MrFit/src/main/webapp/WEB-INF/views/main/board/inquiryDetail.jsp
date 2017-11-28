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
				<div class="in-check" style="text-align: center;" align="center">
					<ul class="unit">
						<li><span>No</span></li>
						<li><span>Title</span></li>
						<li><span>Writer</span></li>
						<li><span>작성일</span></li>
						<div class="clearfix"></div>
					</ul>
					<ul class="cart-header">
						<li><span>${ivo.iqno}</span></li>
						<li><span>${ivo.title}</span></li>
						<li><span>${ivo.id}</span></li>
						<li><span>${ivo.regdate}</span></li>
						<div class="clearfix"></div>
					</ul>
				</div>
				<div class="in-check" style="text-align: center;">
					<ul class="unit">
						<li><span></span></li>
						<li><span></span></li>
						<li><span>본문</span></li>
						<li><span></span></li>
						<li><span></span></li>
						<div class="clearfix"></div>
					</ul>
					<ul class="cart-header" style="text-align: center;">
						${ivo.content}
						<div class="clearfix"></div>
					</ul>
					<c:choose>
						<c:when test="${ivo.inquiryReplyVO != null}">
							<ul class="cart-header" style="text-align: center;">
								<li><span>관리자</span></li>
								${ivo.inquiryReplyVO.content}
								<li><span>${ivo.inquiryReplyVO.regdate}</span></li>
								<div class="clearfix"></div>
							</ul>
						</c:when>
						<c:otherwise>
							<c:if test="${isAdmin}">
								<button class="my_popup_open" onclick='selectSendReply("${ivo.iqno}")'>댓글달기</button>
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