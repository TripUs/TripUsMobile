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
                <a href="#" data-rel="back" class="ui-btn ui-shadow ui-icon-mybackicon ui-btn-icon-left ui-btn-icon-notext ui-corner-all">Back</a>
                <h1 style="color: white;">친구 추가</h1>
            </div>
            <div data-role='content' style="padding-left: 10px; padding-right: 10px; background-color: white;">
				<div class="ui-conner-all">
					<div class="ui-body ui-body-a" style="border: none;">
						<input type="search" name="friendname" id="friendname" data-mini="true" placeholder="친구 이름을 입력하세요"/>
						<button id="search-friend">찾기</button>
					</div>
				</div>
				
				<div class="ui-conner-all">
					<div id="frind-search-header" class="ui-bar ui-bar-a" style="background-color: #F05562; border: 2px solid #F05562; border-radius: 10px;">
						<h3 style="color: white;">검색 결과</h3>
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
				            	$('#frind-search-header').html("<h3 style='color: white;'>검색결과 : " + data.length + "명</h3>");
				            	for(var i=0; i<data.length; i++) { //  class='ui-btn ui-btn-icon-right ui-icon-plus'
				            		$('#friend-listview').append("<li class='ui-li-has-thumb ui-first-child ui-last-child' data-icon='plus'>"
				            										+ "<a href='#'>"
					            									+ "<img src='" + data[i]['profile'] + "' style='width:100%; height:100%;'/>"
					            									+ "<h2>" + data[i]['name'] + " (" + data[i]['nicname'] + ")</h2>"
					            									+ "<p>" + data[i]['email'] + "</p></a>"
																	+ "<a href='#add-friend-pop' onclick=addfriend_search('" + data[i]['id'] + "')" 
																	+ " data-rel='popup' data-position-to='window' data-transition='pop' aria-haspopup='true'"
																	+ " aria-owns='add-friend-pop' aria-expanded='false' class='ui-btn ui-btn-icon-notext ui-icon-plus' title='친구 추가'>친구 추가</a>"	    				
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
	            		$('#add-friend-pop').html("<h3>친구 추가</h3>");
	            		$('#add-friend-pop').append("<p>" + data + "님을 추가하시겠습니까?</p>");
	            		$('#add-friend-pop').append("<a id='add-friend-btn' data-ajax='false' href='addfriend/" + data + "' class='ui-shadow ui-btn ui-corner-all ui-btn-b ui-icon-check ui-btn-icon-plus ui-btn-inline ui-mini'>추가</a>");
	            		$('#add-friend-pop').append("<a href='#' data-rel='back' class='ui-shadow ui-btn ui-corner-all ui-btn-inline ui-mini'>취소</a>");
	            	}
				</script>
				
			</div><!-- end content -->
		</div><!-- end page -->
	</body>
</html>