<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="resources/css/jquery.mobile-1.4.5.min.css"/>
        <link rel="stylesheet" href="resources/css/jquery.mobile.theme-1.4.5.min.css"/>
        <link rel="stylesheet" href="resources/css/themec.min.css"/>
        <link rel="stylesheet" href="resources/css/slick.css"/>
		<link rel="stylesheet" href="resources/css/slick-theme.css"/>
        <link rel="stylesheet" href="resources/css/tripus.css">
        <script src="http://code.jquery.com/jquery-1.12.4.min.js"
                  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
                  crossorigin="anonymous"></script>
        <script type="text/javascript" src="resources/js/jquery-migrate-1.4.1.min.js"></script>
        <script type="text/javascript" src="resources/js/jquery.mobile-1.4.5.min.js"></script>
        <script type="text/javascript" src="resources/js/jquery.form.min.js"></script>
        <script type="text/javascript" src="resources/js/slick.min.js"></script>
        <script src="http://itemslide.github.io/dist/itemslide.min.js"></script>
        <script type="text/javascript" src="resources/js/tripus.js"></script>
	    <script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=0f2e3ff280f258cf4dc5f49a68d055b8&libraries=services"></script>
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
            <div data-role='header' style="background-color: #F05562;">
                <a href="setting" class="ui-btn ui-shadow ui-icon-mybackicon ui-btn-icon-left ui-btn-icon-notext ui-corner-all">Back</a>
                <h1 style="color: white;">친구 목록</h1>
                <a href="addfriend" class="ui-btn ui-icon-plus ui-btn-icon-notext ui-corner-all">친구 추가</a>
            </div>
            <div data-role='content' style="padding-left: 10px; padding-right: 10px;">
            	<br/>
            	<div class="ui-conner-all">
					<div id="friend-stay-num" class="ui-bar ui-bar-a" style="background-color: #F05562; border: 2px solid #F05562; border-radius: 10px;">
						<h3 style="color: white;">친구요청 대기 목록 (${fn:length(waitList)})</h3>
					</div>
					<div id="friend-search-result" class='ui-body ui-body-a' style="border: none;">
		            	<ul id="friend-stay-listview" data-role="listview" data-inset="true">
		                	<c:forEach items="${waitList }" var="bean">
		                		<c:set value="staylist_${bean.friendid }" var="stlistid"></c:set>
		                		<li class="cate-stay" id="${stlistid }" data-icon="delete">
			                		<a href="#"><img src="${bean.friendprofile }"/>
			                		<h2>${bean.friendname } (${bean.friendnicname })</h2>
			                		<c:if test="${bean.flag eq 1 }"><p> -친구 요청</p></c:if>
				                	<c:if test="${bean.flag eq 0 }"><p> - 수락 대기중..</p></c:if>
			                		</a>
			                		<c:if test="${bean.flag eq 1 }">
				                		<a href="#add-friend" onclick="addfriend('${bean.friendid }')" data-icon="plus" data-rel="popup" data-position-to="window" data-transition="pop">친구 추가</a>
			                		</c:if>
			                		<c:if test="${bean.flag eq 0 }">
				                		<a href="#delete-friend" onclick="deletefriend('${bean.friendid }')" data-rel="popup" data-position-to="window" data-transition="pop">친구 삭제</a>
			                		</c:if>
			                	</li>
		                	</c:forEach>
		                </ul>
					</div>
				</div>
                
                <div class="ui-conner-all">
					<div id="friend-list-num" class="ui-bar ui-bar-a" style="background-color: #F05562; border: 2px solid #F05562; border-radius: 10px;">
						<h3 style="color: white;">친구 목록 (${fn:length(friendList)})</h3>
					</div>
					<div id="friend-search-result" class='ui-body ui-body-a' style="border: none;">
		            	<ul id="friend-list-listview" data-role="listview" data-filter="true" data-filter-placeholder="Search Name" data-inset="true">
		                	<c:forEach items="${friendList }" var="bean">
		                		<c:set value="staylist_${bean.friendid }" var="listid"></c:set>
		                		<li id="${listid }" class="cate-list" data-icon="delete">
			                		<a href="#"><img src="${bean.friendprofile }"/>
			                		<h2>${bean.friendname } (${bean.friendnicname })</h2>
			                		<p>${bean.friendemail }</p></a>
			                		<a href="#delete-friend" onclick="deletefriend('${bean.friendid }')" data-rel="popup" data-position-to="window" data-transition="pop">친구 삭제</a>
			                	</li>
		                   	</c:forEach>
		                </ul>
		            </div>
				</div>
                
                
                <script type="text/javascript">
	                function addfriend_list(data) {
	                	$('#add-friend').hide();
						var url = "updatefriend/" + data;
						var removelist = "#staylist_" + data;
						$.ajax({ 
				        	url: url,
				            type:'POST', 					 
				            data:{ 
				            	friendid: data
				            }, 
				            success : function(data2){
				            	$(removelist).remove();
				            	$('#friend-stay-listview').listview('refresh');
				            	$('#friend-list-listview').append("<li id='staylist_" + data2['id'] + "' class='cate-list ui-li-has-thumb ui-first-child ui-last-child' data-icon='delete'>"
				            										+ "<a href='#'>"
					            									+ "<img src='" + data2['profile'] + "' style='width:100%; height:100%;'/>"
					            									+ "<h2>" + data2['name'] + " (" + data2['nicname'] + ")</h2>"
					            									+ "<p>" + data2['email'] + "</p></a>"
																	+ "<a href='#delete-friend' onclick=deletefriend('" + data2['id'] + "')" 
																	+ " data-rel='popup' data-position-to='window' data-transition='pop' aria-haspopup='true'"
																	+ " aria-owns='delete-friend' aria-expanded='false' class='ui-btn ui-btn-icon-notext ui-icon-plus' title='친구 추가'>친구 추가</a>"	    				
				            										+ "</li>");
				            	$('#friend-list-listview').listview('refresh');
				            	var staynum = $('.cate-stay').length;
				            	var listnum = $('.cate-list').length;
				            	console.log(staynum + " : " + listnum);
				            	$('#friend-stay-num h3').html('친구요청 대기 목록 (' + staynum + ')');
				            	$('#friend-list-num h3').html('친구 목록 (' + listnum + ')');
				            }, 
				            error : function(){ 
				            	alert('AJAX 통신 실패'); 
				            } 
				        });
					};
					
					function delfriend_list(data) {
	                	$('#delete-friend').hide();
						var url = "deletefriend/" + data;
						var removelist = "#staylist_" + data;
						$.ajax({ 
				        	url: url,
				            type:'POST', 					 
				            data:{ 
				            	friendid: data
				            }, 
				            success : function(data2){
				            	$(removelist).remove();
				            	$('#friend-stay-listview').listview('refresh');
				            	$('#friend-list-listview').listview('refresh');
				            	var staynum = $('.cate-stay').length;
				            	var listnum = $('.cate-list').length;
				            	console.log(staynum + " : " + listnum);
				            	$('#friend-stay-num h3').html('친구요청 대기 목록 (' + staynum + ')');
				            	$('#friend-list-num h3').html('친구 목록 (' + listnum + ')');
				            }, 
				            error : function(){ 
				            	alert('AJAX 통신 실패'); 
				            } 
				        });
					};
                
					function hidepop() {
                		$('#delete-friend').hide();
                	};
                	
                	var addfriend = function(data) {
                		$('#add-friend').html("<h3>친구 추가</h3>");
                		$('#add-friend').append("<p>친구를 추가하시겠습니까?</p>");
                		$('#add-friend').append("<a id='add-friend-list' onclick=addfriend_list('" + data + "') href='#' data-ajax='false' class='ui-shadow ui-btn ui-corner-all ui-btn-b ui-icon-check ui-btn-icon-plus ui-btn-inline ui-mini'>추가</a>");
                		$('#add-friend').append("<a href='#' onclick=delfriend_list('" + data + "') class='ui-shadow ui-btn ui-corner-all ui-btn-inline ui-mini'>삭제</a>");
                		$('#add-friend').show();
                	};
                	
                	var deletefriend = function(data) {
                		$('#delete-friend').html("<h3>친구 삭제</h3>");
                		$('#delete-friend').append("<p>친구를 삭제하시겠습니까?</p>");
                		$('#delete-friend').append("<a id='del-friend-list' href='#' onclick=delfriend_list('" + data + "') data-ajax='false' class='ui-shadow ui-btn ui-corner-all ui-btn-b ui-icon-check ui-btn-icon-delete ui-btn-inline ui-mini'>삭제</a>");
                		$('#delete-friend').append("<a href='#' onclick=hidepop() class='ui-shadow ui-btn ui-corner-all ui-btn-inline ui-mini'>취소</a>");
                		$('#delete-friend').show();
                	};
                </script>
                <div data-role="popup" id="add-friend"></div>
                <div data-role="popup" id="delete-friend"></div>
            </div>
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