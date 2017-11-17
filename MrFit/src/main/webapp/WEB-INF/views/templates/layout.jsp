<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
	<head>
	<!-- title이 null인 경우는 무시된다 -->
	<title><tiles:insertAttribute name="title" ignore="true" /></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.0.min.js"></script>
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
	
	<!--fonts-->
	<link href='http://fonts.googleapis.com/css?family=Alegreya+Sans+SC:100,300,400,500,700,800,900,100italic,300italic,400italic,500italic,700italic,800italic,900italic' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
	
	<script type="application/x-javascript">
	addEventListener("load", function(){
		setTimeout(hideURLbar, 0); 
		}, false); 
	 function hideURLbar(){ 
		 window.scrollTo(0,1); 
	} 
	</script>
	
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/move-top.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/easing.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
		<!-- start menu -->
		<script src="${pageContext.request.contextPath}/resources/js/simpleCart.min.js"></script>
		<link href="${pageContext.request.contextPath}/resources/css/memenu.css" rel="stylesheet" type="text/css" media="all" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/memenu.js"></script>
	<script>
		$(document).ready(function() {
			$(".memenu").memenu();
		});
	</script>
	</head>
	<body>
	
		<div id="container">
			<div id="header">
				<tiles:insertAttribute name="header" />
			</div>
			<div id="main">
				<tiles:insertAttribute name="main" />
			</div>
			<div id="right">
				<tiles:insertAttribute name="right" />
			</div>
			<div id="footer">
				<tiles:insertAttribute name="footer" />
			</div>
		</div>
		
		
	</body>
</html>