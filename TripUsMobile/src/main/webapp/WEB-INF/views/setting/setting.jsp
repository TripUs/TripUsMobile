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
        <script type="text/javascript" src="resources/js/tripus.js"></script>
	    <title>Document</title>
    </head>
    <body>
        <div data-role='page' style="background-color: white;">
            <div data-role='header' data-position='fixed' style="background-color: #F05562; color: white;">
                <h1 style="color: white;">TripUs Setting</h1>
            </div>
            <div data-role='content' style="padding-left: 10px; padding-right: 10px;">
            	<div class="ui-corner-all custom-corners" style="margin-top: 10px;">
                	<div class="ui-body ui-body-a" style="border: #F05562 1px solid; border-radius: 10px">
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
		                				<td colspan="2"><a data-role='button' href="logout" style="background-color: #F05562; color: white;">로그아웃</a></td>
		                			</tr>
		                		</table>
		                	</c:when>
			                <c:otherwise>
			                	<a data-role='button' href="login">로그인</a>
			                </c:otherwise>
		                </c:choose>	
                	</div>
                </div>
                
	                <ul data-role='listview' data-inset='true'>
	                    <li>
	                        <a href="myPage" style="background-color: white; border: 1px solid #F05562;">
	                            <img src=""/>	<!-- 이미지 아이콘 -->
	                            <h2>My Page</h2>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="#" style="background-color: white; border: 1px solid #F05562; border-top: none;">
	                            <img src=""/>	<!-- 이미지 아이콘 -->
	                            <h2>리뷰 작성</h2>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="friendlist" style="background-color: white; border: 1px solid #F05562; border-top: none;">
	                            <img src=""/>	<!-- 이미지 아이콘 -->
	                            <h2>친구 목록</h2>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="#" style="background-color: white; border: 1px solid #F05562; border-top: none;">
	                            <img src=""/>	<!-- 이미지 아이콘 -->
	                            <h2>언어 설정</h2>
	                        </a>
	                    </li>
	                </ul>
            </div>
            <div data-role='footer' data-position='fixed'>
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