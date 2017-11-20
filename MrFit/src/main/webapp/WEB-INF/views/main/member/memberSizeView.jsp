<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#msupdateform :input").attr("disabled", true);
		
		$("#msupdateform").on("click","button[name='msupdatebtn1']",function() {
			$("#msupdateform :input").attr("disabled", false);
			$("#msupdate").html('<button name="msupdatebtn2" type="button">수정완료</button>');
		});
		
		$("#msupdateform").on("click","button[name='msupdatebtn2']",function() {
			var params = jQuery("#msupdateform").serialize();
 		$.ajax({
 			type:"post",
			url:"${pageContext.request.contextPath}/updateMemberSize.do",
			data:params,
			dataType:"json",
			success:function(data){
				$("#msupdateform :input").attr("disabled", true);
				$("#msupdate").html
				('<button name="msupdatebtn1" type="button">수정</button>');
			}
		}); 
		});
	});		
</script>
<!--start-account-->
	<div class="account">
		<div class="container"> 
			<div class="account-bottom">
				<div class="col-md-6 account-left">
					<div style="width: 500px; height: 250px; background-color: gray;"></div>
				</div>
				<div class="col-md-6 account-left">
					<form method="post" id="msupdateform">
					<input type="hidden" name="id" value="<sec:authentication property="principal.id"/>">
					<div class="account-top heading">
						<h3>Member Size</h3>
					</div>
					<div class="address">
						<span>Name</span>
						<sec:authentication property="principal.name"/> 님의 치수정보.
					</div>
					<div class="address">
						<span>어깨</span> 
						<input type="number" name="shoulder" size="10" value="<sec:authentication property="principal.memberSizeVO.shoulder"/>">
					</div>
					<div class="address">
						<span>가슴</span> 
						<input type="number" name="chest" size="10" value="<sec:authentication property="principal.memberSizeVO.chest"/>">
					</div>
					<div class="address">
						<span>소매</span> 
						<input type="number" name="sleeve" size="10" value="<sec:authentication property="principal.memberSizeVO.sleeve"/>">
					</div>
					<div class="address">
						<span>암홀</span> 
						<input type="number" name="armhole" size="10" value="<sec:authentication property="principal.memberSizeVO.armhole"/>">
					</div>
					<div class="address">
						<span>상의 총 기장</span> 
						<input type="number" name="toplength" size="10" value="<sec:authentication property="principal.memberSizeVO.toplength"/>">
					</div>
					<div class="address">
						<span>허리</span> 
						<input type="number" name="waist" size="10" value="<sec:authentication property="principal.memberSizeVO.waist"/>">
					</div>
					<div class="address">
						<span>밑위</span> 
						<input type="number" name="crotch" size="10" value="<sec:authentication property="principal.memberSizeVO.crotch"/>">
					</div>
					<div class="address">
						<span>허벅지</span> 
						<input type="number" name="thigh" size="10" value="<sec:authentication property="principal.memberSizeVO.thigh"/>">
					</div>
					<div class="address">
						<span>밑단</span> 
						<input type="number" name="hem" size="10" value="<sec:authentication property="principal.memberSizeVO.hem"/>">
					</div>
					<div class="address">
						<span>하의 총 기장</span> 
						<input type="number" name="bottomlength" size="10" value="<sec:authentication property="principal.memberSizeVO.bottomlength"/>">
					</div>
					<div class="address" >
						<div id="msupdate">
							<button name="msupdatebtn1" type="button">수정</button>
						</div>
					</div>
					</form>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--end-account-->