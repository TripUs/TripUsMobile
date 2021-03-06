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
        <div id="main" data-role='page' style="background-color: white;">
            <!-- 영어 -->
        	<c:if test="${sessionScope.userInfo.lang eq 1 }">
        		<c:set value="Share Itinerary" var="invitefriend_sub"></c:set>
        		<c:set value="Share to a Friend" var="invitefriend_share"></c:set>
        		<c:set value="Invite TripUs" var="invitefriend_invite"></c:set>
        		<c:set value="친구 삭제" var="invitefriend_del"></c:set>
        		<c:set value="Friend's E-Mail" var="invitefriend_friendMail"></c:set>
        		<c:set value="Please Write One's E-mail" var="invitefriend_mail"></c:set>
        		<c:set value="Send" var="invitefriend_send"></c:set>
        		<c:set value="Schedule Sharing" var="share"></c:set>
        		<c:set value="Would you like to share your itinerary with your friends?" var="invitefriend_shareQsn"></c:set>
        		<c:set value="Submit" var="confirm"></c:set>
        		<c:set value="Cancel" var="cancel"></c:set>
        	</c:if>
    	    <!-- 한국어 -->
        	<c:if test="${sessionScope.userInfo.lang ne 1 }">
        		<c:set value="여행일정 공유" var="invitefriend_sub"></c:set>
        		<c:set value="친구와 일정 공유" var="invitefriend_share"></c:set>
        		<c:set value="TripUs 초대" var="invitefriend_invite"></c:set>
        		<c:set value="친구 삭제" var="invitefriend_del"></c:set>
        		<c:set value="친구 E-Mail" var="invitefriend_friendMail"></c:set>
        		<c:set value="상대의 E-Mail을 적어주세요" var="invitefriend_mail"></c:set>
        		<c:set value="발송" var="invitefriend_send"></c:set>
        		<c:set value="일정 공유" var="share"></c:set>
        		<c:set value="친구와 여행일정을 공유 하시겠습니까?" var="invitefriend_shareQsn"></c:set>
        		<c:set value="확인" var="confirm"></c:set>
        		<c:set value="취소" var="cancel"></c:set>
        	</c:if>
        	
            <div data-role='header' data-position='fixed' style="background-color: #F05562; color: white;">
            	<a href="#" data-rel="back" class="ui-btn ui-shadow ui-icon-mybackicon ui-btn-icon-left ui-btn-icon-notext ui-corner-all">Back</a>
                <h2>${invitefriend_sub }</h2>
            </div>
        	<div data-role='content'>
        		<div data-role="navbar">
        			<ul>
        				<li><a id="nav-friend" href="#" class="ui-btn-active">${invitefriend_share }</a></li>
        				<li><a id="nav-invite" href="#">${invitefriend_invite }</a></li>
        			</ul>
        		</div>
            	<div id="mytrip-friend" style="padding: 30px 10px;">
	            	<ul data-role="listview" data-filter="true" data-filter-placeholder="Search Name" data-inset="true">
                	<c:forEach items="${friendList }" var="bean">
                		<li data-icon="delete">
	                		<a href="#">
	                			<img src="${bean.friendprofile }"/>
	                			<h2>${bean.friendnicname }</h2>
	                		</a>
	                		<a href="#invite-mytrip-friend" onclick="invitemytrip('${bean.friendid }')" data-rel="popup" data-position-to="window" data-transition="pop">${invitefriend_del }</a>
	                	</li>
                   	</c:forEach>
                	</ul>
                	
                	<div data-role="popup" id="add-friend"></div>
					<div data-role="popup" id="invite-mytrip-friend"></div>
	            </div>
	            
	            <div id="mytrip-invite" style="padding: 30px 10px;">
	            	<form action="sendmail">
	            		<label for="email">&nbsp; <strong>${invitefriend_friendMail }</strong></label>
	            		<input type="email" id="email" name="address" placeholder="${invitefriend_mail }"/>
	            		<button style="background-color: #F05562; color: white; margin-top: 20px;">${invitefriend_send }</button>
	            	</form>
	            </div>
            </div>
            
            <script type="text/javascript">
	            var invitemytrip = function(data) {
	        		console.log('invite friend callback' + data);
	        		$('#invite-mytrip-friend').html("<h3>${share}</h3>");
	        		$('#invite-mytrip-friend').append("<p>${invitefriend_shareQsn}</p>");
	        		$('#invite-mytrip-friend').append("<a href='invitefriend/" + data + "' data-ajax='false' class='ui-shadow ui-btn ui-corner-all ui-btn-b ui-icon-check ui-btn-icon-delete ui-btn-inline ui-mini'>${confirm}</a>");
	        		$('#invite-mytrip-friend').append("<a href='#' data-rel='back' class='ui-shadow ui-btn ui-corner-all ui-btn-inline ui-mini'>${cancel}</a>");
	        	};
        	
            	$('#nav-friend').click(function() {
            		$('#mytrip-invite').hide();
            		$('#mytrip-friend').show();
            	});
				$('#nav-invite').click(function() {
					$('#mytrip-friend').hide();
            		$('#mytrip-invite').show();
            	});
            </script>
            
            <div data-role='footer' data-position='fixed' data-theme="c">
                <!-- data-role='navbar'는 앱스럽게 탭메뉴를 구성할 수 있도록 해준다. 가로 최대:5개 -->
                <div data-role='navbar'>
                    <ul>
                        <li>
                            <a data-icon='home' href="../tripus/">Home</a>
                        </li>
                        <li>
                            <a data-icon='calendar' class="ui-btn-active ui-state-persist" href="mytrip">내 여행</a>
                        </li>
                        <li>
                            <a data-icon='edit' href="tripnote">여행노트</a>
                        </li>
                        <li>
                            <a data-icon='gear' href="setting">설정</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>