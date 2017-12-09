<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
   $(document).ready(function() {
      $("#updateSize").click(function() {
         return confirm("수정 하시겠습니까?");
      });//click
      $("#backPage").click(function() {
         location.href="${pageContext.request.contextPath}/findMemberSizeById.do?id=<sec:authentication property="principal.id"/>";
      });//click
   });//ready
</script>
<style type="text/css">
   th{
      background: #aef9e9;
   }
   th, td{
      text-align: center;
   }
</style>
<!--start-account-->
<div class="account">
   <div class="container"> 
      <div class="account-bottom">
      <div class="col-md-1 account-left"></div>
         <div class="col-md-9 account-left">
            <%-- 치수 정보 수정 폼 --%>
            <form action="${pageContext.request.contextPath}/updateMemberSize.do" method="post">
               <sec:csrfInput/><%-- csrf 토큰 --%>
               <input type="hidden" name="id" value="<sec:authentication property="principal.id"/>">
               <div class="account-top heading">
                  <h3>Member Size</h3>
               </div>
               <div align="center">
               <div align="right" class="address">* 그림 참고</div>
               <table class="table table-bordered">
                  <thead>
                     <tr>
                        <th style="text-align: center;">아우터</th>
                        <th style="text-align: center;">상의</th>
                        <th style="text-align: center;">하의</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td><img alt="아우터 사이즈표" src="${pageContext.request.contextPath}/resources/images/size_outer.jpg"></td>
                        <td><img alt="상의 사이즈표" src="${pageContext.request.contextPath}/resources/images/size_top.jpg"></td>
                        <td><img alt="하의 사이즈표" src="${pageContext.request.contextPath}/resources/images/size_bottom.jpg"></td>
                     </tr>
                  </tbody>
               </table>
               </div>
               <div class="address">
                  <strong><sec:authentication property="principal.name"/></strong> 님의 치수정보.
               </div>
               <%-- 상의 치수 --%>
               <table class="table table-bordered">
                  <thead>
                     <tr><th colspan = "5" style="text-align: center;">상의</th></tr>
                     <tr><td>어깨</td><td>가슴</td><td>소매</td><td>암홀</td><td>상의총기장</td></tr>
                  </thead>
                  <tbody>
                     <tr>
                     <td><input type="number" name="shoulder" size="10" value="<sec:authentication property="principal.msvo.shoulder"/>" maxlength="3" ></td>
                     <td><input type="number" name="chest" size="10" value="<sec:authentication property="principal.msvo.chest"/>" maxlength="3"></td>
                     <td><input type="number" name="sleeve" size="10" value="<sec:authentication property="principal.msvo.sleeve"/>" maxlength="3"></td>
                     <td><input type="number" name="armhole" size="10" value="<sec:authentication property="principal.msvo.armhole"/>" maxlength="3"></td>
                     <td><input type="number" name="toplength" size="10" value="<sec:authentication property="principal.msvo.toplength"/>" maxlength="3"></td>
                  </tr>
                  </tbody>
               </table>
               <br>
               <%-- 하의 치수 --%>
               <table class="table table-bordered">
                  <thead>
                     <tr><th colspan = "5" style="text-align: center;">하의</th></tr>
                     <tr><td>허리</td><td>밑위</td><td>허벅지</td><td>밑단</td><td>하의총기장</td></tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td><input type="number" name="waist" size="10" value="<sec:authentication property="principal.msvo.waist"/>" maxlength="3"></td>
                        <td><input type="number" name="crotch" size="10" value="<sec:authentication property="principal.msvo.crotch"/>"  maxlength="3"></td>
                        <td><input type="number" name="thigh" size="10" value="<sec:authentication property="principal.msvo.thigh"/>" maxlength="3"></td>
                        <td><input type="number" name="hem" size="10" value="<sec:authentication property="principal.msvo.hem"/>" maxlength="3"></td>
                        <td><input type="number" name="bottomlength" size="10" value="<sec:authentication property="principal.msvo.bottomlength"/>" maxlength="3"></td>
                     </tr>
                  </tbody>
               </table>
               <div align="center"><input type="submit" id = "updateSize" value="수정완료"><button type = "button" id = "backPage" style="color: white;">뒤로</button></div>
            </form>
         </div>
         <div class="col-md-2 account-left"></div>
         <div class="clearfix"> </div>
      </div>
   </div>
</div>
<!--end-account-->