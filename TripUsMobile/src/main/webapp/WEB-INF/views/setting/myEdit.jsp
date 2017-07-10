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
        <div data-role='page' style="background-color: white;">
        
            <!-- 영어 -->
        	<c:if test="${sessionScope.userInfo.lang eq 1 }">
        		<c:set value="Edit Your Info." var="editinformation"></c:set>
        		<c:set value="ID" var="id"></c:set>
        		<c:set value="PASSWORD" var="password"></c:set>
        		<c:set value="Name" var="name"></c:set>
        		<c:set value="Nickname" var="nickname"></c:set>
        		<c:set value="E - Mail" var="email"></c:set>
        		<c:set value="Modifications completed" var="modicompleted"></c:set>
        	</c:if>
        	<!-- 한국어 -->
        	<c:if test="${sessionScope.userInfo.lang ne 1 }">
        		<c:set value="회원정보 수정" var="editinformation"></c:set>
        		<c:set value="아이디" var="id"></c:set>	
        		<c:set value="비밀번호" var="password"></c:set>
        		<c:set value="이 &nbsp 름" var="name"></c:set>
        		<c:set value="별 &nbsp 명" var="nickname"></c:set>
        		<c:set value="이메일" var="email"></c:set>
        		<c:set value="수정 완료" var="modicompleted"></c:set>
        	</c:if>
        	
            <div data-role='header' style="background-color: #F05562; color: white;">
            	<a href="#" data-rel="back" class="ui-btn ui-shadow ui-icon-mybackicon ui-btn-icon-left ui-btn-icon-notext ui-corner-all">Back</a>
                <h1 style="color: white;">${editinformation }</h1>
            </div>
            <div data-role='content' style="padding-left: 10px; padding-right: 10px;">
            	<form method="post">
                	<ul data-role="listview" data-inset="true">
                		<li class="ui-field-contain">
	                		<label>${id } </label>
                			<input id="id" name="id" type="text" value="${sessionScope.userInfo.id }" readonly/>
                		</li>
                		<li class="ui-field-contain">
                			<label>${password } </label>
                			<input id="pw" name="pw" type="password" value="${sessionScope.userInfo.pw }" />
                		</li>
                		<li class="ui-field-contain">
                			<label>${name } </label>
                			<input id="name" name="name" type="text" value="${sessionScope.userInfo.name }"/>
                		</li>
                		<li class="ui-field-contain">
                			<label>${nickname }</label>
                			<input id="nicname" name="nicname" type="text" value="${sessionScope.userInfo.nicname }" />
                		</li>
                		<li class="ui-field-contain">
                			<label>${email }</label>
                			<input id="email" name="email" type="email" value="${sessionScope.userInfo.email }" />
                		</li>
                	</ul>
	                <button style="background: #F05562; color: white;">${modicompleted }</button>
                </form>
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