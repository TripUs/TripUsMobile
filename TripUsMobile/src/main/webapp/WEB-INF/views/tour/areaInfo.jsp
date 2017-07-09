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
        <link rel="stylesheet" href="../resources/css/themec.min.css"/>
        <link rel="stylesheet" href="../resources/css/slick.css"/>
		<link rel="stylesheet" href="../resources/css/slick-theme.css"/>
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
        <script type="text/javascript" charset="utf-8" src="../resources/js/cordova.js"></script>
        <script type="text/javascript" charset="utf-8" src="../resources/js/cordova_plugins.js"></script>
        <script type="text/javascript" charset="utf-8" src="../resources/js/geolocation.js"></script>
        <title>Document</title>
    </head>
    <body>
        <div id="search" data-role='page' style="background-color: white;">
            <div data-role='header' data-position='fixed' style="background-color: #F05562; color: white;">
            	<a href="#" data-rel="back" class="ui-btn ui-shadow ui-icon-mybackicon ui-btn-icon-left ui-btn-icon-notext ui-corner-all">Back</a>
                <h1>${info.name }</h1>
            </div>
        	
            <div data-role='content'>
            	<img src="${info.imgname }" style="width: 100%;">
            	<div style="padding: 0px 10px;">
            		<div>
            			<div style="font-size: 14px; width: 100%; margin: 10px 0px; border-bottom: 3px solid #e9e9e9; padding-bottom: 5px; padding-left: 10px;"><strong>${info.name } 소개</strong></div>
            			<div style="margin-bottom: 20px; font-size: 14px; padding: 0px 10px;">${info.content }</div>
            			
            			<div style="font-size: 14px; width: 100%; margin: 10px 0px; border-bottom: 3px solid #e9e9e9; padding-bottom: 5px;">
            				<table style="width: 100%;">
            					<tr>
            						<td width="80%" style="color: #F05562; padding-left: 10px; font-size: 14px;"><strong>관광지</strong></td>
            						<td><a href="../areaInfoSearch/${info.areacode }/12" style="color: gray; text-decoration: none; font-size: 14px;">더보기</a></td>
            					</tr>
            				</table>
            			</div>
            			<div class="img-slider" style="width:100%; border: none;">
			            	<c:forEach items="${con1 }" var="bean">
			                	<div class="swiper-slide">
							    	<a href="../detail/${bean.contentid }" style="text-decoration: none; color: gray;">
						            	<img class="slide-img" src="${bean.firstimage }" style="border-radius: 10px;"/>
						                <p class="slider-text"><strong>${bean.title }</strong></p>
				               		</a>
				               	</div>    
			                </c:forEach>
			        	</div>
            			
            			<div style="font-style: 14px; width: 100%; margin: 10px 0px; border-bottom: 3px solid #e9e9e9; padding-bottom: 5px;">
            				<table style="width: 100%;">
            					<tr>
            						<td width="80%" style="color: #F05562; padding-left: 10px; font-size: 14px;"><strong>숙박</strong></td>
            						<td><a href="../areaInfoSearch/${info.areacode }/32" style="color: gray; text-decoration: none; font-size: 14px;">더보기</a></td>
            					</tr>
            				</table>
            			</div>
            			<div class="img-slider" style="width:100%; border: none;">
			            	<c:forEach items="${con2 }" var="bean">
			                	<div class="swiper-slide">
							    	<a href="../detail/${bean.contentid }" style="text-decoration: none; color: gray;">
						            	<img class="slide-img" src="${bean.firstimage }" style="border-radius: 10px;"/>
						                <p class="slider-text"><strong>${bean.title }</strong></p>
				               		</a>
				               	</div>    
			                </c:forEach>
			        	</div>
			        	
            			<div style="font-style: 14px; width: 100%; margin: 10px 0px; border-bottom: 3px solid #e9e9e9; padding-bottom: 5px;">
            				<table style="width: 100%;">
            					<tr>
            						<td width="80%" style="color: #F05562; padding-left: 10px; font-size: 14px;"><strong>식당</strong></td>
            						<td><a href="../areaInfoSearch/${info.areacode }/39" style="color: gray; text-decoration: none; font-size: 14px;">더보기</a></td>
            					</tr>
            				</table>
            			</div>
            			<div class="img-slider" style="width:100%; border: none;">
			            	<c:forEach items="${con3 }" var="bean">
			                	<div class="swiper-slide">
							    	<a href="../detail/${bean.contentid }" style="text-decoration: none; color: gray;">
						            	<img class="slide-img" src="${bean.firstimage }" style="border-radius: 10px;"/>
						                <p class="slider-text"><strong>${bean.title }</strong></p>
				               		</a>
				               	</div>    
			                </c:forEach>
			        	</div>
			        	
            			<div style="font-style: 14px; width: 100%; margin: 10px 0px; border-bottom: 3px solid #e9e9e9; padding-bottom: 5px;">
            				<table style="width: 100%;">
            					<tr>
            						<td width="80%" style="color: #F05562; padding-left: 10px; font-size: 14px;"><strong>여행코스</strong></td>
            						<td><a href="../areaInfoSearch/${info.areacode }/25" style="color: gray; text-decoration: none; font-size: 14px;">더보기</a></td>
            					</tr>
            				</table>
            			</div>
            			<div class="img-slider" style="width:100%; border: none;">
			            	<c:forEach items="${con4 }" var="bean">
			                	<div class="swiper-slide">
							    	<a href="../detail/${bean.contentid }" style="text-decoration: none; color: gray;">
						            	<img class="slide-img" src="${bean.firstimage }" style="border-radius: 10px;"/>
						                <p class="slider-text"><strong>${bean.title }</strong></p>
				               		</a>
				               	</div>    
			                </c:forEach>
			        	</div>
			        	
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
                        	<a data-icon='home' class="ui-btn-active ui-state-persist" href="../../tripus/">Home</a>
                        </li>
                        <li>
                            <a data-icon='calendar' href="../mytrip">내 여행</a>
                        </li>
                        <li>
                            <a data-icon='edit' href="../tripnote">여행노트</a>
                        </li>
                        <li>
                            <a data-icon='gear' href="../setting">설정</a>
                        </li>
                    </ul>
                </div>
            </div><!-- end footer -->
        </div><!-- end page -->
    </body>
</html>