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
        <link rel="stylesheet" href="../resources/css/slick.css"/>
		<link rel="stylesheet" href="../resources/css/slick-theme.css"/>
		<link rel="stylesheet" href="../resources/css/themec.min.css"/>
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
        <title>Document</title>
	    <script type="text/javascript">
		    $(document).ready(function() {
	        	$('.img-slider').slick({
	        		dots : false,
	        		infinite : true,
	        		speed : 300,
	        		slidesToShow : 1,
	        		centerMode : true,
	        		variableWidth : false
	        	});
	        });            	
	    </script>
    </head>
    <body>
        <div data-role='page' style="background-color: white;">
            <div data-role='header' data-position='fixed' style="background-color: #F05562; color: white;">
                <a href="#" data-rel="back" class="ui-btn ui-shadow ui-icon-mybackicon ui-btn-icon-left ui-btn-icon-notext ui-corner-all">Back</a>
                <h1>여행노트 공유</h1>
            </div>
        	
            <div data-role='content' style="padding: 0px 10px;">
      			<form method="post" enctype="multipart/form-data" data-ajax="false">
                	<div data-role='fieldcontain'>
                		<label for="title">&nbsp; <strong>여행 제목</strong></label>
                		<input id="title" name="title" type="text" value="${mytrip.title }" placeholder="여행 제목을 입력하세요"/><br/>
						<input type="hidden" name="daynum" value="${fn:length(tripList)} "/>
               			<c:forEach items="${tripList }" var="tripday">
	                		
	                		<div style="border: #e9e9e9 2px solid; border-radius: 5px; margin-bottom: 10px; padding: 0px 10px;">
	                			<div style="">
	                				<h4>Day ${tripday.daynum }<small>&nbsp; (${tripday.tripdate })</small></h4>
			                	</div>
	                			<label>소제목</label>
	                			<input type="text" name="daytitle_${tripday.daynum }" placeholder="여행 소제목을 입력해보세요."/>
			                	<c:forEach items="${tripDetail }" var="detail" varStatus="n">
			                		<c:if test="${tripday.tripdate eq detail.tripdate }">
			                			
			                			<p>${detail.content_title }</p>
			                			
			                		</c:if>
			                	</c:forEach>
			                	<textarea name="content_${tripday.daynum }"></textarea>
               					<div style="">
               						<input multiple="multiple" type="file" name="file_${tripday.daynum }">
               					</div>
               				</div>
               			
               			</c:forEach>
                		
                	</div>
                	<button style="background-color: #F05562; color: white; border-radius: 5px;">여행노트 등록</button>
                </form>
            </div>
            
            <div data-role='footer' data-position='fixed' data-theme="c">
                <div data-role='navbar'>
                    <ul>
                        <li>
                            <a data-icon='home' href="../../tripus/">Home</a>
                        </li>
                        <li>
                            <a data-icon='calendar' class="ui-btn-active ui-state-persist" href="../mytrip">내 여행</a>
                        </li>
                        <li>
                            <a data-icon='edit' href="../tripnote">여행노트</a>
                        </li>
                        <li>
                            <a data-icon='gear' href="../setting">설정</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>