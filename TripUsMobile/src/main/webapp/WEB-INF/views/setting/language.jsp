<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="resources/css/jquery.mobile-1.4.5.min.css"/>
        <link rel="stylesheet" href="resources/css/jquery.mobile.theme-1.4.5.min.css"/>
        <link rel="stylesheet" href="resources/css/themec.min.css"/>
        <link rel="stylesheet" href="resources/css/slick.css"/>
		<link rel="stylesheet" href="resources/css/slick-theme.css"/>
        <link rel="stylesheet" href="resources/css/tripus.css">
        <script src="http://code.jquery.com/jquery-1.12.4.min.js"
                  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
                  crossorigin="anonymous"></script>
        <script type="text/javascript" src="resources/js/jquery-migrate-1.4.1.min.js"></script>
        <script type="text/javascript" src="resources/js/jquery.mobile-1.4.5.min.js"></script>
        <script type="text/javascript" src="resources/js/jquery.form.min.js"></script>
        <script type="text/javascript" src="resources/js/slick.min.js"></script>
        <script src="http://itemslide.github.io/dist/itemslide.min.js"></script>
        <script type="text/javascript" src="resources/js/tripus.js"></script>
	    <script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=27fe7a62295f8cc3e56a54958afc32e5&libraries=services"></script>
        <script type="text/javascript" charset="utf-8" src="resources/js/cordova.js"></script>
        <script type="text/javascript" charset="utf-8" src="resources/js/cordova_plugins.js"></script>
        <script type="text/javascript" charset="utf-8" src="resources/js/geolocation.js"></script>
        <title>Document</title>
    </head>
	<body>
		<div data-role="page" style="background-color: white;">
		
		    <!-- 영어 -->
        	<c:if test="${sessionScope.userInfo.lang eq 1 }">
        		<c:set value="TripUs Setting" var="langSetting"></c:set>
        		<c:set value="Korean" var="korean"></c:set>
        		<c:set value="English" var="english"></c:set>
        		<c:set value="Confirm" var="confirm"></c:set>
        		<c:set value="Please choose your preferred language." var="chooseLanguage"></c:set>
        	</c:if>
			<!-- 한국어 -->
        	<c:if test="${sessionScope.userInfo.lang ne 1 }">
        		<c:set value="TripUs 설정" var="langSetting"></c:set>
        		<c:set value="한국어" var="korean"></c:set>
        		<c:set value="영 &nbsp 어" var="english"></c:set>
        		<c:set value="확인" var="confirm"></c:set>
        		<c:set value="사용하실 언어를 선택하세요." var="chooseLanguage"></c:set>
        	</c:if>
        	
			<div data-role='header' data-position='fixed' style="background-color: #F05562; color: white;">
				<a href="#" data-rel="back" class="ui-btn ui-shadow ui-icon-mybackicon ui-btn-icon-left ui-btn-icon-notext ui-corner-all">Back</a>
                <h1 style="color: white;">${langSetting }</h1>
			</div>
			<div data-role="ui-content" style="padding-left: 10px; padding-right: 10px;">
				
	
				<div class="ui-content">
					<form method="post">
						<fieldset data-role="controlgroup">
							<legend>${chooseLanguage } </legend>
							<c:if test="${lang eq 0 }">
								<label for="korean">${korean }</label>
								<input onclick="chklang()" type="radio" name="language" id="korean" value="0" checked>
								<label for="english">${english }</label>
								<input onclick="chklang()" type="radio" name="language" id="english" value="1">
							</c:if>
			
							<c:if test="${lang eq 1 }">
								<label for="korean">${korean }</label>
								<input onclick="chklang()" type="radio" name="language" id="korean" value="0">
								<label for="english">${english }</label>
								<input onclick="chklang()" type="radio" name="language" id="english" value="1" checked>
			            	</c:if>
						</fieldset>
						<button id="langok" style="background-color: #F05562; color: white;">${confirm }</button>
		           	</form>
				</div>
	
				<script type="text/javascript">
					var lang = ${sessionScope.userInfo.lang};
					
					if(lang == 0){
						if($(":input:radio[value='0']").is(":checked")){
							$('#langok').attr('disabled', true);
						}else{
							$('#langok').attr('disabled', false);
						}
					}
					if(lang == 1){
						if($(":input:radio[value='1']").is(":checked")){
							$('#langok').attr('disabled', true);
						}else{
							$('#langok').attr('disabled', false);
						}
					}
					
					function chklang() {
						if(lang == 0){
							if($(":input:radio[value='0']").is(":checked")){
								$('#langok').attr('disabled', true);
							}else{
								$('#langok').attr('disabled', false);
							}
						}
						if(lang == 1){
							if($(":input:radio[value='1']").is(":checked")){
								$('#langok').attr('disabled', true);
							}else{
								$('#langok').attr('disabled', false);
							}
						}
					}
				</script>
	
			</div>
			<div data-role="footer" data-position='fixed' data-theme="c">
				<div data-role='navbar'>
					<ul>
						<li><a data-icon='home' href="../tripus/">Home</a></li>
						<li><a data-icon='calendar' href="mytrip">내 여행</a></li>
						<li><a data-icon='edit' href="tripnote">여행노트</a></li>
						<li><a data-icon='gear' class="ui-btn-active ui-state-persist"
							href="setting">설정</a></li>
					</ul>
				</div>
			</div>
		</div>
	</body>
</html>