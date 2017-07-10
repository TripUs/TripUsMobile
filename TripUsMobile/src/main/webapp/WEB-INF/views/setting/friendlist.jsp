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
	    <script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=27fe7a62295f8cc3e56a54958afc32e5&libraries=services"></script>
        <script type="text/javascript" charset="utf-8" src="resources/js/cordova.js"></script>
        <script type="text/javascript" charset="utf-8" src="resources/js/cordova_plugins.js"></script>
        <script type="text/javascript" charset="utf-8" src="resources/js/geolocation.js"></script>
        <title>Document</title>
    </head>
    <body>
        
        <div data-role='page' style="background-color: white;">
            
            <!-- 영어 -->
        	<c:if test="${sessionScope.userInfo.lang eq 1 }">
        		<c:set value="View friends list" var="friends"></c:set>
        		<c:set value="Add to friends" var="addfriend"></c:set>
        		<c:set value="Friend request waiting list" var="waitinglist"></c:set>
        		<c:set value="Friend request" var="friendrequest"></c:set>
        		<c:set value="Waiting for acceptance" var="waitingaccep"></c:set>
        		<c:set value="Delete friend" var="delfriend"></c:set>
        		<c:set value="Friends list" var="friendslist"></c:set>
        		<c:set value="Would you like to add a friend?" var="addfriendqen"></c:set>
        		<c:set value="Are you sure you want to delete this friend?" var="delfriendqen"></c:set>
        		<c:set value="ADD" var="add"></c:set>
        		<c:set value="DELETE" var="delete"></c:set>
        		<c:set value="CANCEL" var="cancel"></c:set>
        		<c:set value="AJAX Communication failure" var="ajaxfailure"></c:set>
        	</c:if>
            <!-- 한국어 -->
        	<c:if test="${sessionScope.userInfo.lang ne 1 }">
        		<c:set value="친구 목록" var="friends"></c:set>
        		<c:set value="친구 추가" var="addfriend"></c:set>
        		<c:set value="친구요청 대기목록" var="waitinglist"></c:set>
        		<c:set value="친구 요청" var="friendrequest"></c:set>
        		<c:set value="수락 대기중" var="waitingaccep"></c:set>
        		<c:set value="친구 삭제" var="delfriend"></c:set>
        		<c:set value="친구 목록" var="friendslist"></c:set>
        		<c:set value="친구를 추가하시겠습니까?" var="addfriendqen"></c:set>
        		<c:set value="친구를 삭제하시겠습니까?" var="delfriendqen"></c:set>
        		<c:set value="추가" var="add"></c:set>
        		<c:set value="삭제" var="delete"></c:set>
        		<c:set value="취소" var="cancel"></c:set>
        		<c:set value="AJAX 통신실패" var="ajaxfailure"></c:set>
        	</c:if>
        	
            <div data-role='header' style="background-color: #F05562;">
                <a href="setting" class="ui-btn ui-shadow ui-icon-mybackicon ui-btn-icon-left ui-btn-icon-notext ui-corner-all">Back</a>
                <h1 style="color: white;">${friends }</h1>
                <a href="addfriend" class="ui-btn ui-icon-myplusicon ui-btn-icon-notext ui-corner-all">${addfriend }</a>
            </div>
            <div data-role='content' style="padding-left: 10px; padding-right: 10px;">
            	<br/>
            	<div class="ui-conner-all">
					<div id="friend-stay-num" class="ui-bar ui-bar-a" style="background-color: #F05562; border: 2px solid #F05562; border-radius: 10px;">
						<h3 style="color: white;">${waitinglist } (${fn:length(waitList)})</h3>
					</div>
					<div id="friend-search-result" class='ui-body ui-body-a' style="border: none;">
		            	<ul id="friend-stay-listview" data-role="listview" data-inset="true">
		                	<c:forEach items="${waitList }" var="bean">
		                		<c:set value="staylist_${bean.friendid }" var="stlistid"></c:set>
		                		<li class="cate-stay" id="${stlistid }" data-icon="delete">
			                		<a href="#"><img src="${bean.friendprofile }"/>
			                		<h2>${bean.friendname } (${bean.friendnicname })</h2>
			                		<c:if test="${bean.flag eq 1 }"><p> - ${friendrequest }</p></c:if>
				                	<c:if test="${bean.flag eq 0 }"><p> - ${waitingaccep }</p></c:if>
			                		</a>
			                		<c:if test="${bean.flag eq 1 }">
				                		<a href="#add-friend" onclick="addfriend('${bean.friendid }')" class="ui-icon-myplusicon" data-rel="popup" data-position-to="window" data-transition="pop">${addfriend }</a>
			                		</c:if>
			                		<c:if test="${bean.flag eq 0 }">
				                		<a href="#delete-friend" onclick="deletefriend('${bean.friendid }')" class="ui-icon-mydelicon" data-rel="popup" data-position-to="window" data-transition="pop">${delfriend }</a>
			                		</c:if>
			                	</li>
		                	</c:forEach>
		                </ul>
					</div>
				</div>
                
                <div class="ui-conner-all">
					<div id="friend-list-num" class="ui-bar ui-bar-a" style="background-color: #F05562; border: 2px solid #F05562; border-radius: 10px;">
						<h3 style="color: white;">${friendslist } (${fn:length(friendList)})</h3>
					</div>
					<div id="friend-search-result" class='ui-body ui-body-a' style="border: none;">
		            	<ul id="friend-list-listview" data-role="listview" data-filter="true" data-filter-placeholder="Search Name" data-inset="true">
		                	<c:forEach items="${friendList }" var="bean">
		                		<c:set value="staylist_${bean.friendid }" var="listid"></c:set>
		                		<li id="${listid }" class="cate-list" data-icon="delete">
			                		<a href="#"><img src="${bean.friendprofile }"/>
			                		<h2>${bean.friendname } (${bean.friendnicname })</h2>
			                		<p>${bean.friendemail }</p></a>
			                		<a href="#delete-friend" onclick="deletefriend('${bean.friendid }')" class="ui-icon-mydelicon" data-rel="popup" data-position-to="window" data-transition="pop">${delfriend }</a>
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
																	+ " aria-owns='delete-friend' aria-expanded='false' class='ui-btn ui-btn-icon-notext ui-icon-mydelicon' title='${delfriend}'>${delfriend}</a>"	    				
				            										+ "</li>");
				            	$('#friend-list-listview').listview('refresh');
				            	var staynum = $('.cate-stay').length;
				            	var listnum = $('.cate-list').length;
				            	console.log(staynum + " : " + listnum);
				            	$('#friend-stay-num h3').html('${waitinglist} (' + staynum + ')');
				            	$('#friend-list-num h3').html('${friendslist} (' + listnum + ')');
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
				            	$('#friend-stay-num h3').html('${waitinglist} (' + staynum + ')');
				            	$('#friend-list-num h3').html('${friendslist} (' + listnum + ')');
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
                		$('#add-friend').html("<h3>${addfriend}</h3>");
                		$('#add-friend').append("<p>${addfriendqen}</p>");
                		$('#add-friend').append("<a id='add-friend-list' onclick=addfriend_list('" + data + "') href='#' data-ajax='false' class='ui-shadow ui-btn ui-corner-all ui-btn-b ui-icon-check ui-btn-icon-plus ui-btn-inline ui-mini'>${add}</a>");
                		$('#add-friend').append("<a href='#' onclick=delfriend_list('" + data + "') class='ui-shadow ui-btn ui-corner-all ui-btn-inline ui-mini'>${cancel}</a>");
                		$('#add-friend').show();
                	};
                	
                	var deletefriend = function(data) {
                		$('#delete-friend').html("<h3>${delfriend}</h3>");
                		$('#delete-friend').append("<p>${delfriendqen}</p>");
                		$('#delete-friend').append("<a id='del-friend-list' href='#' onclick=delfriend_list('" + data + "') data-ajax='false' class='ui-shadow ui-btn ui-corner-all ui-btn-b ui-icon-check ui-btn-icon-delete ui-btn-inline ui-mini'>${delete}</a>");
                		$('#delete-friend').append("<a href='#' onclick=hidepop() class='ui-shadow ui-btn ui-corner-all ui-btn-inline ui-mini'>${cancel}</a>");
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