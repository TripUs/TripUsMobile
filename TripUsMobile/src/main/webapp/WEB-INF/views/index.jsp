<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="resources/css/jquery.mobile-1.4.5.min.css"/>
        <link rel="stylesheet" href="resources/css/jquery.mobile.theme-1.4.5.min.css"/>
        <link rel="stylesheet" href="resources/css/swiper.min.css">
        <script src="http://code.jquery.com/jquery-1.12.4.min.js"
                  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
                  crossorigin="anonymous"></script>
        <script src="resources/js/jquery.mobile-1.4.5.min.js"></script>
        <script src="resources/js/swiper.min.js"></script>
	    <title>Document</title>
        
        <style type="text/css">
        	.slide-img {
        		width: 200px;
        		height: 150px;
        	}
        	.detail-area-img {
        		width: 100%;
        	}
        </style>
        
        <script type="application/javascript">
        	document.addEventListener("deviceready", onDeviceReady, false);
	        function onDeviceReady() {
	            var geoSeccess = function(position) {
	                $('p').html('위도 :' + position.coords.latitude + '<br/>경도 : ' + position.coords.longitude);
	                alert(position.coords.latitude + ',' + position.coords.longitude);
	            };
	
	            var geoErr = function(e) {
	                alert(e.message);
	            }
	
	            if (navigator.geolocation) {
	                // 위치정보 갱신 성공
	                navigator.geolocation.getCurrentPosition(geoSeccess, geoErr);
	            } else {
	                // 위치정보 갱신 실패
	            }
	        }
        </script>
    </head>
	<body>
		<h1>TripUs Mobile</h1>
		<a href="main">go to TripUs</a>
		<p></p>
	</body>
</html>