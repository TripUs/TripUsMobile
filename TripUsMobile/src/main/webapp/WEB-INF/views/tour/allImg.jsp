<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../resources/css/jquery.mobile-1.4.5.min.css"/>
        <link rel="stylesheet" href="../resources/css/jquery.mobile.theme-1.4.5.min.css"/>
        <link rel="stylesheet" href="../resources/css/themec.min.css"/>
        <link rel="stylesheet" href="../resources/css/slick.css"/>
		<link rel="stylesheet" href="../resources/css/slick-theme.css"/>
        <link rel="stylesheet" href="../resources/css/tripus.css">
        <script src="http://code.jquery.com/jquery-1.12.4.min.js"
                  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
                  crossorigin="anonymous"></script>
        <script type="text/javascript" src="../resources/js/jquery-migrate-1.4.1.min.js"></script>
        <script type="text/javascript" src="../resources/js/jquery.mobile-1.4.5.min.js"></script>
        <script type="text/javascript" src="../resources/js/jquery.form.min.js"></script>
        <script type="text/javascript" src="../resources/js/slick.min.js"></script>
        <script src="http://itemslide.github.io/dist/itemslide.min.js"></script>
        <script type="text/javascript" src="../resources/js/tripus.js"></script>
	    <script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=27fe7a62295f8cc3e56a54958afc32e5&libraries=services"></script>
        <script type="text/javascript" charset="utf-8" src="../resources/js/cordova.js"></script>
        <script type="text/javascript" charset="utf-8" src="../resources/js/cordova_plugins.js"></script>
        <script type="text/javascript" charset="utf-8" src="../resources/js/geolocation.js"></script>
    </head>
    <body>
        <div data-role='page'>
            <div data-role='header' data-position='fixed' style="background-color: #F05562; color: white;">
                <a href="#" data-rel="back" class="ui-btn ui-shadow ui-icon-mybackicon ui-btn-icon-left ui-btn-icon-notext ui-corner-all">Back</a>
                <h1>회원 업로드 이미지</h1>
            </div>
            <div data-role='content' style="background-color: white;">
				<div style="width: 100%; padding: 0px 5px;">
					<c:forEach items="${imgList }" var="imgname">
						<div style="display: inline-block; box-sizing: border-box; width: 49%;">
							<img src="${imgname }" style="width: 100%; height: 95px;"/>
						</div>
					</c:forEach>
				</div>        
			</div>            
        </div><!-- end page -->
    </body>
</html>