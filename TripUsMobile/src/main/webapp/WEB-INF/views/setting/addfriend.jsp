<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        		<c:set value="Add to friends" var="addfriend"></c:set>
        		<c:set value="Please enter your friend's name" var="entername"></c:set>
        		<c:set value="Find friends" var="findfriends"></c:set>
        		<c:set value="Search Results" var="searchresults"></c:set>
        		<c:set value="Persons" var="person"></c:set>
        		<c:set value="AJAX Communication failure" var="ajaxfailure"></c:set>
        		<c:set value="Are you sure you want to add?" var="addsureqen"></c:set>
        		<c:set value="ADD" var="add"></c:set>
        		<c:set value="CANCEL" var="cancel"></c:set>
        	</c:if>
            <!-- 한국어 -->
        	<c:if test="${sessionScope.userInfo.lang ne 1 }">
        		<c:set value="친구 추가" var="addfriend"></c:set>
        		<c:set value="친구 이름을 입력하세요" var="entername"></c:set>
        		<c:set value="친구 찾기" var="findfriends"></c:set>
        		<c:set value="검색 결과" var="searchresults"></c:set>
        		<c:set value="명" var="person"></c:set>		
        		<c:set value="AJAX 통신실패" var="ajaxfailure"></c:set>
        		<c:set value="님을 추가하시겠습니까?" var="addsureqen"></c:set>
        		<c:set value="추가" var="add"></c:set>
        		<c:set value="취소" var="cancel"></c:set>
        	</c:if>
        	
            <div data-role='header' style="background-color: #F05562;">
                <a href="#" data-rel="back" class="ui-btn ui-shadow ui-icon-mybackicon ui-btn-icon-left ui-btn-icon-notext ui-corner-all">Back</a>
                <h1 style="color: white;">${addfriend }</h1>
            </div>
            <div data-role='content' style="padding-left: 10px; padding-right: 10px; background-color: white;">
				<div class="ui-conner-all">
					<div class="ui-body ui-body-a" style="border: none;">
						<input type="search" name="friendname" id="friendname" data-mini="true" placeholder="${entername }"/>
						<button id="search-friend">${findfriends }</button>
					</div>
				</div>
				
				<div class="ui-conner-all">
					<div id="frind-search-header" class="ui-bar ui-bar-a" style="background-color: #F05562; border: 2px solid #F05562; border-radius: 10px;">
						<h3 style="color: white;">${searchresults }</h3>
					</div>
					<div id="friend-search-result" class='ui-body ui-body-a' style="border: none;">
						<ul id="friend-listview" data-role='listview' data-inset='true'></ul>
					</div>
				</div>
				
				<div data-role="popup" id="add-friend-pop"></div>
				
				<script type="text/javascript">
					$('#search-friend').click(function() {
						$.ajax({ 
				        	url: "searchfriend",
				            type:'POST', 					 
				            data:{ 
				            	friendname: $('#friendname').val()
				            }, 
				            success : function(data){
				            	$('#frind-search-header').html("<h3 style='color: white;'>${searchresults} : " + data.length + "${person}</h3>");
				            	for(var i=0; i<data.length; i++) { //  class='ui-btn ui-btn-icon-right ui-icon-plus'
				            		$('#friend-listview').append("<li class='ui-li-has-thumb ui-first-child ui-last-child' data-icon='plus'>"
				            										+ "<a href='#'>"
					            									+ "<img src='" + data[i]['profile'] + "' style='width:100%; height:100%;'/>"
					            									+ "<h2>" + data[i]['name'] + " (" + data[i]['nicname'] + ")</h2>"
					            									+ "<p>" + data[i]['email'] + "</p></a>"
																	+ "<a href='#add-friend-pop' onclick=addfriend_search('" + data[i]['id'] + "')" 
																	+ " data-rel='popup' data-position-to='window' data-transition='pop' aria-haspopup='true'"
																	+ " aria-owns='add-friend-pop' aria-expanded='false' class='ui-btn ui-btn-icon-notext ui-icon-plus' title='${addfriend}'>${addfriend}</a>"	    				
				            										+ "</li>");
				            	}
				            	$('#friend-listview').listview('refresh');
				            }, 
				            error : function(){ 
				            	alert('AJAX 통신 실패'); 
				            } 
				        });
					});
					
					function addfriend_search(data) {
	            		$('#add-friend-pop').html("<h3>${addfriend}</h3>");
	            		$('#add-friend-pop').append("<p>" + data + "${addsureqen}</p>");
	            		$('#add-friend-pop').append("<a id='add-friend-btn' data-ajax='false' href='addfriend/" + data + "' class='ui-shadow ui-btn ui-corner-all ui-btn-b ui-icon-check ui-btn-icon-plus ui-btn-inline ui-mini'>${add}</a>");
	            		$('#add-friend-pop').append("<a href='#' data-rel='back' class='ui-shadow ui-btn ui-corner-all ui-btn-inline ui-mini'>${cancel}</a>");
	            	}
				</script>
				
			</div><!-- end content -->
		</div><!-- end page -->
	</body>
</html>