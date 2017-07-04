<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=width, initial-scale=1">
        <title>Document</title>        
        <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=0f2e3ff280f258cf4dc5f49a68d055b8&libraries=services"></script> 
    </head>
    <body>
        <div data-role='page' style="background-color: white;">
            <div data-role='header' data-position='fixed' style="background-color: #F05562; color: white;">
                <a href="#" data-rel="back" class="ui-btn ui-shadow ui-icon-arrow-l ui-btn-icon-left ui-btn-icon-notext ui-corner-all">Back</a>
                <h1>${title }</h1>
            </div>
            <div data-role='content'>
               	<div id="map" style="width:100%;height:350px;"></div>
               	
               	<div>
               		<input type="hidden" value="${mapx }" id="mapx">
               		<input type="hidden" value="${mapy }" id="mapy">
               	</div>
               	<button onclick="map.relayout();"></button>
               	
               	<script type="text/javascript">
               		var y = $("#mapy").val();
               		var x = $("#mapx").val();
               	
               		var map;
	               	function setmap(){
	               		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	               	    mapOption = { 
	               	        center: new daum.maps.LatLng(y, x), // 지도의 중심좌표
	               	        level: 4 // 지도의 확대 레벨
	               	    };
	
		               	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		             	map = new daum.maps.Map(mapContainer, mapOption); 
		               	
		             	var markerPosition  = new daum.maps.LatLng(y, x); 
		
		             	// 마커를 생성합니다
		             	var marker = new daum.maps.Marker({
		             	    position: markerPosition
		             	});
		
		            	// 마커가 지도 위에 표시되도록 설정합니다
		            	marker.setMap(map);
	               	}setTimeout(function(){ setmap();	 }, 1000);
					setTimeout(function(){ map.relayout();	 }, 2000);
               	</script>
			</div>
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