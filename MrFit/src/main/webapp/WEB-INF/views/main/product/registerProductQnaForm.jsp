<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
/*  $(document).ready(function(){ */
/* 	 $("#registerPQ").click(function() {
		if(confirm("상품문의 글을 등록하시겠습니까?")){
		 alert("글이 등록 되었습니다"); */
/* 		location.href="${pageContext.request.contextPath}/registerProductQna.do?pno="+$("#findPno").val()+
					  "&security="+$("#findSecurity").val()+"&content="+$("#content").val(); */
	/* 	$("#productQnaForm").submit();
	 }
	}); */
// });//ready
</script>
<form id="productQnaForm" method="POST" action="${pageContext.request.contextPath}/productRegisterQna.do">
<sec:csrfInput/>
<div class="container">
    <div>
  	<h3>문의글 작성</h3>
  	<div align="left">
  	 <select id="findSecurity" name="security">
  		<option value="public">공개</option>
  		<option value="private">비공개</option>
	 </select>
	</div>
  	</div>
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input id="content" type="text" class="form-control" name="content" placeholder="문의내용">
    </div>
    <br>
    <div align="right">
	<input id="findPno" type="hidden" name="pno" value="${requestScope.pno}">
    <input type="submit" value="글작성">
    <!-- 	<button id="registerPQ" type="button" class="btn btn-info">글 작성</button> -->
    	<button type="button" class="btn btn-info">취소</button>
    </div>
</div>
</form>



















