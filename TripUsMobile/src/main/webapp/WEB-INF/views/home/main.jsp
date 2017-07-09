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
        <div id="main" data-role='page' style="background-color: white;">
            <div id="main-header" data-role='header' data-position='fixed' style="background-image: url('resources/imgs/banner/mainbanner1.jpg');">
            	<!-- <h1>&nbsp;</h1> -->
            	<img src="resources/imgs/logo/headerlogo.png" style="margin-top: 30px; width: 70%; margin-left: 15%;"/>
                <div style="width: 80%; margin-left: 10%; margin-top: 20px; margin-bottom: 40px;">
	                <input style="border: 1px solid white;" type="text" id="search-area" name="search" placeholder="어디로 가고 싶으신가요?"/>
                </div>
            </div>
        
        	<script type="text/javascript">
        		$('#search-area').on("focus", function(){
	            	$.mobile.changePage('search',{
	                	transition:'slide'
	                });
	        	});
        	</script>
        	
            <div data-role='content' style="padding: 10px;">
            	<c:if test="${not empty sessionScope.userInfo}">
		           	<div class="ui-corner-all custom-corners">
		           		<div class="ui-bar ui-bar-a" style="background-color: white; border: none; padding: 0px 0px;">
		           			<div style="border-bottom: 3px solid #e9e9e9; padding-bottom: 5px; padding-left: 10px; margin-bottom: 10px;">
		           				<c:if test="${sessionScope.userInfo.lang eq 0 }">
		           					<h3 style="color: #F05562;">${sessionScope.userInfo.nicname }님의 최근 검색지</h3>
		           				</c:if>
		           				<c:if test="${sessionScope.userInfo.lang eq 1 }">
		           					<h3 style="color: #F05562;">Recent searches for ${sessionScope.userInfo.nicname }</h3>
		           				</c:if>
		           			</div>
		           		</div>
		           		<div class="ui-body ui-body-a img-slider" style="border: none;">
							<c:forEach items="${recentSearch }" var="bean">
				               	<div class="swiper-slide">
							    	<a href="detail/${bean.contentid }" style="text-decoration: none; color: gray;">
						            	<img class="slide-img" src="${bean.firstimage }" style="border-radius: 10px;"/>
						                <p class="slider-text"><strong>${bean.title }</strong></p>
					           		</a>
					           	</div>    
				            </c:forEach>
				       	</div>
					</div>
		        </c:if>
	            
			    <div class="ui-corner-all custom-corners">
            		<div class="ui-bar ui-bar-a" style="background-color: white; border: none; padding: 0px 0px;">
            			<div style="border-bottom: 3px solid #e9e9e9; padding-bottom: 5px; padding-left: 10px; margin-bottom: 10px;">
            				<img src="resources/imgs/icon/awards-logo.png" style="width: 27px; height: 27px; position: relative; top: 5px;"/>
            				<h3 style="color: #F05562;">TripUs Top5 여행지</h3>
            			</div>
            		</div>
            		<div class="ui-body ui-body-a img-slider" style="border: none;">
		            	<c:forEach items="${topArea }" var="bean">
		                	<div class="swiper-slide">
						    	<a href="areaInfo/${bean.areacode }" style="text-decoration: none; color: gray;">
					            	<img class="slide-img" src="${bean.imgname }" style="border-radius: 10px;"/>
					            </a>
			               		<table style="width: 100%; margin-top: 10px;">
			               			<tr>
			               				<td width="60%" style="padding-left: 5px;"><a href="areaInfo/${bean.areacode }" style="text-decoration: none; color: gray;">
					            			<span class="slider-text"><strong>${bean.name }</strong></span>
			               				</a></td>
			               				<td><strong><span style="color: red;">♥</span> ${bean.likeflag }</strong></td>
			               			</tr>
			               		</table>
			               	</div>    
		                </c:forEach>
		        	</div>
			    </div>
				
			    <div class="ui-corner-all custom-corners">
            		<div class="ui-bar ui-bar-a" style="background-color: white; border: none; padding: 0px 0px;">
            			<!-- <img src="resources/imgs/icon/awards-logo.png" style="width: 23px; position: relative; top: 3px"> -->
            			<div style="border-bottom: 3px solid #e9e9e9; padding-bottom: 5px; padding-left: 10px; margin-bottom: 10px;">
            				<img src="resources/imgs/icon/awards-logo.png" style="width: 27px; height: 27px; position: relative; top: 5px;"/>
            				<h3 style="color: #F05562;">TripUs Top5 여행노트</h3>
            			</div>
            		</div>
            		<div class="ui-body ui-body-a img-slider" style="border: none;">
		            	<c:forEach items="${topNote }" var="bean">
	            			<div class="swiper-slide" style="padding: 0px 10px;">
	            				<div style="border: 2px solid #e9e9e9; border-radius: 10px; margin-bottom: 20px;">
									<table>
	            						<tr>
	            							<td width="35px" rowspan="2" style="padding-left: 10px;"><img src="${bean.userprofile }" style="width: 35px; height: 35px;"/></td>
	            							<td style="padding-left: 10px;" colspan="3">
	            								<strong>${bean.usernicname }</strong><br/>
	            							</td>
	            						</tr>
	            						<tr>
	            							<td style="padding-left: 10px;"><span style="color: red;">♥</span>${bean.likeflag }</td>
	            							<td style="padding-left: 10px;"><img src="resources/imgs/icon/comment.png" style="position: relative; top: 0px; width: 25px; height: 18px;"/></td>
	            							<td>${bean.commentnum }</td>
	            						</tr>
	            					</table>
	            					<a href="noteDetail/${bean.idx }" style="text-decoration: none;">
			    						<img src="${bean.thema }" style="width: 100%; height: 110px;"/>
			    	        			<p class="notetitle-text" style="color: gray; overflow: hidden;text-overflow: ellipsis;white-space: nowrap;width: 95%;height: 20px;text-decoration: none;">
			    	        			<strong>&nbsp;${bean.title }</strong></p>
			    	        		</a>
		            			</div>
		            		</div>
		            	</c:forEach>
		            	
		        	</div>
			    </div>
			    
			    <div class="ui-corner-all custom-corners">
            		<div class="ui-bar ui-bar-a" style="background-color: white; border: none; padding: 0px 0px;">
            			<div style="border-bottom: 3px solid #e9e9e9; padding-bottom: 5px; padding-left: 10px; margin-bottom: 10px;">
            				<img src="resources/imgs/icon/awards-logo.png" style="width: 27px; height: 27px; position: relative; top: 5px;"/>
            				<h3 style="color: #F05562;">TripUs 추천 여행코스</h3>
            			</div>
            		</div>
            		<div class="ui-body ui-body-a img-slider" style="border: none;">
		            	<c:forEach items="${list }" var="bean">
		                	<div class="swiper-slide">
						    	<a href="detail/${bean.contentid }" style="text-decoration: none; color: gray;">
					            	<img class="slide-img" src="${bean.firstimage }" style="border-radius: 10px;"/>
					                <p class="slider-text"><strong>${bean.title }</strong></p>
			               		</a>
			               	</div>    
		                </c:forEach>
		        	</div>
			    </div>
            </div>
            
            <script type="text/javascript">
            	function createSlick() {
            		$(".img-slider").not('.slick-initialized').slick({
        	        	dots : false,
    	        		infinite : true,
    	        		speed : 300,
    	        		slidesToShow : 1,
    	        		centerMode : true,
    	        		variableWidth : false
        		    });		
            	}
            	createSlick();
            	//Now it will not throw error, even if called multiple times.
            	$(window).on( 'resize', createSlick );
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
            </div>
        </div>
    </body>
</html>