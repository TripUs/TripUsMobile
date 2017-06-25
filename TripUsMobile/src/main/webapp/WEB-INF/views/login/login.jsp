<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <h2>로그인 페이지</h2>
                <form action="login" method="post">
                	<div data-role='fieldcontain'>
                		<input id="id" name="id" type="text" placeholder="ID를 입력하세요"/>
                		<input id="pw" name="pw" type="password" placeholder="Password를 입력하세요"/>
                	</div>
                	<button>로그인</button>
                </form>
                <a data-role='button' href="signin">회원가입</a><br/><br/>
                <div id="login-icon">
	                <a href="${google_url}"><img src="resources/imgs/icon/google_login.jpg" /></a>
	                <a href="${kakao_url }"><img src="resources/imgs/icon/kakao_login_en.png" /></a>
            	</div>
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