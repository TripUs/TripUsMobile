<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html>
	<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../resources/css/jquery.mobile-1.4.5.min.css"/>
        <link rel="stylesheet" href="../resources/css/jquery.mobile.theme-1.4.5.min.css"/>
        <link rel="stylesheet" href="../resources/css/themec.min.css"/>
        <link rel="stylesheet" href="../resources/css/slick.css"/>
		<link rel="stylesheet" href="../resources/css/slick-theme.css"/>
        <link rel="stylesheet" href="../resources/css/tripus.css">
        <script src="http://code.jquery.com/jquery-1.12.4.min.js"
                  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
                  crossorigin="anonymous"></script>
        <script type="text/javascript" src="../resources/js/jquery-migrate-1.4.1.min.js"></script>
        <script type="text/javascript" src="../resources/js/jquery.mobile-1.4.5.min.js"></script>
        <script type="text/javascript" src="../resources/js/jquery.form.min.js"></script>
        <script type="text/javascript" src="../resources/js/slick.min.js"></script>
        <script src="http://itemslide.github.io/dist/itemslide.min.js"></script>
        <script type="text/javascript" src="../resources/js/tripus.js"></script>
	    <script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=27fe7a62295f8cc3e56a54958afc32e5&libraries=services"></script>
        <script type="text/javascript" charset="utf-8" src="../resources/js/cordova.js"></script>
        <script type="text/javascript" charset="utf-8" src="../resources/js/cordova_plugins.js"></script>
        <script type="text/javascript" charset="utf-8" src="../resources/js/geolocation.js"></script>
    </head>
    <body>
        <div data-role='page' style="background-color: white;">
            <!-- 영어 -->
        	<c:if test="${sessionScope.userInfo.lang eq 1 }">
        		<c:set value="Write Travel Notes" var="addtripnote_sub"></c:set>
        		<c:set value="Add an Event" var="addtripnote_add"></c:set>
        		<c:set value="Trip Title" var="addtripnote_title"></c:set>
        		<c:set value="Enter your trip title" var="addtripnote_title_input"></c:set>
        		<c:set value="Subtitle" var="addtripnote_subtitle"></c:set>
        		<c:set value="Please enter your travel subtitle." var="addtripnote_subtitle_input"></c:set>
        		<c:set value="Trip Title" var="addtripnote_title"></c:set>
        		<c:set value="Delete Event" var="addtripnote_del"></c:set>
        		<c:set value="Take your travels." var="addtripnote_take"></c:set>
        		<c:set value="Write your travel notes" var="addtripnote_writeNotes"></c:set>
        	</c:if>
            <!-- 한국어 -->
        	<c:if test="${sessionScope.userInfo.lang ne 1 }">
        		<c:set value="여행노트 작성" var="addtripnote_sub"></c:set>
        		<c:set value="일정 추가" var="addtripnote_add"></c:set>
        		<c:set value="여행 제목" var="addtripnote_title"></c:set>
        		<c:set value="여행 제목을 입력하세요" var="addtripnote_title_input"></c:set>
        		<c:set value="소제목" var="addtripnote_subtitle"></c:set>
        		<c:set value="여행 소제목을 입력해보세요." var="addtripnote_subtitle_input"></c:set>
        		<c:set value="일정 추가" var="addtripnote_add"></c:set>
        		<c:set value="일정 삭제" var="addtripnote_del"></c:set>
        		<c:set value="여행기를 담아보세요." var="addtripnote_take"></c:set>
        		<c:set value="여행노트 등록" var="addtripnote_writeNotes"></c:set>
        	</c:if>
        	
            <div data-role='header' data-position='fixed' style="background-color: #F05562; color: white;">
                <a href="#" data-rel="back" class="ui-btn ui-shadow ui-icon-mybackicon ui-btn-icon-left ui-btn-icon-notext ui-corner-all">Back</a>
                <h1>${addtripnote_sub }</h1>
                <a onclick="addContent()" href="#" class="ui-btn ui-shadow ui-icon-myplusicon ui-btn-icon-left ui-btn-icon-notext ui-corner-all">${addtripnote_add }</a>
            </div>
        	
            <div data-role='content' style="padding: 0px 10px;">
      			<form method="post" enctype="multipart/form-data" data-ajax="false">
                	<div data-role='fieldcontain'>
                		<label for="title">&nbsp; <strong>${addtripnote_title }</strong><a href="#" onclick="delContent()">${addtripnote_del }</a></label>
                		<input id="title" name="title" type="text" placeholder="${addtripnote_title_input }"/><br/>
						<input id="note-daynum" type="hidden" name="daynum" value="1">
						<div id="note-con">
							<div id="con_1" style="border: #e9e9e9 2px solid; border-radius: 5px; margin-bottom: 10px; padding: 0px 10px;">
		                		<div style="">
		                			<h4>Day1</h4>
				               	</div>
		                		<label>${addtripnote_subtitle }</label>
		                		<input type="text" name="daytitle_1" placeholder="${addtripnote_subtitle_input }"/>
				                <textarea name="content_1" placeholder="${addtripnote_take }"></textarea>
	               				<div style="">
	               					<input multiple="multiple" type="file" name="file_1" />
	               				</div>
	               			</div>
						</div>
						
                	</div>
                	<button style="background-color: #F05562; color: white; border-radius: 5px;">${addtripnote_writeNotes }</button>
                </form>
            </div>
            
            <script type="text/javascript">
            	var daynum = 1;
            	function addContent() {
            		daynum++;
            		$('#note-con').append('<div id="con_' + daynum + '" style="border: #e9e9e9 2px solid; border-radius: 5px; margin-bottom: 10px; padding: 0px 10px;">'
	            			+ '<div style=""><h4>Day' + daynum + '</h4></div><label>${addtripnote_subtitle}</label>'
	            			+ '<div class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset">'
	            			+ '<input type="text" name="daytitle_' + daynum + '" placeholder="${addtripnote_subtitle_input}"/></div>'
		                	+ '<textarea placeholder="${addtripnote_take}" name="content_' + daynum + '" class="ui-input-text ui-shadow-inset ui-body-inherit ui-corner-all ui-textinput-autogrow"></textarea><div style="">'
	       					+ '<div class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset">'
		                	+ '<input multiple="multiple" type="file" name="file_' + daynum + '"></div>'
	       					+ '</div></div>');
            		$('#note-daynum').val(daynum);
            	};
            	
            	function delContent() {
            		$('#con_' + daynum).remove();
            		if(daynum > 0) {
            			daynum--;
            			$('#note-daynum').val(daynum);
            		}
            	};
            </script>
            
            <div data-role='footer' data-position='fixed' data-theme="c">
                <div data-role='navbar'>
                    <ul>
                        <li>
                            <a data-icon='home' href="../tripus/">Home</a>
                        </li>
                        <li>
                            <a data-icon='calendar' href="mytrip">내 여행</a>
                        </li>
                        <li>
                            <a data-icon='edit' class="ui-btn-active ui-state-persist" href="tripnote">여행노트</a>
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