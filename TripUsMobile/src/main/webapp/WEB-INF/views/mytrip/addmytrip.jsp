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
	    <script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=0f2e3ff280f258cf4dc5f49a68d055b8&libraries=services"></script>
        <title>Document</title>
	    <script type="text/javascript">
		    $(document).ready(function() {
	        	$('.img-slider').slick({
	        		dots : false,
	        		infinite : true,
	        		speed : 300,
	        		slidesToShow : 1,
	        		centerMode : true,
	        		variableWidth : false
	        	});
	        });            	
	    </script>
    </head>
    <body>
        <div data-role='page' style="background-color: white;">
            <div data-role='header' data-position='fixed' style="background-color: #F05562; color: white;">
                <a href="#" data-rel="back" class="ui-btn ui-shadow ui-icon-arrow-l ui-btn-icon-left ui-btn-icon-notext ui-corner-all">Back</a>
                <h1>내 여행 추가</h1>
            </div>
        	
            <div data-role='content' style="padding: 0px 10px;">
      			<form action="addmytrip" method="post" accept-charset="UTF-8" data-ajax="false">
                	<div data-role='fieldcontain'>
                		<label for="title">&nbsp; <strong>여행 제목</strong></label>
                		<input id="title" name="title" type="text" placeholder="여행 제목을 입력하세요"/><br/>
                		<label for="startdate">&nbsp; <strong>여행 시작일</strong></label>
                		<input id="startdate" name="startdate" type="date"/><br/>
                		<label for="enddate">&nbsp; <strong>여행 종료일</strong></label>
                		<input id="enddate" name="enddate" type="date"/>
                	</div>
                	<div data-role='fieldcontain'>
                		<fieldset data-role="controlgroup" data-type="horizontal" data-mini="true">
                			<legend>&nbsp; <strong>여행 테마</strong></legend>
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
                	<button style="background-color: #F05562; color: white; border-radius: 5px;">여행 등록</button>
                </form>
            </div>
            
            <div data-role='footer' data-position='fixed'>
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