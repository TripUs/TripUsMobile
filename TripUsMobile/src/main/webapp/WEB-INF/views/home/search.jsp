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
        <div id="search" data-role='page' style="background-color: white;">
            <div data-role='header' data-position='fixed' style="background-color: #F05562; color: white;">
            	<a href="#" data-rel="back" class="ui-btn ui-shadow ui-icon-mybackicon ui-btn-icon-left ui-btn-icon-notext ui-corner-all">Back</a>
                <h1>TripUs 여행지 검색</h1>
            </div>
        	
            <div data-role='content' style="background-color: white;">
            	<div style="padding-left: 10px; padding-right: 10px;">
		            <input type="text" id="input-keyword" name="keyword" placeholder="어디로 떠나고 싶으신가요?"/>
	            	<fieldset data-role="controlgroup" data-type="horizontal" data-mini="true" style="width: 100%;">
	               		<input type="radio" name="fillter" id="all-fillter" value="0" checked="checked">
	               		<label for="all-fillter"><img src="resources/imgs/icon/all3.png" style="widows: 30px; height: 20px;"/></label>
	               		<input type="radio" name="fillter" id="moonhwa" value="12">
	               		<label for="moonhwa"><img src="resources/imgs/icon/munhwa5.png" style="widows: 30px; height: 20px;"/></label>
	               		<input type="radio" name="fillter" id="leports" value="28">
	               		<label for="leports"><img src="resources/imgs/icon/leports.png" style="widows: 30px; height: 20px;"/></label>
	               		<input type="radio" name="fillter" id="sikdang" value="39">
	               		<label for="sikdang"><img src="resources/imgs/icon/sikdang.png" style="widows: 30px; height: 20px;"/></label>
	               		<input type="radio" name="fillter" id="hotel" value="32">
	               		<label for="hotel"><img src="resources/imgs/icon/hotel.png" style="widows: 30px; height: 20px;"/></label>
	               		<input type="radio" name="fillter" id="course" value="25">
	               		<label for="course"><img src="resources/imgs/icon/course5.png" style="widows: 30px; height: 20px;"/></label>
	               	</fieldset>
	               	<div data-role="controlgroup" >
			            <button id="search-keyword" class="search-page-btn" style="border: 1px solid #F05562; background-color: white; color: #F05562;">검색</button>
		            	<button onclick="getPosition()" id="search-gps" class="search-page-btn" style="border: 1px solid #F05562; background-color: white; color: #F05562;">주변 검색</button>
	            	</div>
            	
            		<ul id="search-gps-list" data-role='listview' data-inset='true'></ul>
	            	<ul id="search-area-list" data-role='listview' data-inset='true'></ul>
	            	<ul id="search-addr-list" data-role='listview' data-inset='true'></ul>
	            	<ul id="search-keyword-list" data-role='listview' data-inset='true'></ul>
            	</div>
            </div>
            
            <script type="text/javascript">
            	var page = 1;
            	var lat;
            	var lng;
            	
            	function getPosition() {
            		var options = {
            	    	enableHighAccuracy: true,
            	      	maximumAge: 3600000
            	   	}
            		
            	  	var watchID = navigator.geolocation.getCurrentPosition(onSuccess, onError, options);
            	   	function onSuccess(position) {
            	   		var contenttypeid = $(":input:radio[name=fillter]:checked").val();
            	    	lat = position.coords.latitude;
            	    	lng = position.coords.longitude;
            	   		$.ajax({ 
				        	url: "searchGps",
				            type:'POST', 					 
				            data:{ 
				            	lat: lat,
				            	lng: lng,
				            	page: page,
				            	contenttypeid: contenttypeid
				            }, 
				            success : function(data){
				            	$('#search-area-list').remove();
				            	$('#search-keyword-list').remove();
				            	if(data[0] != null) {
				            		$('#search-gps-list').html("<li data-role='list-divider' style='color: white; background-color: #F05562; border: none; border-top-left-radius: 10px; border-top-right-radius: 10px;'>주변 검색결과</li>");
				            		$('#search-gps-list').append("<li class='ui-li-has-thumb ui-first-child ui-last-child'>"
	            							+ "<a href='detail/" + data[0][0]['contentid'] + "' style='background-color: white;'>"
		            						+ "<img src='" + data[0][0]['firstimage'] + "' style='width:100%; height:100%;'/>"
		            						+ "<h2>" + data[0][0]['title'] + "</h2>"
		            						+ "<p>반경 : " +  data[0][0]['dist'] + "m</p>");
				            		
				            		for(var i=1; i<data[0].length; i++) {
					            		$('#search-gps-list').append("<li class='ui-li-has-thumb ui-first-child ui-last-child'>"
		            							+ "<a href='detail/" + data[0][i]['contentid'] + "' style='background-color: white;'>"
			            						+ "<img src='" + data[0][i]['firstimage'] + "' style='width:100%; height:100%;'/>"
			            						+ "<h2>" + data[0][i]['title'] + "</h2>"
			            						+ "<p>반경 : " +  data[0][i]['dist'] + "m</p>");
					            		$('#search-gps-list').listview('refresh');
					            	}
				            		if(data[2] < data[1] ) {
				            			page++;
				            			$('#search-gps-list').append('<li id="gpslastbtn" class="ui-last-child"><a href="#" class="ui-btn ui-btn-icon-right ui-icon-carat-d"'
				            					+ 'onclick="addlist(\'' + contenttypeid + '\')" style="color: white; background-color: #F05562;">더보기</a></li>');
				            			$('#search-gps-list').listview('refresh');
				            		}
				            	} else {
				            		alert("검색결과 없음");
				            	}
				            }, 
				            error : function(){ 
				            	alert('AJAX 통신 실패'); 
				            } 
				        });
            	    	
            	   	};
            	   	function onError(error) {
            	    	alert('code: ' + error.code + '\n' + 'message: ' + error.message + '\n');
            	   	}
            	}
            	
            	function addlist(contenttypeid) {
            		$.ajax({ 
			        	url: "searchGps",
			            type:'POST', 					 
			            data:{ 
			            	lat: lat,
			            	lng: lng,
			            	page: page,
			            	contenttypeid: contenttypeid
			            }, 
			            success : function(data){
			            	$('#gpslastbtn').remove();
			            	for(var i=0; i<data[0].length; i++) {
				            	$('#search-gps-list').append("<li class='ui-li-has-thumb ui-first-child ui-last-child'>"
	            						+ "<a href='detail/" + data[0][i]['contentid'] + "' style='background-color: white;'>"
		            					+ "<img src='" + data[0][i]['firstimage'] + "' style='width:100%; height:100%;'/>"
		            					+ "<h2>" + data[0][i]['title'] + "</h2>"
		            					+ "<p>반경 : " +  data[0][i]['dist'] + "m</p>");
				            	$('#search-gps-list').listview('refresh');
				            }
			            	if(data[2] < data[1] ) {
			            		page++;
			            		$('#search-gps-list').append('<li id="gpslastbtn" class="ui-last-child"><a href="#" class="ui-btn ui-btn-icon-right ui-icon-carat-d"'
			            				+ 'onclick="addlist(\'' + contenttypeid + '\')" style="color: white; background-color: #F05562;">더보기</a></li>');
			            		$('#search-gps-list').listview('refresh');
			            	}
			            }, 
			            error : function(){ 
			            	alert('AJAX 통신 실패'); 
			            } 
			        });
            	}
        	</script>
            
            <script type="text/javascript">
	            var keyword;
            	var pageCnt;
	            var curPage = 1;
	            
	            $('#search-keyword').click(function() {
	            	var contenttypeid = $(":input:radio[name=fillter]:checked").val();
        	    	
	            	if($('#input-keyword').val()=='') {
	            		alert("키워드를 입력하세요.");
	            	} else {
						$.ajax({ 
				        	url: "search",
				            type:'POST', 					 
				            data:{ 
				            	keyword: $('#input-keyword').val(),
				            	curPage: curPage,
				            	contenttypeid: contenttypeid
				            }, 
				            success : function(data){
				            	// index 0 : 지역검색결과
				            	// index 1 : 키워드 결과
				            	// index 2 : 전체 페이지수
				            	// index 3 : 키워드
				            	pageCnt = data[2];
				            	keyword = data[3];
				            	$('#search-gps-list').remove();
				            	if(data[0].length != 0) {
				            		var index = 1;
				            		if(data[0][0]['sigungucode'] == 0) {
				            			$('#search-area-list').html("<li data-role='list-divider' style='color: white; background-color: #F05562; border: none; border-top-left-radius: 10px; border-top-right-radius: 10px;'>지역 검색결과</li>");
					            		$('#search-area-list').append("<li class='ui-li-has-thumb ui-first-child ui-last-child'>"
	            							+ "<a href='areaInfo/" + data[0][0]['areacode'] + "' style='background-color: white;'>"
	            							+ "<img src='" + data[0][0]['imgname'] + "' style='width:100%; height: 100%;'/>"
	            							+ "<h2>" + data[0][0]['name'] + "</h2><span class='ui-li-count'><span style='color:red;'>♥&nbsp;</span>" + data[0][0]['likeflag'] + "</span></a></li>");
				            		} else {
				            			index = 0;
				            		} 
				            		$('#search-addr-list').html("<li data-role='list-divider' style='color: white; background-color: #F05562; border: none; border-top-left-radius: 10px; border-top-right-radius: 10px;'>지명 검색결과 > 지명(주소지) 검색결과 보기</li>");
				            		for(var i=index; i<data[0].length; i++) {
				            			$('#search-addr-list').append("<li class='ui-first-child ui-last-child'>"
				            				+ "<a class='ui-btn ui-btn-icon-right ui-icon-carat-d' href='basicInfo/" + data[0][i]['areacode'] + "/" + data[0][i]['sigungucode'] + "' style='background-color: white;'>"
					            			+ "<h2>" + data[0][i]['name'] + "</h2></a></li>");
					            	}	
					            	$('#search-area-list').listview('refresh');
					            	$('#search-addr-list').listview('refresh');
					            }

				            	if(data[1] != null) { 
				            		$('#search-keyword-list').html("<li data-role='list-divider' style='color: white; background-color: #F05562; border: none; border-top-left-radius: 10px; border-top-right-radius: 10px;'>키워드 검색결과</li>");
					            	for(var i=0; i<data[1].length; i++) {
					            		$('#search-keyword-list').append("<li class='ui-li-has-thumb ui-first-child ui-last-child'>"
					            							+ "<a href='detail/" + data[1][i]['contentid'] + "' style='background-color: white;'>"
						            						+ "<img src='" + data[1][i]['firstimage'] + "' style='width:100%; height:100%;'/>"
						            						+ "<h2>" + data[1][i]['title'] + "</h2>"
						            						+ "<p>" + data[1][i]['addr1'] + "</p></a></li>");
					            	}
					            	if(curPage < pageCnt) {
					            		curPage++;
					            		$('#search-keyword-list').append('<li id="keywordlast" class="ui-last-child"><a href="#" class="ui-btn ui-btn-icon-right ui-icon-carat-d" '
				            					+ 'onclick="addsearchlist(\'' + contenttypeid + '\')" style="color: white; background-color: #F05562;">더보기</a></li>');
					             	}
					            	$('#search-keyword-list').listview('refresh');
				            	} else {
				            		alert("키워드 검색결과 없음");
				            	}
				            }, 
				            error : function(){ 
				            	alert('AJAX 통신 실패'); 
				            } 
				        });
	            	}
				});
	            
	            function addsearchlist(contenttypeid) {
					$.ajax({ 
			        	url: "search",
			            type:'POST', 					 
			            data:{ 
			            	keyword: keyword,
			            	curPage: curPage,
			            	contenttypeid: contenttypeid
			            }, 
			            success : function(data){
			            	$('#keywordlast').remove();
			            	for(var i=0; i<data[1].length; i++) {
			            		$('#search-keyword-list').append("<li class='ui-li-has-thumb ui-first-child ui-last-child'>"
			            							+ "<a href='detail/" + data[1][i]['contentid'] + "' style='background-color: white;'>"
				            						+ "<img src='" + data[1][i]['firstimage'] + "' style='width:100%; height:100%;'/>"
				            						+ "<h2>" + data[1][i]['title'] + "</h2>"
				            						+ "<p>" + data[1][i]['addr1'] + "</p></a></li>");
			            	}
			            	if(curPage < pageCnt) {
			            		curPage++;
			            		$('#search-keyword-list').append('<li id="keywordlast" class="ui-last-child"><a href="#" class="ui-btn ui-btn-icon-right ui-icon-carat-d" '
		            					+ 'onclick="addsearchlist(\'' + contenttypeid + '\')" style="color: white; background-color: #F05562;">더보기</a></li>');
			             	}
			            	$('#search-keyword-list').listview('refresh');
			            }, 
			            error : function(){ 
			            	alert('AJAX 통신 실패'); 
			            } 
			        });
				};
            </script>
            
            <div data-role='footer' data-position='fixed' data-theme="c">
                <div data-role='navbar'>
                    <ul>
                        <li>
                            <a data-icon='home' class="ui-btn-active ui-state-persist" href="../tripus/">Home</a>
                        </li>
                        <li>
                            <a data-icon='calendar' href="mytrip">내 여행</a>
                        </li>
                        <li>
                            <a data-icon='edit' href="tripnote">여행노트</a>
                        </li>
                        <li>
                            <a data-icon='gear' href="setting">설정</a>
                        </li>
                    </ul>
                </div>
            </div><!-- end footer -->
        </div><!-- end page -->
    </body>
</html>