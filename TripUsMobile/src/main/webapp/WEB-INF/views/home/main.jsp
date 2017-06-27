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
        <link rel="stylesheet" href="resources/css/swiper.min.css">
        <link rel="stylesheet" href="resources/css/slick.css"/>
		<link rel="stylesheet" href="resources/css/slick-theme.css"/>
        <link rel="stylesheet" href="resources/css/tripus.css">
        <script src="http://code.jquery.com/jquery-1.12.4.min.js"
                  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
                  crossorigin="anonymous"></script>
        <script type="text/javascript" src="resources/js/jquery-migrate-1.4.1.min.js"></script>
        <script type="text/javascript" src="resources/js/jquery.mobile-1.4.5.min.js"></script>
        <script type="text/javascript" src="resources/js/slick.min.js"></script>
        <script type="text/javascript" src="resources/js/tripus.js"></script>
	    <title>Document</title>
    </head>
    <body>
        <div id="main" data-role='page'>
            <div data-role='header'>
                <h1>TripUs</h1>
                <input type="text" id="search-area" name="search" placeholder="어디를 가고 싶으신가요?"/>
            </div>
        
        	<script type="text/javascript">
        		$('#search-area').on("focus", function(){
	            	$.mobile.changePage('search',{
	                	transition:'slide'
	                });
	        	});
        	</script>
        	
            <div data-role='content'>
            	<c:if test="${not empty sessionScope.userInfo}">
		           	<div class="ui-corner-all custom-corners">
		           		<div class="ui-bar ui-bar-a">
		           			<h3>${sessionScope.userInfo.nicname }님의 최근 검색지</h3>
		           		</div>
		           		<div class="ui-body ui-body-a img-slider">
							<c:forEach items="${recentSearch }" var="bean">
				               	<div class="swiper-slide">
							    	<a href="detail/${bean.contentid }">
						            	<img class="slide-img" src="${bean.firstimage }"/>
						                <p class="slider-text"><strong>${bean.title }</strong></p>
					           		</a>
					           	</div>    
				            </c:forEach>
				       	</div>
					</div><br/>
		        </c:if>
	            
			    <div class="ui-corner-all custom-corners">
            		<div class="ui-bar ui-bar-a">
            			<img src="resources/imgs/icon/awards-logo.png" style="width: 23px; position: relative; top: 3px">
            			<h3>&nbsp;TripUs Top10 여행지</h3>
            		</div>
            		<div class="ui-body ui-body-a img-slider">
		            	<c:forEach items="${list }" var="bean">
		                	<div class="swiper-slide">
						    	<a href="detail/${bean.contentid }">
					            	<img class="slide-img" src="${bean.firstimage }"/>
					                <p class="slider-text"><strong>${bean.title }</strong></p>
			               		</a>
			               	</div>    
		                </c:forEach>
		        	</div>
			    </div><br/>
				
			    <div class="ui-corner-all custom-corners">
            		<div class="ui-bar ui-bar-a">
            			<img src="resources/imgs/icon/awards-logo.png" style="width: 23px; position: relative; top: 3px">
            			<h3>&nbsp;TripUs Top10 여행노트</h3>
            		</div>
            		<div class="ui-body ui-body-a img-slider">
		            	<c:forEach items="${list }" var="bean">
		                	<div class="swiper-slide">
						    	<a href="detail/${bean.contentid }">
					            	<img class="slide-img" src="${bean.firstimage }"/>
					                <p class="slider-text"><strong>${bean.title }</strong></p>
			               		</a>
			               	</div>    
		                </c:forEach>
		        	</div>
			    </div><br/>
			    
			    <div class="ui-corner-all custom-corners">
            		<div class="ui-bar ui-bar-a">
            			<h3>TripUs 추천 여행코스</h3>
            		</div>
            		<div class="ui-body ui-body-a img-slider">
		            	<c:forEach items="${list }" var="bean">
		                	<div class="swiper-slide">
						    	<a href="detail/${bean.contentid }">
					            	<img class="slide-img" src="${bean.firstimage }"/>
					                <p class="slider-text"><strong>${bean.title }</strong></p>
			               		</a>
			               	</div>    
		                </c:forEach>
		        	</div>
			    </div><br/>
            </div>
            
            <script type="text/javascript">
	            $('.img-slider').slick({
	        		dots : false,
	        		infinite : true,
	        		speed : 300,
	        		slidesToShow : 1,
	        		centerMode : true,
	        		variableWidth : false
	        	});
            </script>
            
            <div data-role='footer' data-position='fixed'>
                <div data-role='navbar'>
                    <ul>
                        <li>
                            <a data-icon='home' class="ui-btn-active ui-state-persist" href="main">Home</a>
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
            </div>
        </div>
    </body>
</html>