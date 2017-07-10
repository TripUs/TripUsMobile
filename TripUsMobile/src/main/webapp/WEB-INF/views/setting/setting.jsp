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
        		<c:set value="TripUs Setting" var="setting"></c:set>        	
        		<c:set value="LogOut" var="logoutBtn"></c:set>    
        		<c:set value="My Page" var="account"></c:set>
        		<c:set value="Write a review" var="review"></c:set>
        		<c:set value="View friends list" var="friends"></c:set>
        		<c:set value="Set a language" var="language"></c:set>
        	</c:if>
        	<!-- 한국어 -->
        	<c:if test="${sessionScope.userInfo.lang ne 1 }">
        		<c:set value="TripUs 설정" var="setting"></c:set>        	
        		<c:set value="로그 아웃" var="logoutBtn"></c:set>
        		<c:set value="내 &nbsp; 정보" var="account"></c:set>
        		<c:set value="리뷰 작성" var="review"></c:set>
        		<c:set value="친구 목록" var="friends"></c:set>
        		<c:set value="언어 설정" var="language"></c:set>
        	</c:if>
        	
            <div data-role='header' data-position='fixed' style="background-color: #F05562; color: white;">
                <h1 style="color: white;">${setting }</h1>
            </div>
            <div data-role='content' style="padding-left: 10px; padding-right: 10px;">
            	<div class="ui-corner-all custom-corners" style="margin-top: 10px;">
                	<div class="ui-body ui-body-a" style="border: #e9e9e9 1px solid; border-radius: 10px">
                		<c:choose>
			                <c:when test="${not empty sessionScope.userInfo}">
			               		<table style="width: 100%">
		                			<tr>
		                				<td style="width: 25%">
		                					<img src="${sessionScope.userInfo.profile }" style="width: 100%; border-radius: 50px"/>
		                				</td>
		                				<td style="width: 75%">
		                					&nbsp; &nbsp; &nbsp; &nbsp; <strong>${sessionScope.userInfo.name } (${sessionScope.userInfo.nicname })</strong><br/><br/>
		                					&nbsp; &nbsp; &nbsp; &nbsp; <strong>${sessionScope.userInfo.email }</strong><br/>
		                				</td>
		                			</tr>
		                			<tr>
		                				<td colspan="2"><a data-role='button' href="logout" style="background-color: #F05562; color: white;">${logoutBtn }</a></td>
		                			</tr>
		                		</table>
		                	</c:when>
		                </c:choose>	
                	</div>
                </div>
                
	                <ul data-role='listview' data-inset='true' data-theme="c">
	                    <li>
	                        <a href="myPage" style="background-color: white; border: 1px solid #e9e9e9;">
	                            <img src=""/>	<!-- 이미지 아이콘 -->
	                            <h2>${account }</h2>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="search" style="background-color: white; border: 1px solid #e9e9e9; border-top: none;">
	                            <img src=""/>	<!-- 이미지 아이콘 -->
	                            <h2>${review }</h2>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="friendlist" style="background-color: white; border: 1px solid #e9e9e9; border-top: none;">
	                            <img src=""/>	<!-- 이미지 아이콘 -->
	                            <h2>${friends}</h2>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="language" style="background-color: white; border: 1px solid #e9e9e9; border-top: none;">
	                            <img src=""/>	<!-- 이미지 아이콘 -->
	                            <h2>${language }</h2>
	                        </a>
	                    </li>
	                </ul>
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