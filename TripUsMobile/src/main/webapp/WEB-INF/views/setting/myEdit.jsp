<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <div data-role='page' style="background-color: white;">
            <div data-role='header' style="background-color: #F05562; color: white;">
            	<a href="#" data-rel="back" class="ui-btn ui-shadow ui-icon-arrow-l ui-btn-icon-left ui-btn-icon-notext ui-corner-all">Back</a>
                <h1 style="color: white;">회원정보 수정</h1>
            </div>
            <div data-role='content' style="padding-left: 10px; padding-right: 10px;">
            	<form method="post">
                	<ul data-role="listview" data-inset="true">
                		<li class="ui-field-contain">
	                		<label>아 이 디 </label>
                			<input id="id" name="id" type="text" value="${sessionScope.userInfo.id }" readonly/>
                		</li>
                		<li class="ui-field-contain">
                			<label>비밀번호 </label>
                			<input id="pw" name="pw" type="password" value="${sessionScope.userInfo.pw }" />
                		</li>
                		<li class="ui-field-contain">
                			<label>이 &nbsp; &nbsp; 름 </label>
                			<input id="name" name="name" type="text" value="${sessionScope.userInfo.name }"/>
                		</li>
                		<li class="ui-field-contain">
                			<label>닉 네 임</label>
                			<input id="nicname" name="nicname" type="text" value="${sessionScope.userInfo.nicname }" />
                		</li>
                		<li class="ui-field-contain">
                			<label>E - Mail</label>
                			<input id="email" name="email" type="email" value="${sessionScope.userInfo.email }" />
                		</li>
                	</ul>
	                <button style="background: #F05562; color: white;">수정완료</button>
                </form>
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