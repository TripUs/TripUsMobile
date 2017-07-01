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
        <div id="search" data-role='page'>
            <div data-role='header'>
                <h1>TripUs</h1>
            </div>
        	
            <div data-role='content'>
            	<ul data-role='listview' data-inset='true'>
            		<li data-role='list-divider'>상세 검색결과</li>
                    <c:forEach items="${tourList }" var="bean">
	            		<li>
	            			<a href="detail/${bean.contentid }">
								<img src="${bean.firstimage }" style="height: 100%;"/>
			                    <span><strong>${bean.title }</strong></span><br/>
			                    <span>${bean.addr1 }</span>
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
                            <a data-icon='calendar' href="mytrip">내 여행</a>
                        </li>
                        <li>
                            <a data-icon='edit' href="tripnote">여행노트</a>
                        </li>
                        <li>
                            <a data-icon='gear' href="setting">설정</a>
                        </li>
                    </ul>
                </div>
            </div><!-- end footer -->
        </div><!-- end page -->
    </body>
</html>