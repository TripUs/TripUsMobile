<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div data-role='page' style="background-color: white;">
        
            <!-- 영어 -->
        	<c:if test="${sessionScope.userInfo.lang eq 1 }">
        		<c:set value="My Page" var="account"></c:set>
        		<c:set value="Set up my profile" var="profile"></c:set>
        		<c:set value="Change profile photo" var="pfphoto"></c:set>
        		<c:set value="Cancel change of profile photo" var="cancelphoto"></c:set>
        		<c:set value="Change profile photo" var="changephoto"></c:set>
        		<c:set value="My Info" var="myinfo"></c:set>
        		<c:set value="Change profile image" var="changeimg"></c:set>
        		<c:set value="ID" var="id"></c:set>
        		<c:set value="Name" var="name"></c:set>
        		<c:set value="Nickname" var="nickname"></c:set>
        		<c:set value="E-Mail" var="email"></c:set>
        		<c:set value="Edit My information" var="editinformation"></c:set>
        	</c:if>
        	<!-- 한국어 -->
        	<c:if test="${sessionScope.userInfo.lang ne 1 }">
        		<c:set value="내 &nbsp; 정보" var="account"></c:set>
        		<c:set value="내 프로필 설정" var="profile"></c:set>
        		<c:set value="프로필 사진 변경" var="pfphoto"></c:set>
        		<c:set value="프로필 사진 변경 취소" var="cancelphoto"></c:set>
        		<c:set value="프로필 변경" var="changephoto"></c:set>
        		<c:set value="내 정보" var="myinfo"></c:set>
        		<c:set value="프로필 이미지 변경" var="changeimg"></c:set>
        		<c:set value="아이디" var="id"></c:set>
        		<c:set value="이 &nbsp 름" var="name"></c:set>
        		<c:set value="별 &nbsp 명" var="nickname"></c:set>
        		<c:set value="이메일" var="email"></c:set>
        		<c:set value="내정보 수정" var="editinformation"></c:set>
        	</c:if>
        	
            <div data-role='header' style="background-color: #F05562; color: white;">
            	<a href="setting" data-rel="back" class="ui-btn ui-shadow ui-icon-mybackicon ui-btn-icon-left ui-btn-icon-notext ui-corner-all">Back</a>
                <h1 style="color: white;">${account }</h1>
            </div>
            <div data-role='content' style="padding-left: 10px; padding-right: 10px;">
            	<div class="ui-corner-all custom-corners" style="margin-top: 10px;">
            		<div class="ui-bar ui-bar-a" style="background-color: #F05562; border: 2px solid #F05562; border-radius: 10px;">
            	   		<h3 style="color: white;">${profile }</h3>
                	</div>
                	<div class="ui-body ui-body-a" style="border: none;">
                		<table style="width: 100%;">
                			<tr>
                				<td id="profile-td" style="width: 25%">
                					<img src="${sessionScope.userInfo.profile }" style="width: 100%;"/>
                				</td>
                				<td style="width: 75%">
                					&nbsp; &nbsp; &nbsp; &nbsp; <strong>${sessionScope.userInfo.name } (${sessionScope.userInfo.nicname })</strong><br/><br/>
                					&nbsp; &nbsp; &nbsp; &nbsp; <strong>${sessionScope.userInfo.email }</strong><br/>
                				</td>
                			</tr>
							<tr>
                				<td colspan="2">
                					<a href="#" data-role="button" id="profile-edit-btn" style="border: 2px solid #F05562; background-color: white; color: #F05562;">${pfphoto }</a>
                				</td>
                			</tr>
                		</table>
                	</div>
               		<div id="profile-table" style="display: none; position: fixed; top: 50%; width: 80%; left: 7%; z-index: 100; background-color: white; border: 2px solid #F05562; border-radius: 20px; padding: 10px;"></div>
                </div>
                 
                 <script type="text/javascript">
                 	$('#profile-edit-btn').click(function() {
                 		var profileflag = $('#profileflag').val();
                 		if(profileflag != 1) {
                 			$('#profile-edit-btn').html('${cancelphoto }');
	                 		$('#profile-table').append('<div data-role="controlgroup" data-type="horizontal"><div class="ui-controltroup-controls">'
	                 					+ '<input type="hidden" value="1" id="profileflag" />'
	                 					+ '<div class="ui-input-text ui-body-inherit ui-corner-all ui-controlgroup-textinput ui-btn ui-first-child ui-shaow-inset" style="background-color: white; border: none;">'				
	                 					+ '<form id="fileForm" method="post" enctype="multipart/form-data" data-ajax="false">'
	                 					+ '<input id="profileimg" name="profile" type="file" data-wrapper-class="controlgroup-textinput ui-btn"/>'
	                 					+ '<button onclick="uploadProfile();" class="ui-btn ui-shadow ui-corner-all ui-last-child" style="background-color: #F05562; color: white;">${changephoto }</button></form></div></div></div>');
	                 		$('#profile-table').show();
                 		} else {
                 			$('#profile-edit-btn').html('${changephoto }');
                 			$('.ui-controltroup-controls').remove();
                 			$('#profile-table').hide();
                 		}
                 	});
                 
                 	function uploadProfile(){
                 		var form = $('#fileForm')[0];
                        var formData = new FormData(form);
                        $.ajax({
                        	url: 'myPage',
                            processData: false,
                            contentType: false,
                            data: formData,
                            type: 'POST',
                            success: function(data){
                            	//$('#profile-td').html('<img src="${sessionScope.userInfo.profile }" style="width: 100%;"/>');
                            }
                    	});
                    };
				</script>

                 
                 <div class="ui-corner-all custom-corners">
                	<div class="ui-bar ui-bar-a" style="background-color: #F05562; border: 2px solid #F05562; border-radius: 10px;">
                		<h3 style="color: white;">${myinfo }</h3>
                	</div>
                	<div class="ui-body ui-body-a" style="border: none;">
                		<table style="width: 100%">
                			<tr>
                				<th>&nbsp;</th>
                			</tr>
                			<tr>
                				<th style="width: 25%">${id }</th>
                				<td style="width: 75%">${sessionScope.userInfo.id}</td>
                			</tr>
                			<tr>
                				<th>&nbsp;</th>
                			</tr>
                			<tr>
                				<th>${name }</th>
                				<td>${sessionScope.userInfo.name}</td>
                			</tr>
                			<tr>
                				<th>&nbsp;</th>
                			</tr>
                			<tr>
                				<th>${nickname }</th>
                				<td>${sessionScope.userInfo.nicname}</td>
                			</tr>
                			<tr>
                				<th>&nbsp;</th>
                			</tr>
                			<tr>
                				<th>${email }</th>
                				<td>${sessionScope.userInfo.email}</td>
                			</tr>
                			<tr>
                				<th>&nbsp;</th>
                			</tr>
                			<tr>
                				<td colspan="2">
                					<a href="myEdit" data-role="button" class="ui-btn ui-corner-all" style="border: 2px solid #F05562; background-color: white; color: #F05562;">${editinformation }</a>
                				</td>
                			</tr>
                		</table>
                	</div>
                </div>
               
            </div>
            <div data-role='footer' data-position='fixed' data-theme="c">
            	<div data-role='navbar'>
                    <ul>
                        <li>
                            <a data-icon='home' href="../tripus/">Home</a>
                        </li>
                        <li>
                            <a data-icon='calendar' href="mytrip">내 여행</a>
                        </li>
                        <li>
                            <a data-icon='edit' href="tripnote">여행노트</a>
                        </li>
                        <li>
                            <a data-icon='gear' class="ui-btn-active ui-state-persist" href="setting">설정</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>