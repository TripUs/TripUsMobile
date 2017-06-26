<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=width, initial-scale=1">
        <link rel="stylesheet" href="resources/css/jquery.mobile-1.4.5.min.css"/>
        <link rel="stylesheet" href="resources/css/jquery.mobile.theme-1.4.5.min.css"/>
        <link rel="stylesheet" href="resources/css/swiper.min.css">
        <link rel="stylesheet" href="resources/css/tripus.css">
        <script src="http://code.jquery.com/jquery-1.12.4.min.js"
                  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
                  crossorigin="anonymous"></script>
        <script src="resources/js/jquery.mobile-1.4.5.min.js"></script>
        <script src="resources/js/swiper.min.js"></script>
	    <title>Document</title>
    </head>
    <body>
        <div data-role='page'>
            <div data-role='header'>
                <h1>TripUs</h1>
            </div>
            <div data-role='content'>
                <c:choose>
	                <c:when test="${not empty sessionScope.userInfo}">
	                	<h2>로그인 성공 </h2>
				        <p><img src="${sessionScope.userInfo.profile}"/></p>
				        <p>이름 : ${sessionScope.userInfo.name}</p>
				 		<p>이메일 : ${sessionScope.userInfo.email}</p>
				        <a data-role='button' href="logout">로그아웃</a>
	                </c:when>
	                <c:otherwise>
	                	<a data-role='button' href="login">로그인</a>
	                </c:otherwise>
                </c:choose>
                <ul data-role='listview' data-inset='true'>
                    <!-- 하나의 li에는 두개의 링크까지만 추가될 수 있다. -->
                    <!-- img를 class="ui-li-icon" 속성을 적용하면 아이콘 형태로사용가능하다. -->
                    <li>
                        <a href="#">
                            <img src=""/>	<!-- 이미지 아이콘 -->
                            <p>My Page</p>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src=""/>	<!-- 이미지 아이콘 -->
                            <p>리뷰 작성</p>
                        </a>
                    </li>
                    <li>
                        <a href="friendlist">
                            <img src=""/>	<!-- 이미지 아이콘 -->
                            <p>친구 목록</p>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src=""/>	<!-- 이미지 아이콘 -->
                            <p>언어 설정</p>
                        </a>
                    </li>
                </ul>
            </div>
            <div data-role='footer' data-position='fixed'>
                <!-- data-role='navbar'는 앱스럽게 탭메뉴를 구성할 수 있도록 해준다. 가로 최대:5개 -->
                <div data-role='navbar'>
                    <ul>
                        <li>
                            <a data-icon='home' href="main">Home</a>
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