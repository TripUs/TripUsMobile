<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=width, initial-scale=1">
        <title>Document</title>
    </head>
    <body>
        <div data-role='page'>
            <div data-role='header'>
                <h1>TripUs</h1>
            </div>
            <div data-role='content'>
                <ul data-role='listview' data-inset='true' data-filter="true">
                    <li data-role='list-divider'>최근 검색지</li>
                    <c:forEach items="${list }" var="bean">
                    <li>
                        <!-- 하나의 li에는 두개의 링크까지만 추가될 수 있다. -->
                        <!-- img를 class="ui-li-icon" 속성을 적용하면 아이콘 형태로사용가능하다. -->
                        <a href="detail/${bean.contentid }">
                            <img src="${bean.firstimage }"/>
                            <h2>${bean.title }</h2>
                            <p>${bean.addr1 }</p>
                            <p class="ui-li-aside">추천</p>
                            <span class="ui-li-count">11</span>
                        </a>
                    </li>
                    </c:forEach>
                </ul>
            </div>
            <div data-role='footer' data-position='fixed'>
                <!-- data-role='navbar'는 앱스럽게 탭메뉴를 구성할 수 있도록 해준다. 가로 최대:5개 -->
                <div data-role='navbar'>
                    <ul>
                        <li>
                            <a data-icon='home' class="ui-btn-active ui-state-persist" href="main">Home</a>
                        </li>
                        <li>
                            <a data-icon='bars' href="#">내 여행</a>
                        </li>
                        <li>
                            <a data-icon='camera' href="#">여행노트</a>
                        </li>
                        <li>
                            <a data-icon='camera' href="setting">설정</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>