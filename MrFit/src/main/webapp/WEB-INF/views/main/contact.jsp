<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--start-contact-->
	<div class="contact">
		<div class="container">
			<div class="contact-top heading"> 
				<h3>CONTACT US</h3>
			</div>
			<div class="contact-bottom"> 
				<div class="col-md-6 contact-left"> 
				<form>
					<input type="text" placeholder="Name" required>
					<input type="text" placeholder="E-mail" required>
					<input type="text" placeholder="Phone" required>
				</form>
				</div>
				<div class="col-md-6 contact-left">
				<form>
					<textarea placeholder="Message"></textarea>
					<input type="submit" value="SEND">
				</form>	
				</div>
				<div class="clearfix"> </div>
			</div>
			<h2 style="margin-top: 4em; font-weight: bold;">LOCATION</h2>
			<div id="map" style="width: 100%; height: 500px; margin-top: 2em;"></div>
		</div>
	</div>
	<!--end-contact-->
	<!--start-map-->

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5f1a88880da3f10b3af7bd82dd9cdf6a"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(37.4021577, 127.1043413),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
	</script>
	<!--end-map-->