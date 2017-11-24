<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	$(document).ready(function(){
							$("#topsize").hide();
							$("#bottomsize").hide();
							$("#colorlist").hide();
			var category="";
		$("#category").on("change",function() {
							$("#sizecheck input:checkbox").prop("checked", false);
							$("#topsize tbody tr").detach();
							$("#bottomsize tbody tr").detach();
							$("#colorlist tbody tr").detach();
				category=$(this).val();
			if(category=="하의"){
					$("#topsize").hide();
					$("#bottomsize").show();
					$("#colorlist").show();
			}else{
					$("#topsize").show();
					$("#bottomsize").hide();
					$("#colorlist").show();
			}
		}); // on change
			var cbname="";
			var cbstat="";
			var cbleng="";
			var addcol="";
			var delcol="";
			var colid="";
			var invid="";
			var hidleng="";
		 $("#sizecheck input:checkbox").on("click",function() {
			 	cbname = $(this).val();
		     	cbstat = $(this).is(":checked"); // 체크박스 전체 갯수
		     	cbleng= $("input:checked").length;
		     	addcol="addC"+cbname;
		     	delcol="delC"+cbname;
		     	colid="col"+cbname;
		     	invid="inv"+cbname;
		     	hidleng="hid"+cbname;
		      // 만일 체크되면 누적테이블 + 언체크되면 테이블 - 하기
		      if (cbstat==true){ // check될떄 true
		    	  if(category!="하의"){
					      $("#topsize tbody").append(
									'<tr id="'+cbname+'">'
									+'<td><input type="text" name="size_name" value="'+cbname+'" readonly="readonly"></td>'
									+'<td><input type="number" name="size1" size="10" maxlength="3" oninput="maxLengthCheck(this)"></td>'
									+'<td><input type="number" name="size2" size="10" maxlength="3" oninput="maxLengthCheck(this)"></td>'
									+'<td><input type="number" name="size3" size="10" maxlength="3" oninput="maxLengthCheck(this)"></td>'
									+'<td><input type="number" name="size4" size="10" maxlength="3" oninput="maxLengthCheck(this)"></td>'
									+'<td><input type="number" name="size5" size="10" maxlength="3" oninput="maxLengthCheck(this)"></td>'
								+'</tr>'	  
					      );
		    	  }else{
			    		  $("#bottomsize tbody").append(
									'<tr id="'+cbname+'">'
									+'<td><input type="text" name="size_name" value="'+cbname+'" readonly="readonly"></td>'
									+'<td><input type="number" name="size1" size="10" maxlength="3" oninput="maxLengthCheck(this)"></td>'
									+'<td><input type="number" name="size2" size="10" maxlength="3" oninput="maxLengthCheck(this)"></td>'
									+'<td><input type="number" name="size3" size="10" maxlength="3" oninput="maxLengthCheck(this)"></td>'
									+'<td><input type="number" name="size4" size="10" maxlength="3" oninput="maxLengthCheck(this)"></td>'
									+'<td><input type="number" name="size5" size="10" maxlength="3" oninput="maxLengthCheck(this)"></td>'
								+'</tr>'	  
					      ); 
		    	  } //append else
					    		  $("#colorlist tbody").append(
											'<tr id="'+colid+'">'
											+'<td><input type="text" name="size" value="'+cbname+'" readonly="readonly"></td>'
											+'<td ><input type="text" name="color" size="10" maxlength="10" oninput="maxLengthCheck(this)"></td>'
											+'<td ><input type="button" value="+" id="'+addcol+'"><input type="button" value="-" id="'+delcol+'">'
											+'<input type="hidden" name="colleng" value="" id="'+hidleng+'"></td>'
											+'</tr>'
											+'<tr id="'+invid+'">'
											+'<td><input type="text" name="" value="재고수량" readonly="readonly"></td>'
											+'<td ><input type="text" name="inventory"  size="10" maxlength="10" oninput="maxLengthCheck(this)"></td>'
											+'</tr>'
							      ); 
		      } // cbstat true
		      if(cbstat==false){ // check 될때 false  
		      	$("#"+cbname+"").detach();
		      	$("#"+colid+"").detach();
		      	$("#"+invid+"").detach();
		      } // cbstat false
		      
			  $("#"+addcol+"").on("click",function() {
					  var eql=$(this).parent().parent().children().length;
	/* 				 alert(eql);
					  alert($(this).parent().parent().children().eq(eql-2).html()); */
					  $("#"+hidleng+"").val(eql-2);
					 //alert($("#"+hidleng+"").val());
					  if( eql < 12){
						$(this).parent().before(
							'<td ><input type="text" name="color" size="10" maxlength="10" oninput="maxLengthCheck(this)"></td>'
						); 
						$(this).parent().parent().next().append(
							'<td ><input type="text" name="inventory" size="10" maxlength="10" oninput="maxLengthCheck(this)"></td>'	
						);
					  }else{
						  alert("최대 색상 수는 10개 입니다");
					  }
			  }); // on click addcolor
			  $("#"+delcol+"").on("click",function() {
					  var eql=$(this).parent().parent().children().length;
					  $("#"+hidleng+"").val(eql-2);
					  if(eql > 3){
						$(this).parent().parent().children().eq(eql-2).remove();	
						$(this).parent().parent().next().children().last().remove();
					  }else{
						  alert("색상을 입력해주세요");
					  }
			  }); // on click delcolor
			  
		  }); // on click sizecheck
	});//ready
	
		//maxlength 체크
	  function maxLengthCheck(object){
		   if (object.value.length > object.maxLength){
		    object.value = object.value.slice(0, object.maxLength);
		   }    
	  } // length check
	  
	function getFileList() {
		var imageFile = document.getElementById("imageFile file");
		var file = imageFile.file;
		length = file.length;
		if (length > 0) {
			for (var i = 0; i < length; i++) {
				if ('.jpg' in file[i]) {
					
				} else {
					return false;
				}
			}
		} 
	}// file type recheck
