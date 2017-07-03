<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Include meta tag to ensure proper rendering and touch zooming -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Include jQuery Mobile stylesheets -->
<link rel="stylesheet"
	href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<!-- Include the jQuery library -->
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet"
	href="resources/css/jquery.mobile.theme-1.4.5.min.css" />
<link rel="stylesheet" href="resources/css/swiper.min.css">
<link rel="stylesheet" href="resources/css/slick.css" />
<link rel="stylesheet" href="resources/css/slick-theme.css" />
<link rel="stylesheet" href="resources/css/tripus.css">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="resources/js/jquery-migrate-1.4.1.min.js"></script>
<!-- Include the jQuery Mobile library -->
<script
	src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.form.min.js"></script>
<script type="text/javascript" src="resources/js/slick.min.js"></script>
<script type="text/javascript" src="resources/js/tripus.js"></script>
<title>Document</title>
</head>
<body>
	<div data-role="page" style="background-color: white;">
		<div data-role='header' data-position='fixed'
			style="background-color: #F05562; color: white;">
			<h1 style="color: white;">TripUs Setting</h1>
		</div>
		<div data-role="ui-content" style="padding-left: 10px; padding-right: 10px;">
			

			<div class="ui-content">
				<fieldset data-role="controlgroup">
					<legend>Please choose your preferred language </legend>
					<form method="post">
						<c:if test="${lang eq 0 }">
							<label for="korean">Korean</label>
							<input onclick="chklang()" type="radio" name="language" id="korean" value="0" checked>
							<label for="english">English</label>
							<input onclick="chklang()" type="radio" name="language" id="english" value="1">
						</c:if>
		
						<c:if test="${lang eq 1 }">
							<label for="korean">Korean</label>
							<input onclick="chklang()" type="radio" name="language" id="korean" value="0">
							<label for="english">English</label>
							<input onclick="chklang()" type="radio" name="language" id="english" value="1" checked>
		            	</c:if>
		            	
						<button id="langok">확인</button>
	            	</form>
				</fieldset>
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
		<div data-role="footer" data-position='fixed'>
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