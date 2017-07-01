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
        <link rel="stylesheet" href="resources/css/swiper.min.css">
        <link rel="stylesheet" href="resources/css/slick.css"/>
		<link rel="stylesheet" href="resources/css/slick-theme.css"/>
        <link rel="stylesheet" href="resources/css/tripus.css">
        <script src="http://code.jquery.com/jquery-1.12.4.min.js"
                  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
                  crossorigin="anonymous"></script>
        <script type="text/javascript" src="resources/js/jquery-migrate-1.4.1.min.js"></script>
        <script type="text/javascript" src="resources/js/jquery.mobile-1.4.5.min.js"></script>
        <script type="text/javascript" src="resources/js/slick.min.js"></script>
        <script type="text/javascript" src="resources/js/tripus.js"></script>
	    <title>Document</title>
    </head>
    <body>
        <div data-role='page'>
            <div data-role='header'>
            	<a href="setting" data-rel="back" class="ui-btn ui-shadow ui-icon-arrow-l ui-btn-icon-left ui-btn-icon-notext">Back</a>
                <h1>마이 페이지</h1>
            </div>
            <div data-role='content'>
            	<div class="ui-corner-all custom-corners">
            		<div class="ui-bar ui-bar-a">
            	   		<h3>회원 프로필</h3>
                	</div>
                	<div class="ui-body ui-body-a">
                		<table style="width: 100%;">
                			<tr>
                				<td id="profile-td" style="width: 25%">
                					<img src="${sessionScope.userInfo.profile }" style="width: 100%;"/>
                				</td>
                				<td style="width: 75%">
                					&nbsp; &nbsp; &nbsp; &nbsp; ${sessionScope.userInfo.name } (${sessionScope.userInfo.nicname })<br/><br/>
                					&nbsp; &nbsp; &nbsp; &nbsp; ${sessionScope.userInfo.email }<br/><br/>
                					<a href="#" data-role="button" id="profile-edit-btn" style="width: 60%; margin-left: 5%;">프로필 사진 변경</a>
                				</td>
                			</tr>
                		</table>
                	</div>
               		<div id="profile-table"></div>
                </div><br/>
                 
                 <script type="text/javascript">
                 	$('#profile-edit-btn').click(function() {
                 		var profileflag = $('#profileflag').val();
                 		if(profileflag != 1) {
                 			$('#profile-edit-btn').html('프로필 사진 변경 취소');
	                 		$('#profile-table').append('<div data-role="controlgroup" data-type="horizontal"><div class="ui-controltroup-controls">'
	                 					+ '<input type="hidden" value="1" id="profileflag" />'
	                 					+ '<div class="ui-input-text ui-body-inherit ui-corner-all ui-controlgroup-textinput ui-btn ui-first-child ui-shaow-inset">'				
	                 					+ '<form id="fileForm" method="post" enctype="multipart/form-data">'
	                 					+ '<input id="profileimg" name="profile" type="file" data-wrapper-class="controlgroup-textinput ui-btn"/>'
	                 					+ '<button onclick="uploadProfile();" class="ui-btn ui-shadow ui-corner-all ui-last-child">바꾸기</button></form></div></div></div>');
                 		} else {
                 			$('#profile-edit-btn').html('프로필 사진 변경');
                 			$('.ui-controltroup-controls').remove();
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
                            	alert("업로드 성공!!");
                            }
                    	});
                    }
				</script>

                 
                 <div class="ui-corner-all custom-corners">
                	<div class="ui-bar ui-bar-a">
                		<h3>회원 정보</h3>
                	</div>
                	<div class="ui-body ui-body-a">
                		<table style="width: 100%">
                			<tr>
                				<th>&nbsp;</th>
                			</tr>
                			<tr>
                				<th style="width: 25%">아이디</th>
                				<td style="width: 75%">${sessionScope.userInfo.id}</td>
                			</tr>
                			<tr>
                				<th>&nbsp;</th>
                			</tr>
                			<tr>
                				<th>이 름</th>
                				<td>${sessionScope.userInfo.name}</td>
                			</tr>
                			<tr>
                				<th>&nbsp;</th>
                			</tr>
                			<tr>
                				<th>닉네임</th>
                				<td>${sessionScope.userInfo.nicname}</td>
                			</tr>
                			<tr>
                				<th>&nbsp;</th>
                			</tr>
                			<tr>
                				<th>E-Mail</th>
                				<td>${sessionScope.userInfo.email}</td>
                			</tr>
                			<tr>
                				<th>&nbsp;</th>
                			</tr>
                			<tr>
                				<td colspan="2">
                					<a href="myEdit" data-role="button" class="ui-btn ui-corner-all">회원정보 수정</a>
                				</td>
                			</tr>
                		</table>
                	</div>
                </div>
               
            </div>
            <div data-role='footer' data-position='fixed'>
            	<div data-role='navbar'>
                    <ul>
                        <li>
                            <a data-icon='home' href="/">Home</a>
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