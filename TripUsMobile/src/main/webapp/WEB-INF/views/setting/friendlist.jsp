<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=width, initial-scale=1">
        <link rel="stylesheet" href="../resources/css/jquery.mobile-1.4.5.min.css"/>
        <link rel="stylesheet" href="../resources/css/jquery.mobile.theme-1.4.5.min.css"/>
        <link rel="stylesheet" href="../resources/css/swiper.min.css">
        <link rel="stylesheet" href="../resources/css/tripus.css">
        <script src="http://code.jquery.com/jquery-1.12.4.min.js"
                  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
                  crossorigin="anonymous"></script>
        <script src="../resources/js/jquery.mobile-1.4.5.min.js"></script>
        <script src="../resources/js/swiper.min.js"></script>
	    <title>Document</title>
    </head>
    <body>
        <div data-role='page'>
            <div data-role='header'>
                <a href="#" data-rel="back" class="ui-btn ui-shadow ui-icon-arrow-l ui-btn-icon-left ui-btn-icon-notext">Back</a>
                <h1>친구 목록</h1>
                <a href="#add-friend" data-icon="plus" data-rel="popup" data-position-to="window" data-transition="pop">친구 추가</a>
            </div>
            <div data-role='content'>
            	<c:if test="${userList ne null }"><div>검색 목록 (${fn:length(userList)})</div></c:if>
                <ul data-role="listview" data-inset="true">
                	<c:forEach items="${userList }" var="bean2">
                		<li data-icon="delete">
                			<a href="#"><img src="${bean2.profile }"/>
                			<h2>${bean2.name }</h2></a>
                			<a href="../addfriend/${bean2.id }" data-icon="plus">친구 추가</a>
                		</li>
                	</c:forEach>
                </ul>
                
            	<div>친구 목록 (${fn:length(friendList)})</div>
                <ul data-role="listview" data-filter="true" data-filter-placeholder="Search Name" data-inset="true">
                	<c:forEach items="${friendList }" var="bean">
                		<li data-icon="delete">
                			<a href="#"><img src="${bean.friendprofile }"/>
                			<h2>${bean.friendnicname }
	                			<c:if test="${bean.flag eq 0 }">(요청중..)</c:if>
	                			<c:if test="${bean.flag eq 1 }">(대기중..)</c:if>
                			</h2></a>
                			<a href="#delete-friend" data-rel="popup" data-position-to="window" data-transition="pop">친구 삭제</a>
                		</li>
                	</c:forEach>
                </ul>
                <div data-role="popup" id="delete-friend">
                	<h3>친구 삭제</h3>
                	<p>친구를 삭제하시겠습니까?</p>
                	<a href="#" data-rel="back" class="ui-shadow ui-btn ui-corner-all ui-btn-b ui-icon-check ui-btn-icon-left ui-btn-inline ui-mini">취소</a>
                	<a href="#" data-rel="back" class="ui-shadow ui-btn ui-corner-all ui-btn-inline ui-mini">삭제</a>
                </div>
                <div data-role="popup" id="add-friend">
                	<h3>친구 추가</h3>
                	<form action="../searchfriend" method="post" data-ajax="false">
		            	<input type="text" name="name" placeholder="Search Name"/>
		            	<button>검색</button>
		            </form>
            	</div>
            </div>
            <div data-role='footer' data-position='fixed'>
                <div data-role='navbar'>
                    <ul>
                        <li>
                            <a data-icon='home' href="../main">Home</a>
                        </li>
                        <li>
                            <a data-icon='calendar' href="../mytrip">내 여행</a>
                        </li>
                        <li>
                            <a data-icon='edit' href="../tripnote">여행노트</a>
                        </li>
                        <li>
                            <a data-icon='gear' class="ui-btn-active ui-state-persist" href="../setting">설정</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>