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
        <div data-role='page' style="background-color: white;">
            <div data-role='header' data-position='fixed' style="background-color: #F05562; color: white;">
                <h1 style="color: white;">TripUs Login</h1>
            </div>
            <div data-role='content' style="padding-left: 10px; padding-right: 10px;">
                <form action="login" method="post">
                	<div data-role='fieldcontain'>
                		<input id="id" name="id" type="text" placeholder="ID를 입력하세요"/>
                		<input id="pw" name="pw" type="password" placeholder="Password를 입력하세요"/>
                	</div>
                	<button style="background-color: white; color: #F05562; border: 2px solid #F05562">로그인</button>
                </form>
    
    
                <div id="login-icon">
	                <a data-role='button' href="signin" style="background-color: white; color: #F05562; border: 2px solid #F05562">회원가입</a><br/><br/>
	                <a id="google-login" href="${google_url }" data-ajax="false">
	                	<img src="resources/imgs/icon/google_login.jpg" />
	                	<input type="hidden" name="google" id="google" value="google"/>
	                </a>
	                <a id="kakao-login" href="${kakao_url }" data-ajax="false">
	                	<img src="resources/imgs/icon/kakao_login_en.png" />
	                	<input type="hidden" name="kakao" id="kakao" value="kakao"/>
	                </a>
            	</div>
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