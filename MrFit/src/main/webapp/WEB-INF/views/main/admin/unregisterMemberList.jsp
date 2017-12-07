<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	/* $(document).ready(function() {
		$("#restoreStatus").click(function() {
			if(confirm("회원을 다시 활성화 시키시겠습니까?")){
				location.href="${pageContext.request.contextPath}/restoreMemberStatus?id="+${member.id};
			}else{
				return false;
			}
		});//click
	});// ready */
	
	function restoreStatus(){
		return confirm("회원을 다시 활성화 시키시겠습니까?");
	}
</script>

<%-- 탈퇴 회원 목록 --%>
<div class="ckeckout">
	<div class="container">
		<div class="ckeckout-top">
			<div class=" cart-items heading">
			<h3><a href="${pageContext.request.contextPath}/commonMemberList.do?status=1" style="text-decoration: none;"><font color="#8c2830">리스트로 돌아가기</font></a><br><br></h3>
			
			<table class="table-board">
					<thead>
					<tr class="success">
						<th class="title">id</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>주소</th>
						<th>email</th>
						<th>point</th>
						<th>누적구매금액</th>
						<th>등급</th>
						<th>비고</th>
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
							<form action="${pageContext.request.contextPath}/restoreMemberStatus.do" onclick="return restoreStatus()">
								<input type="hidden" name="id" value="${member.id}">
								<button type = "submit" class = "btn btn-default"><font color="#8c2830">되돌리기</font></button>
							</form>
							</td>
						</tr>	
						</c:forEach>	
					</tbody>					
				</table>
			</div>
		</div>
	</div>
</div>
<%-- 페이징 처리 --%>
<div class="container" align="center">
  		<ul class="pager">
  		<c:set value="${lvo.pagingBean}" var="pb" />
   			<c:if test="${pb.previousPageGroup==true}">
   			<li><a href="commonMemberList.do?status=0&listPage=${pb.startPageOfPageGroup-1}">Previous</a></li>
   			</c:if>
   			<c:forEach begin="${pb.startPageOfPageGroup}" 
   			end="${pb.endPageOfPageGroup}" var="pageNum">
   			<c:choose>
   				<c:when test="${pageNum==pb.nowPage}">
				<li><a>${pageNum}</a></li>
				</c:when>
				<c:otherwise>
				<li><a href="commonMemberList.do?status=0&listPage=${pageNum}">${pageNum}</a>&nbsp;&nbsp;</li>
				</c:otherwise>
   			</c:choose>
   			</c:forEach>
   			<c:if test="${pb.nextPageGroup==true}">
    		<li><a href="commonMemberList.do?status=0&listPage=${pb.endPageOfPageGroup+1}">Next</a></li>
    		</c:if>
 		 </ul>
	</div>

















