<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="../resources/css/tripus.css">
        <script src="http://code.jquery.com/jquery-1.12.4.min.js"
                  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
                  crossorigin="anonymous"></script>
        <script type="text/javascript" src="../resources/js/jquery-migrate-1.4.1.min.js"></script>
        <script type="text/javascript" src="../resources/js/jquery.mobile-1.4.5.min.js"></script>
        <script type="text/javascript" src="../resources/js/slick.min.js"></script>
	    <title>Document</title>
    </head>
    <body>
        <div id="main" data-role='page'>
            <div data-role='header'>
            	<a href="#" data-rel="back" class="ui-btn ui-shadow ui-icon-arrow-l ui-btn-icon-left ui-btn-icon-notext ui-corner-all">Back</a>
                <h2>${mytrip.title }</h2>
            </div>
        	<div data-role='content'>
        		<div data-role="navbar">
        			<ul>
        				<li><a id="nav-story" href="#" class="ui-btn-active">여행 스토리</a></li>
        				<li><a id="nav-maps" href="#">여행 경로</a></li>
        			</ul>
        		</div>
            	<div id="mytrip-story">
	            	<div data-role="controlgroup" data-type="horizontal">
	            		<img class="mytrip-cover" src="${mytrip.coverimg }"/>
	               		<a class="mytrip-detail-btn" data-role="button" href="#" style="background-color: black; color: white;">커버 변경</a>
	               		<a class="mytrip-detail-btn" data-role="button" href="../invitefriend" style="background-color: black; color: white;">친구 초대</a>
	               	</div>
	               	<c:forEach items="${tripList }" var="bean">
	               		<div class="ui-corner-all custom-corners">
	               			<div class="ui-bar ui-bar-a">
		               			<h3>여행 ${bean.daynum }일차</h3><small>(${bean.tripdate })</small>
		               			<a class="addtrip" href="../search_mytrip?tripdate=${bean.tripdate}"> 여행지 추가 + </a>
	               			</div>
	               			<div class="ui-body ui-body-a">
	               				<c:forEach items="${tripDetail }" var="detail">
	               					<c:if test="${bean.tripdate eq detail.tripdate }">
	               						<div><a href="../detail/${detail.contentid }">
	               							<img src="${detail.content_img }" style="width: 50%;"/>
	               							<strong>${detail.content_title }</strong></a>
	               						</div>	               						
	               					</c:if>
	               				</c:forEach>
	               				
	               				<!-- 메모 공간 -->
	               				<div data-role="collapsible" data-theme="b" data-content-theme="a">
	               					<h4>${bean.daynum }일차 Story</h4>
	               					<ul data-role="listview" data-inset="true">
		               					<c:forEach items="${tripStory }" var="story">
		               						<c:if test="${bean.tripdate eq story.tripdate }">
		               							<li data-icon="comment">
		               								<a href="#"><img class="ui-li-icon" src="${story.userprofile }" style="width: 100%; height: 100%;"/>
		               								${story.memo }</a>
		               								<a href="../replestory/${story.idx }">댓글</a>
		               							</li>
		               							<%-- <p>
		               								<img src="${story.userprofile }" style="width: 50px; height: 50px;"/> 
		               								&nbsp; &nbsp;${story.memo }
		               							</p> --%>
		               						</c:if>
		               					</c:forEach>
	               					</ul>
	               					<a data-role="button" href="../addstory/${bean.daynum }/${bean.tripdate }">글 쓰기</a>
	               				</div>
	               				
	               			</div>
	               		</div><br/>
	               	</c:forEach>
	            </div>
				<div id="mytrip-maps">
	               	<h3>지도</h3>
	               	<c:forEach items="${tripDetail}" var="detail">
		            	<h4>${detail.mapx } : ${detail.mapy }</h4>
		            </c:forEach>
	            </div>
            </div>
            
            <script type="text/javascript">
            	$('#nav-story').click(function() {
            		$('#mytrip-maps').hide();
            		$('#mytrip-story').show();
            	});
				$('#nav-maps').click(function() {
					$('#mytrip-story').hide();
            		$('#mytrip-maps').show();
            	});
            </script>
            
            <div data-role='footer' data-position='fixed'>
                <!-- data-role='navbar'는 앱스럽게 탭메뉴를 구성할 수 있도록 해준다. 가로 최대:5개 -->
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