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
	    <title>Document</title>
    </head>
    <body>
        <div id="main" data-role='page'>
            <div data-role='header'>
                <h1>내 여행 관리</h1>
            </div>
        	
            <div data-role='content'>
            	<c:choose>
	                <c:when test="${not empty sessionScope.userInfo}">
	                	<!-- 로그인이 되어 있는 경우 -->
	                	
	                	<c:choose>
			                <c:when test="${not empty tripList}">
			                	<!-- 여행 목록이 있는 경우 -->
			                	<ul data-role="listview" data-inset="true">
			                	<c:forEach items="${tripList }" var="bean">
			                		<li><a href="mytripdetail/${bean.code }">
				                            <img src="${bean.coverimg }" style="height: 100%;"/>	<!-- 이미지 아이콘 -->
				                            <h2>${bean.title }</h2>
				                            <p>[${bean.thema}]&nbsp;${bean.startdate } ~ ${bean.enddate }</p>
				                            <span class="ui-li-count">참여 ${bean.num }명</span>
				                        </a>
				                    </li>		
			                	</c:forEach>
			                	</ul>
			                </c:when>
			                
			                <c:otherwise>
			                	<!-- 여행 목록이 없는 경우 -->
			                	<h2>${sessionScope.userInfo.nicname }님의 여행목록이 없습니다</h2>
			                	<p>지금 여행 계획을 세우시겠어요? &nbsp; &nbsp; <a href="addmytrip">여행 추가</a></p>
			                </c:otherwise>
		                </c:choose>
		                <a href="addmytrip">여행계획 세우기</a>
	                </c:when>
	                
	                <c:otherwise>
	                	<!-- 로그인이 되어 있지 않은 경우 -->
	                	<h2>내 여행 탭을 사용하기 위해선 로그인이 필요합니다</h2>
	                	<p>지금 로그인 하시겠습니까? &nbsp; &nbsp; <a href="setting">로그인 하기</a></p>
	                </c:otherwise>
                </c:choose>
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