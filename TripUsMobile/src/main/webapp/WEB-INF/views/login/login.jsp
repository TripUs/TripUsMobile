<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=width, initial-scale=1">
        <script type="text/javascript" src="resources/js/hello.all.min.js"></script>
        <script type="text/javascript" src="resources/js/google-oauth.js"></script>
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
                <button data-rel="popup" data-position-to="window" data-transition="pop" onclick="login()">Google+ 로그인</button>
                <a data-role='button' href="signin">회원가입</a>
            </div>
            <div data-role='footer' data-position='fixed'>
                <!-- data-role='navbar'는 앱스럽게 탭메뉴를 구성할 수 있도록 해준다. 가로 최대:5개 -->
                <div data-role='navbar'>
                    <ul>
                        <li>
                            <a data-icon='home' href="main">Home</a>
                        </li>
                        <li>
                            <a data-icon='bars' href="#">내 여행</a>
                        </li>
                        <li>
                            <a data-icon='camera' href="#">여행노트</a>
                        </li>
                        <li>
                            <a data-icon='camera' class="ui-btn-active ui-state-persist" href="setting">설정</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>