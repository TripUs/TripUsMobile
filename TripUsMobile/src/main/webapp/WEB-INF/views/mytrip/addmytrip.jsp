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
        <link rel="stylesheet" href="resources/css/tripus.css">
        <script src="http://code.jquery.com/jquery-1.12.4.min.js"
                  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
                  crossorigin="anonymous"></script>
        <script src="resources/js/jquery.mobile-1.4.5.min.js"></script>
        <script src="resources/js/swiper.min.js"></script>
	    <title>Document</title>
    </head>
    <body>
        <div id="main" data-role='page'>
            <div data-role='header'>
                <h1>내 여행 관리</h1>
            </div>
        	
            <div data-role='content'>
      			<h2>내 여행 추가 페이지</h2>
                <form action="addmytrip" method="post" accept-charset="UTF-8" data-ajax="false">
                	<div data-role='fieldcontain'>
                		<input id="title" name="title" type="text" placeholder="여행 제목을 입력하세요"/>
                	</div>
                	<div data-role='fieldcontain'>
                		<label for="startdate">여행 시작일</label>
                		<input id="startdate" name="startdate" type="date"/>
                	</div>
                	<div data-role='fieldcontain'>
                		<label for="enddate">여행 종료일</label>
                		<input id="enddate" name="enddate" type="date"/>
                	</div>
                	<div data-role='fieldcontain'>
                		<fieldset data-role="controlgroup" data-type="horizontal" data-mini="true">
                			<legend>여행 테마</legend>
                			<input type="radio" name="thema" id="thema1" value="나홀로" checked="checked"/>
                			<label for="thema1">나홀로</label>
                			<input type="radio" name="thema" id="thema2" value="친구와 함께"/>
                			<label for="thema2">친구와 함께</label>
                			<input type="radio" name="thema" id="thema3" value="가족과 함께"/>
                			<label for="thema3">가족과 함께</label>
                			<input type="radio" name="thema" id="thema4" value="커플"/>
                			<label for="thema4">커플</label>
                		</fieldset>
                	</div>
                	<button>여행 등록</button>
                </form>
            </div>
            
            <div data-role='footer' data-position='fixed'>
                <!-- data-role='navbar'는 앱스럽게 탭메뉴를 구성할 수 있도록 해준다. 가로 최대:5개 -->
                <div data-role='navbar'>
                    <ul>
                        <li>
                            <a data-icon='home' href="main">Home</a>
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