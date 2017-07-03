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
        <div id="search" data-role='page' style="background-color: white;">
            <div data-role='header' data-position='fixed' style="background-color: #F05562; color: white;">
            	<a href="#" data-rel="back" class="ui-btn ui-shadow ui-icon-arrow-l ui-btn-icon-left ui-btn-icon-notext ui-corner-all">Back</a>
                <h1>TripUs 여행지 검색</h1>
            </div>
        	
            <div data-role='content' style="background-color: white;">
            	<div style="padding-left: 10px; padding-right: 10px;">
		            	<input type="text" id="input-keyword" name="keyword" placeholder="어디로 떠나고 싶으신가요?"/>
	            	<div data-role="controlgroup" data-type="horizontal" style="width: 100%;">
			            <button id="search-keyword" class="search-page-btn" style="box-sizing: border-box; display: inline-block; width: 50%; border: 2px solid #F05562; background-color: white; color: #F05562;">검색</button>
		            	<button id="search-gps" class="search-page-btn" style="box-sizing: border-box; display: inline-block; width: 50%; border: 2px solid #F05562; border-left: none; background-color: white; color: #F05562;">주변 검색</button>
	            	</div>
            	
	            	<ul id="search-area-list" data-role='listview' data-inset='true'></ul>
	            	<ul id="search-keyword-list" data-role='listview' data-inset='true'></ul>
            	</div>
            </div>
            
            <script type="text/javascript">
	            var keyword;
            	var pageCnt;
	            var curPage;
	            
	            $('#search-keyword').click(function() {
	            	if($('#input-keyword').val()=='') {
	            		alert("키워드를 입력하세요.");
	            	} else {
						$.ajax({ 
				        	url: "search",
				            type:'POST', 					 
				            data:{ 
				            	keyword: $('#input-keyword').val()
				            }, 
				            success : function(data){
				            	keyword = data[4];
				            	pageCnt = data[2];
				            	curPage = data[3];
				            	
				            	if(data[0].length != 0) $('#search-area-list').html("<li data-role='list-divider' style='color: white; background-color: #F05562; border: none; border-top-left-radius: 10px; border-top-right-radius: 10px;'>지역 검색결과</li>");
				            	for(var i=0; i<data[0].length; i++) {
				            		$('#search-area-list').append("<li class='ui-li-has-thumb ui-first-child ui-last-child'>"
				            							+ "<a href='basicInfo?areacode=" + data[0][i]['areacode'] + "&sigungucode=" + data[0][i]['sigungucode'] + "' style='background-color: white;'>"
					            						+ "<h2>" + data[0][i]['name'] + "</h2>"
					            						+ "<span class='ui-li-count'>11</span></a></li>");
				            	}
				            	if(data[1].length != 0) $('#search-keyword-list').html("<li data-role='list-divider' style='color: white; background-color: #F05562; border: none; border-top-left-radius: 10px; border-top-right-radius: 10px;'>키워드 검색결과</li>");
				            	for(var i=0; i<data[1].length; i++) {
				            		$('#search-keyword-list').append("<li class='ui-li-has-thumb ui-first-child ui-last-child'>"
				            							+ "<a href='detail/" + data[1][i]['contentid'] + "' style='background-color: white;'>"
					            						+ "<img src='" + data[1][i]['firstimage'] + "' style='width:100%; height:100%;'/>"
					            						+ "<h2>" + data[1][i]['title'] + "</h2>"
					            						+ "<p>" + data[1][i]['addr1'] + "</p>"
					            						+ "<span class='ui-li-count'>11</span></a></li>");
				            	}
				            	if(curPage < pageCnt) {
				            		$('#search-keyword-list').append("<li id='addsearch-list' class='ui-li-has-thumb ui-first-child ui-last-child'>"
														+ "<a href='#' onclick='addsearchlist()' style='background-color: #F05562;'>"
														+ "<h2 style='color: white;'>검색결과 더보기</h2></a></li>");
				            	}
				            	$('#search-area-list').listview('refresh');
				            	$('#search-keyword-list').listview('refresh');
				            }, 
				            error : function(){ 
				            	alert('AJAX 통신 실패'); 
				            } 
				        });
	            	}
				});
	            
	            function addsearchlist() {
					$.ajax({ 
			        	url: "addsearchlist",
			            type:'POST', 					 
			            data:{ 
			            	keyword: keyword,
			            	page: curPage
			            }, 
			            success : function(data){
			            	curPage = data[1];
			            	
			            	$('#addsearch-list').remove();
			            	for(var i=0; i<data[0].length; i++) {
			            		$('#search-keyword-list').append("<li class='ui-li-has-thumb ui-first-child ui-last-child'>"
			            							+ "<a href='detail/" + data[0][i]['contentid'] + "' style='background-color: white;>"
				            						+ "<img src='" + data[0][i]['firstimage'] + "' style='width:100%; height:100%;'/>"
				            						+ "<h2>" + data[0][i]['addr1'] + "</h2>"
				            						+ "<span class='ui-li-count'>11</span></li>");
			            	}
			            	if(curPage < pageCnt) {
			            		$('#search-keyword-list').append("<li id='addsearch-list' class='ui-li-has-thumb ui-first-child ui-last-child'>"
													+ "<a href='#' onclick='addsearchlist()' style='background-color: #F05562;>"
													+ "<h2>검색결과 더보기</h2></a></li>");
			            	}
			            	$('#search-keyword-list').listview('refresh');
			            }, 
			            error : function(){ 
			            	alert('AJAX 통신 실패'); 
			            } 
			        });
				};
            </script>
            
            <div data-role='footer' data-position='fixed'>
                <!-- data-role='navbar'는 앱스럽게 탭메뉴를 구성할 수 있도록 해준다. 가로 최대:5개 -->
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