</script>
		
					<!-- Product -->
<!--start-account-->
	<div class="account">
		<div class="container"> 
			<div class="account-bottom">
				<div class="col-md-6 account-left">
				<form method="post" action="${pageContext.request.contextPath}/admin/registerProduct.do" id="regForm" enctype="multipart/form-data" >
					<sec:csrfInput/><%-- csrf 토큰 --%>
					<div class="account-top heading">
						<h3>REGISTER PRODUCT</h3>
					</div>
					<div class="address">
						<span>상품명</span>
						<input type="text" name="name" id="">
					</div>
					<div class="address">
						<span>상품내용</span>
						<textarea class="form-control" id="comments" name="content" placeholder="Contents" rows="5" required="required" style="resize: none;"></textarea>
					</div>
					<div class="address">
						<span>가격</span>
						<input type="text" name="price" size="10">
					</div>		
					<!-- image upload -->
					<div class="address">
						<div id="imagefile">
						대표이미지
						<input type="file" name="file[0]" accept="image/jpeg, image/jpg"><br> 
						<input type="file" name="file[1]" accept="image/jpeg, image/jpg"><br> 
						<input type="file" name="file[2]" accept="image/jpeg, image/jpg"><br> 
						<input type="file" name="file[3]" accept="image/jpeg, image/jpg"><br> 
						<input type="file" name="file[4]" accept="image/jpeg, image/jpg"><br> 
						</div>
					</div>
					<div class="address">
						<span>Category</span> <select id="category" name="category" required="required">
							<option>-[필수] 카테고리를 선택해주세요-</option>
							<option value="top">상의</option>
							<option value="bottom">하의</option>
							<option value="outer">아우터</option>
						</select>
					</div>
					<!-- product_size -->
					<div class="address">
						<div id="sizecheck">
							<input type="checkbox" name="size_name" value="S">Small<br>
	  						<input type="checkbox" name="size_name" value="M" >Medium<br>
							<input type="checkbox" name="size_name" value="L" >Large<br>
						</div>
					</div>	
					<!--detail size and inventory -->
						<table id="topsize">
							<thead>
								<tr><th>Size</th><th>어깨</th><th>가슴</th><th>소매</th><th>암홀</th><th>상의총기장</th></tr>
							</thead>
							<tbody>

							</tbody>
						</table>
						<table id="bottomsize">
							<thead>
								<tr><th>Size</th><th>허리</th><th>밑위</th><th>허벅지</th><th>밑단</th><th>하의총기장</th></tr>
							</thead>
							<tbody>

							</tbody>
						</table>
							<!-- product_color -->		
						<table id="colorlist">
							<thead>
								<tr><th>Size</th><th>색상</th></tr>
							</thead>
							<tbody>
								
							</tbody>
						</table><br>
					<div class="address new">
						<input type="submit" value="등록" onsubmit="return getFileList()">
					</div>
				</form>	
				</div>
				<div class="col-md-6 account-left">
					
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--end-account-->