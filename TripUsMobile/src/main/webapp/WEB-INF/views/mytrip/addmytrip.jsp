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
        		<c:set value="Add my trip" var="mytrip_add"></c:set>
        		<c:set value="Trip title" var="mytrip_sub"></c:set>
        		<c:set value="Enter your trip title" var="mytrip_subInput"></c:set>
        		<c:set value="Travel start date" var="mytrip_startDate"></c:set>
        		<c:set value="Travel end date" var="mytrip_endDate"></c:set>
        		<c:set value="Travel Theme" var="mytrip_theme"></c:set>
        		<c:set value="Alone" var="mytrip_theme_alone"></c:set>
        		<c:set value="Friends" var="mytrip_theme_withFriend"></c:set>
        		<c:set value="Family" var="mytrip_theme_withFamily"></c:set>
        		<c:set value="Lover" var="mytrip_theme_withLover"></c:set>
        		<c:set value="Add Travel Plan" var="mytrip_addPlan"></c:set>
        	</c:if>
        	<!-- 한국어 -->
        	<c:if test="${sessionScope.userInfo.lang ne 1 }">
        		<c:set value="내 여행 추가" var="mytrip_add"></c:set>
        		<c:set value="여행 제목" var="mytrip_sub"></c:set>
        		<c:set value="여행 제목을 입력하세요" var="mytrip_subInput"></c:set>
        		<c:set value="여행 시작일" var="mytrip_startDate"></c:set>
        		<c:set value="여행 종료일" var="mytrip_endDate"></c:set>
        		<c:set value="여행 테마" var="mytrip_theme"></c:set>
        		<c:set value="나홀로" var="mytrip_theme_alone"></c:set>
        		<c:set value="친구와함께" var="mytrip_theme_withFriend"></c:set>
        		<c:set value="가족과함께" var="mytrip_theme_withFamily"></c:set>
        		<c:set value="연인과함께" var="mytrip_theme_withLover"></c:set>
        		<c:set value="여행계획 추가" var="mytrip_addPlan"></c:set>
        	</c:if>
        	
            <div data-role='header' data-position='fixed' style="background-color: #F05562; color: white;">
                <a href="#" data-rel="back" class="ui-btn ui-shadow ui-icon-mybackicon ui-btn-icon-left ui-btn-icon-notext ui-corner-all">Back</a>
                <h1>${mytrip_add }</h1>
            </div>
        	
            <div data-role='content' style="padding: 0px 10px;">
      			<form action="addmytrip" method="post" accept-charset="UTF-8" data-ajax="false">
                	<div data-role='fieldcontain'>
                		<label for="title">&nbsp; <strong>${mytrip_sub }</strong></label>
                		<input id="title" name="title" type="text" placeholder="${mytrip_subInput }"/><br/>
                		<label for="startdate">&nbsp; <strong>${mytrip_startDate }</strong></label>
                		<input id="startdate" name="startdate" type="date"/><br/>
                		<label for="enddate">&nbsp; <strong>${mytrip_endDate }</strong></label>
                		<input id="enddate" name="enddate" type="date"/>
                	</div>
                	<div data-role='fieldcontain'>
                		<fieldset data-role="controlgroup" data-type="horizontal" data-mini="true">
                			<legend>&nbsp; <strong>${mytrip_theme }</strong></legend>
                			<input type="radio" name="thema" id="thema1" value="${mytrip_theme }" checked="checked"/>
                			<label for="thema1">${mytrip_theme }</label>
                			<input type="radio" name="thema" id="thema2" value="${mytrip_theme_withFriend }"/>
                			<label for="thema2">${mytrip_theme_withFriend }</label>
                			<input type="radio" name="thema" id="thema3" value="${mytrip_theme_withFamily }"/>
                			<label for="thema3">${mytrip_theme_withFamily }</label>
                			<input type="radio" name="thema" id="thema4" value="${mytrip_theme_withLover }"/>
                			<label for="thema4">${mytrip_theme_withLover }</label>
                		</fieldset>
                	</div>
                	<button style="background-color: #F05562; color: white; border-radius: 5px;">${mytrip_addPlan }</button>
                </form>
            </div>
            
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