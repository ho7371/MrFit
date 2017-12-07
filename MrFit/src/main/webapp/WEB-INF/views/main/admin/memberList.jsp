<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://cdn.rawgit.com/vast-engineering/jquery-popup-overlay/1.7.13/jquery.popupoverlay.js"></script>
<script>
    $(document).ready(function() {

      // Initialize the plugin
     /*  $('#my_popup').popup({
    	  opacity: 0.3,
    	  transition: 'all 0.3s'
      }); */
      
      $(".my_popup_close").click(function() {
      	if($("#message").val() != ""){
      		$("#message").val("");
      	}
      })
		
     
    });
	function selectSend(memberId){
		 $('#my_popup').popup({
	    	  opacity: 0.3,
	    	  transition: 'all 0.3s'
	      });
		 $('#my_popup #hiddenMemberId').val(memberId);
		 alert("전송될 회원 아이디 : "+memberId);
	}
</script>
<c:set value="${lvo.pagingBean}" var="pb" />




<div class="ckeckout">
	<div class="container">
		<div class="ckeckout-top">
			<div class=" cart-items heading">
				<h3 style="margin-bottom: 10px;">회원목록</h3>
				<div>
					<div>
						<a href="${pageContext.request.contextPath}/commonMemberList.do?status=0">
							<button style="float:left;">탈퇴회원 보기</button>
						</a>
					</div>
					<div style="float: right;">
						<form action="${pageContext.request.contextPath}/adminSearchMember.do">
							<input type="text" name="id" id="id" class="searchInput" style="font-family: monospace;" placeholder="  회원검색">
							<input type="submit" value="아이디 검색">
						</form>
					</div>
				</div>
				
				<table class="table-board" style="margin-top: 5em!important;">
						<thead>
						<tr>
							<th class="title">id</th>
							<th>이름</th>
							<th>전화번호</th>
							<th>주소</th>
							<th>email</th>
							<th>point</th>
							<th>누적구매액</th>
							<th>등급</th>
							<th>강제탈퇴</th>
							<th>포인트지급</th>
							<th>쪽지</th>
							</tr>
						</thead>
						<tbody>		
						 <c:forEach var="member" items="${lvo.list}">	
							<tr>
							    <td>${member.id}</td>				
								<td>${member.name}</td>
								<td>${member.phone}</td>
								<td>${member.address}</td>
								<td>${member.email}</td>
								<td>${member.point} </td>
								<td>${member.totalSpent}</td>
								<td>${member.gradeVO.grade}</td>
								<td>
									<%-- <a href="${pageContext.request.contextPath}/adminUnregisterMember.do?id=${member.id}" type="button" type="button" class="btn btn-default">삭제</a> --%>
									<form action="${pageContext.request.contextPath}/adminUnregisterMember.do">
										<input type="hidden" name="id" value="${member.id}">
										<button class="btn btn-default">삭제</button>
									</form>
								</td>
								<td>
									<form action="${pageContext.request.contextPath}/adminGivePointToMemberForm.do" method="post">
										<sec:csrfInput/><%-- csrf 토큰 --%>   
										<input type="hidden" name="id" value="${member.id}">
										<button class="btn btn-default">지급</button>
									</form>
								</td>
								<td>
									<%-- <input type = "hidden" id = "memberId" value = "${member.id}"> --%>
									<button class="my_popup_open btn btn-default" onclick='selectSend("${member.id}")'>작성</button>
								</td>
							</tr>	
						 </c:forEach>	
						</tbody>					
					</table> 
					<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
				<script type="text/javascript">
					$(document).ready(function(){
						 $("#messageBtn").click(function() {
					    	  if(confirm("메세지를 보내시겠습니까?")){
						    	  location.href="sendMessage.do?message="+$("#message").val()+"&id="+$("#hiddenMemberId").val();
					    	  }else{
					    		  return false;
					    	  }
					      	
					      }); // click
					}); //ready
				</script>
				<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
					<%-- 쪽지 창  --%>
					<div id="my_popup" style="display: none;">
						<h4 align="center">쪽지</h4>
						<textarea rows="10" cols="30" id = "message" name = "message"></textarea><br>
						<div align="center">
						<input type="hidden" id="hiddenMemberId" value="">
						<button id = "messageBtn">전송</button>
					    <button class="my_popup_close" type ="button">Close</button>
						</div>
					</div>
					
				<%-- 페이징 처리 --%>
				<div class="container" align="center">
				  		<ul class="pager">
				   			<c:if test="${pb.previousPageGroup==true}">
				   			<li><a href="commonMemberList.do?status=1&pageNo=${pb.startPageOfPageGroup-1}">Previous</a></li>
				   			</c:if>
				   			<c:forEach begin="${pb.startPageOfPageGroup}" 
				   			end="${pb.endPageOfPageGroup}" var="pageNum">
				   			<c:choose>
				   				<c:when test="${pageNum==pb.nowPage}">
								<li><a>${pageNum}</a></li>
								</c:when>
								<c:otherwise>
								<li><a href="commonMemberList.do?status=1&pageNo=${pageNum}">${pageNum}</a>&nbsp;&nbsp;</li>
								</c:otherwise>
				   			</c:choose>
				   			</c:forEach>
				   			<c:if test="${pb.nextPageGroup==true}">
				    		<li><a href="commonMemberList.do?status=1&pageNo=${pb.endPageOfPageGroup+1}">Next</a></li>
				    		</c:if>
				 		 </ul>
					</div>
			</div>
		</div>
	</div>
</div>

















