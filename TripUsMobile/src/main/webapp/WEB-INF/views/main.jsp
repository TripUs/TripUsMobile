<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=width, initial-scale=1">
        <title>Document</title>
    </head>
    <body>
        <div data-role='page'>
            <div data-role='header'>
                <h1>TripUs</h1>
            </div>
            <div data-role='content'>
            	<div class="ui-corner-all custom-corners">
            		<div class="ui-bar ui-bar-a">
            			<h3>최근 검색지</h3>
            		</div>
            		<div class="ui-body ui-body-a">
		            	<div class="swiper-container">
					        <div class="swiper-wrapper">
					    		<c:forEach items="${list }" var="bean">
		                        <div class="swiper-slide">
						            <a href="detail/${bean.contentid }">
					                	<img class="slide-img" src="${bean.firstimage }"/>
					                    <p><strong>${bean.title }</strong></p>
			               			</a>
			               		</div>    
		                		</c:forEach>
		                	</div>
					        <!-- Add Pagination -->
					        <div class="swiper-pagination"></div>
					    </div>
					</div>
			    </div>
			    
			    <div class="ui-corner-all custom-corners">
            		<div class="ui-bar ui-bar-a">
            			<h3>TripUs 추천 여행코스 <a href="#">더보기</a></h3>
            		</div>
            		<div class="ui-body ui-body-a">
		            	<div class="swiper-container">
					        <div class="swiper-wrapper">
					    		<c:forEach items="${list }" var="bean">
		                        <div class="swiper-slide">
						            <a href="detail/${bean.contentid }">
					                	<img class="slide-img" src="${bean.firstimage }"/>
					                    <p><strong>${bean.title }</strong></p>
			               			</a>
			               		</div>    
		                		</c:forEach>
		                	</div>
					        <!-- Add Pagination -->
					        <div class="swiper-pagination"></div>
					    </div>
					</div>
			    </div>
				
			    <div class="ui-corner-all custom-corners">
            		<div class="ui-bar ui-bar-a">
            			<h3>Top10 여행지</h3>
            		</div>
            		<div class="ui-body ui-body-a">
		            	<div class="swiper-container">
					        <div class="swiper-wrapper">
					    		<c:forEach items="${list }" var="bean">
		                        <div class="swiper-slide">
						            <a href="detail/${bean.contentid }">
					                	<img class="slide-img" src="${bean.firstimage }"/>
					                    <p><strong>${bean.title }</strong></p>
			               			</a>
			               		</div>    
		                		</c:forEach>
		                	</div>
					        <!-- Add Pagination -->
					        <div class="swiper-pagination"></div>
					    </div>
					</div>
			    </div>
			    
			    <div class="ui-corner-all custom-corners">
            		<div class="ui-bar ui-bar-a">
            			<h3>Top10 여행노트</h3>
            		</div>
            		<div class="ui-body ui-body-a">
		            	<div class="swiper-container">
					        <div class="swiper-wrapper">
					    		<c:forEach items="${list }" var="bean">
		                        <div class="swiper-slide">
						            <a href="detail/${bean.contentid }">
					                	<img class="slide-img" src="${bean.firstimage }"/>
					                    <p><strong>${bean.title }</strong></p>
			               			</a>
			               		</div>    
		                		</c:forEach>
		                	</div>
					        <!-- Add Pagination -->
					        <div class="swiper-pagination"></div>
					    </div>
					</div>
			    </div>
            </div>
            
            <script type="text/javascript">
	            var swiper = new Swiper('.swiper-container', {
	    	        pagination: '.swiper-pagination',
	    	        slidesPerView: 3,
	    	        paginationClickable: true,
	    	        spaceBetween: 10,
	    	        freeMode: true
	    	    });
            </script>
            
            <div data-role='footer' data-position='fixed'>
                <!-- data-role='navbar'는 앱스럽게 탭메뉴를 구성할 수 있도록 해준다. 가로 최대:5개 -->
                <div data-role='navbar'>
                    <ul>
                        <li>
                            <a data-icon='home' class="ui-btn-active ui-state-persist" href="main">Home</a>
                        </li>
                        <li>
                            <a data-icon='calendar' href="#">내 여행</a>
                        </li>
                        <li>
                            <a data-icon='edit' href="#">여행노트</a>
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