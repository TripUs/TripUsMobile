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
    	<div id="main" data-role='page' style="background-color: white;">
            <!-- 영어 -->
        	<c:if test="${sessionScope.userInfo.lang eq 1 }">
        		<c:set value="Travel Stories" var="mytripDetail_sub"></c:set>
        		<c:set value="Travel Course" var="mytripDetail_course"></c:set>
        		<c:set value="Change Image" var="mytripDetail_changeImg"></c:set>
        		<c:set value="Invite a Friends" var="mytripDetail_invite"></c:set>
        		<c:set value="Share Your Travel-Note Calendar" var="mytripDetail_share"></c:set>
        		<c:set value="of Travel" var="mytripDetail_title"></c:set>
        		<c:set value="Day " var="mytripDetail_day"></c:set>
        		<c:set value="Delete" var="mytripDetail_del"></c:set>
        		<c:set value="Add Attractions +" var="mytripDetail_addAttrac"></c:set>
        		<c:set value="Writing" var="mytripDetail_writing"></c:set>
        	</c:if>
        	<!-- 한국어 -->
        	<c:if test="${sessionScope.userInfo.lang ne 1 }">
        		<c:set value="여행 스토리" var="mytripDetail_sub"></c:set>
        		<c:set value="여행 경로" var="mytripDetail_course"></c:set>
        		<c:set value="커버이미지 변경" var="mytripDetail_changeImg"></c:set>
        		<c:set value="친구 초대" var="mytripDetail_invite"></c:set>
        		<c:set value="여행노트 일정공유" var="mytripDetail_share"></c:set>
        		<c:set value="여행" var="mytripDetail_title"></c:set>
        		<c:set value="일차" var="mytripDetail_day"></c:set>
        		<c:set value="삭제" var="mytripDetail_del"></c:set>
        		<c:set value="여행지 추가 +" var="mytripDetail_addAttrac"></c:set>
        		<c:set value="글쓰기" var="mytripDetail_writing"></c:set>
        	</c:if>
        	
            <div data-role='header' data-position='fixed' style="background-color: #F05562; color: white;">
            	<a href="#" data-rel="back" class="ui-btn ui-shadow ui-icon-mybackicon ui-btn-icon-left ui-btn-icon-notext ui-corner-all">Back</a>
                <h2>${mytrip.title }</h2>
            </div>
        	<div data-role='content'>
        		<div style="width: 100%; height: 42px;; z-index: 90; top: 0px; position: fixed; background-color: #F05562; color: white; line-height: 42px; text-align: center;">${mytrip.title }</div>
        		<div class="sub-navbar">
	        		<div data-role="navbar" style="width: 100%; z-index: 100; top: 42px; position: fixed;" data-theme="c">
	        			<ul>
	        				<li><a id="nav-story" href="#" class="ui-btn-active">${mytripDetail_sub }</a></li>
	        				<li><a id="nav-maps" href="#">${mytripDetail_course }</a></li>
	        			</ul>
	        		</div>
        		</div>
        		<div id="mytrip-story">
	            	<div data-role="controlgroup" data-type="horizontal">
	            		<img class="mytrip-cover" src="${mytrip.coverimg }"/>
	               		<a class="mytrip-detail-btn" data-role="button" href="#" style="background-color: white; color: black;">${mytripDetail_changeImg }</a>
	               		<a class="mytrip-detail-btn" data-role="button" href="../invitefriend" style="background-color: white; color: black;">${mytripDetail_invite }</a>
	               	</div>
	               	
	               	
	               	<div style="position: relative; top: -48px;">
	               	<a href="../shareTripnote/${sessionScope.mytripCode }" data-role="button">${mytripDetail_share }</a>
	              	<c:forEach items="${tripList }" var="bean">
	               		<div class="ui-corner-all custom-corners">
	               			<div class="ui-bar ui-bar-a" style="background: white; border: none;">
		               			<div style="border-bottom: 3px solid gray; padding-bottom: 5px;">
			               			<img src="../resources/imgs/icon/tripcon2.png" style="width: 30px; height: 23px; position: relative; top: 5px;"/>
			               			<h3>${mytripDetail_title } ${bean.daynum }${mytripDetail_day }</h3><small>&nbsp; (${bean.tripdate })</small>
		               			</div>
		               		</div>
	               			<div class="ui-body ui-body-a" style="border: none;">
	               				<table>
		               				<c:forEach items="${tripDetail }" var="detail" varStatus="status">
		               					<c:if test="${bean.tripdate eq detail.tripdate }">
	               							<tr height="30px">
		               							<th style="height: 30px;">
		               								<span style="width: 30px; height: 30px; border-radius: 30px; background-color: #F05562; color: white;">&nbsp; ${status.index }&nbsp;&nbsp;</span></th>
		               							<td width="60%"><a href="../detail/${detail.contentid }" style="text-decoration: none; color: gray;"><strong>${detail.content_title }</strong></a></td>
		               							<td></td>	
		               						</tr>
		               						<tr>
		               							<td><img src="../resources/imgs/icon/tripline.png" style="width: 100%;"/></td>
		               							<td>
		               								<c:if test="${detail.content_img ne '데이터 없음' }">
			               								<img src="${detail.content_img }" style="width: 100%; height: 110px; border-radius: 5px;"/>
		               								</c:if>
		               								<c:if test="${detail.content_img eq '데이터 없음' }">
			               								<img src="../resources/imgs/no_img.jpg" style="width: 100%; height: 110px; border-radius: 5px;"/>
		               								</c:if>
		               							</td>
		               							<th>
		               								<span style="color: red;">♥</span>${conLike[status.index] }<br/><br/>
		               								<a href="../delTrip/${detail.contentid }" style="color: darkgray; text-decoration: none;">${mytripDetail_del }</a>
		               							</th>
		               						</tr>
	               						</c:if>
	               					</c:forEach>
	               					<tr>
	               						<th>
	               							<span style="width: 30px; height: 30px; border-radius: 30px; background-color: #F05562; color: white;">&nbsp; +&nbsp;&nbsp;</span></th>
	               						<td colspan="2"><a style="text-decoration: none; color: gray;" href="../search_mytrip?tripdate=${bean.tripdate}"> ${mytripDetail_addAttrac } </a></td>
	               					</tr>
	               				</table>
	               					
	               				<!-- 메모 공간 -->
	               				<div data-role="collapsible" data-theme="b" data-content-theme="a" style="background-color: #e9e9e9">
	               					<h4 style="background-color: #e9e9e9">${bean.daynum }${mytripDetail_day } Story Borad</h4>
	               					
	               					<c:forEach items="${tripStory }" var="story">
	               						<c:if test="${bean.tripdate eq story.tripdate }">
	               							<div style="border-bottom: 1px solid gray;">
	               								<table>
	               									<tr>
	               										<td width="50px" rowspan="2">
	               											<img src="${story.userprofile }" style="width: 40px; 40px;">
	               										</td>
	               										<td width="80%" style="padding-left: 20px;">
	               											<strong>${story.usernicname }</strong>
	               										</td>
	               										<td width="20px" rowspan="2">
	               											<a href="../replestory/${story.idx }">
	               												<img src="../resources/imgs/icon/replecon.png" style="width: 30px; height: 35px;">
	               											</a>
	               										</td>
	               									</tr>
	               									<tr>
	               										<td style="padding-left: 20px;">${story.memo }</td>
	               									</tr>
	               								</table>
	               							</div>
	               						</c:if>
	               					</c:forEach>
	               					
	               					<a data-role="button" style="background-color: white; border: 2px solid #F05562; color: #F05562;" href="../addstory/${bean.daynum }/${bean.tripdate }">${mytripDetail_writing }</a>
	               				</div>
	               				
	               			</div>
	               		</div><br/>
	               	</c:forEach>
	            	</div>
	            </div>
	            
				<div id="mytrip-maps">
	               	<div style="width: 100%; height: 42px;; z-index: 90; top: 0px; position: fixed; background-color: #F05562; color: white; line-height: 42px; text-align: center;">${mytrip.title }</div>
        			<div id="map" style="width: 100%; height: 250px; position: fixed; top: 80px; z-index: 90;"></div>
	               	<div style="width: 100%; height: 300px;"></div>
	               	
	               	<div style="padding: 0px 10px;">
		               	<c:forEach items="${tripList }" var="bean">
		               		<div class="placecard" style="padding-bottom: 5px; margin-bottom: 10px;">
	               				<div id="sampleline" style="height: 20px; width: 100%; border-radius: 5px;"></div>
		               	 		<div class="ui-corner-all custom-corners">
				           			<div class="ui-bar ui-bar-a" style="background: white; border: none;">
				               			<div style="border-bottom: 3px solid gray; padding-bottom: 5px;">
						               		<img src="../resources/imgs/icon/tripcon2.png" style="width: 30px; height: 23px; position: relative; top: 5px;"/>
						               		<h3>${mytripDetail_title } ${bean.daynum }${mytripDetail_day }</h3><small>&nbsp; (${bean.tripdate })</small>
					               		</div>
				               		</div>
			               			<div class="ui-body ui-body-a" style="border: none;">
			               			   <table>
				               				<c:forEach items="${tripDetail }" var="detail" varStatus="status">
				               					<c:if test="${bean.tripdate eq detail.tripdate }">
			               							<tr height="30px">
				               							<th style="height: 30px;">
				               								<span style="width: 30px; height: 30px; border-radius: 30px; background-color: #F05562; color: white;">&nbsp; ${status.index }&nbsp;&nbsp;</span></th>
				               							<td width="60%"><a href="../detail/${detail.contentid }" style="text-decoration: none; color: gray;"><strong>${detail.content_title }</strong></a></td>
				               							<td></td>	
				               						</tr>
				               						<tr>
				               							<td><img src="../resources/imgs/icon/tripline.png" style="width: 100%;"/></td>
				               							<td>
				               								<c:choose>
																<c:when test="${detail.content_img eq null }">
																	<img src="../resource/imgs/no_img.jpg" style="width: 100%; heigth: 110px; border-radius: 5px;"/>
																</c:when>
																<c:otherwise>
																	<img src="${detail.content_img }" style="width: 100%; height: 110px; border-radius: 5px;"/>
																</c:otherwise>
															</c:choose>
				               							</td>
				               							<th>
				               								<span style="color: red;">♥</span>${conLike[status.index] }<br/><br/>
				               								<a href="../delTrip/${detail.contentid }" style="text-decoration: none;">삭제</a>
				               							</th>
				               						</tr>
			               							<input type="hidden" value="${detail.mapy }" class="mapxy"/>
								               		<input type="hidden" value="${detail.mapx }" class="mapxy"/>
			               						</c:if>
			               					</c:forEach>
			               				</table>
			               			</div>
			               		</div>
		               		</div>
		               	</c:forEach>
	               	</div>		
	            </div><!-- end mytrip-maps -->
            </div>
            
            <script type="text/javascript">
            	$('#nav-story').click(function() {
	        		$('#mytrip-maps').hide();
	        		$('#mytrip-story').show();
	        	});
				$('#nav-maps').click(function() {
					$('#mytrip-story').hide();
	        		$('#mytrip-maps').show();
	        		//re();//여기 map.relayout()을 실행함
	        		setmap();
	        		setBound(0);

			        var mapOffset = $("#map").offset();
			        $(window).scroll( function() {
			        	if( $(document).scrollTop() < mapOffset.top ){
				        	$('#map').css("position","fixed");
				        	//var offsetmax = 79.31817901134491-$(document).scrollTop()
			        		$('#map').css("top", "78px");
			        	}else if(  $(document).scrollTop() > mapOffset.top ){
			        		 $('#map').css("position","fixed");
			        		 $('#map').css("top","78px");
			        	}
					});
				});
			</script>
		
			<script type="text/javascript">
                var pathlines = new Array();	     
		        var strokeColors = new Array();
		        var mymaxnumber = 16777215;
		        //var contents = new Array();
		        for(var i = 0 ; i< $(".placecard").length; i++){	
		        	var mynum = 6000215+(28000*i)
		        	strokeColors[i] ="#"+mynum.toString(16);
		        	// style="margin-bottom:15px;"
		        	//contents[i] =  '<div class ="label"><span class="tooltip" style="background-color:"'+strokeColors[i]+';">'+(i+1)+'일차</span></div>';
		        	//$(".tooltip").css("background-color",strokeColors[i]);
		        	//console.log(contents[i]);
		        	var pathline  = new Array();
		        	var cnt = 0;	        	
		        	for(var j=0; j< $(".placecard").eq(i).find(".mapxy").length; j+=2){
		        		pathline[cnt++]= new daum.maps.LatLng(
		        				$(".placecard").eq(i).find(".mapxy").eq(j).val(),
		        				$(".placecard").eq(i).find(".mapxy").eq(j+1).val()
		        		);
		        	}
		        	pathlines[i] = pathline;
		        }
				var map;
				var bounds = new Array();
	       	    function setmap() {
					
		           	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		                mapOption = {
		                    center: pathlines[0][0], // 지도의 중심좌표
		                    level: 3 // 지도의 확대 레벨
		                };	     	
		
		           	var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 마커이미지의 주소입니다    
		            imageSize = new daum.maps.Size(50,45), // 마커이미지의 크기입니다
		            imageOption = {offset: new daum.maps.Point(15,43)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			              
			        // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			        var markerImage_start = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption)// 마커가 표시될 위치입니다
		            
			        var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png';
			        var markerImage_end = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption)// 마커가 표시될 위치입니다
			        
			        
			        var imageSrc_b = 'http://203.236.209.203:8080/tripus/resources/imgs/icon/ourmaker.png', // 마커이미지의 주소입니다    
		            imageSize_b = new daum.maps.Size(50,50), // 마커이미지의 크기입니다
		            imageOption_b = {offset: new daum.maps.Point(25,25)}; 
			        
			        var markerImage_b= new daum.maps.MarkerImage(imageSrc_b, imageSize_b, imageOption_b);
			        map = new daum.maps.Map(mapContainer, mapOption);
			        
		            var marker;
		         	for (var i = 0; i < pathlines.length; i++) {
		         	    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
		         	    bounds[i] = new daum.maps.LatLngBounds();
		         	    
			         	    for (var j = 0; j < pathlines[i].length; j++) {
			         	    	
			         	    	if(j==0){
			         	    		marker = new daum.maps.Marker({ 
					         	    	position : pathlines[i][j],
					         	    	image: markerImage_start
					         	    });
			         	    	}else if(j==(pathlines[i].length-1)){
			         	    		marker = new daum.maps.Marker({ 
					         	    	position : pathlines[i][j] ,
					         	    	image: markerImage_end
					         	    });
			         	    	}else{
			         	    		//marker = new daum.maps.Marker({ 
					         	    	//position : pathlines[i][j] ,
				         	    		//image: markerImage_b
					         	    //});
			         	    	}
			         	   	marker.setMap(map);
			         	    // LatLngBounds 객체에 좌표를 추가합니다
			     		   	bounds[i].extend(pathlines[i][j]);
			         		
			     			var circle = new daum.maps.Circle({
				         	    center : pathlines[i][j],  		// 원의 중심좌표 입니다 
				         	    radius: 60, 					// 미터 단위의 원의 반지름입니다 
				         	    strokeColor:  strokeColors[i], 	// 선의 색깔입니다
				         	    fillColor:  strokeColors[i], 	// 채우기 색깔입니다
				         	    fillOpacity: 0.7  				// 채우기 불투명도 입니다   
				         	}); 

				         	// 지도에 원을 표시합니다 
				         	circle.setMap(map); 
				         		
			         		if(j==0){
				     			var customOverlay = new daum.maps.CustomOverlay({
				     			    position: pathlines[i][j]
				     			    //content: contents[i]
				     		    });	
				     			customOverlay.setMap(map);
				     		}
			     		}
		         	}; // end setmap();
		         	
		           	for(var i = 0 ; i < pathlines.length; i++){
		           		if(pathlines[i].length > 0) {
		           			$(".placecard").eq(i).css({"border-color" : strokeColors[i], 
						                        	   "border-weight": "3px", 
						                        	   "border-style" : "solid",
						                        	   "border-radius": "10px"});
		           			//$(".placecard").eq(i).css("border-radius", "10px");
		           			var polyline = new daum.maps.Polyline({
				                path: pathlines[i], 			// 선을 구성하는 좌표배열 입니
				                strokeWeight: 5,				// 선의 두께 입니다
				                strokeColor: strokeColors[i], 	// 선의 색깔입니다
				                strokeOpacity: 0.7, 			// 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
				                strokeStyle: 'solid' 			// 선의 스타일입니다
				            });
				          	polyline.setMap(map);
				        }
		           	}
		           	map.relayout();
		         	polyline.setMap(map);
	
		         	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		         	var zoomControl = new daum.maps.ZoomControl();
		         	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);		         	
		         };
	          	
		      	function setBound(i) {
		     	    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
		     	    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
		     	    map.setBounds(bounds[i]);
		         };
					
		      	$(".placecard").each(function(idx){
		      		var num = idx;
					$(".placecard").eq(num).click(function() {
						setBound(num);
					});					
				});
	        </script>
            
            <div data-role='footer' data-position='fixed' data-theme="c">
                <!-- data-role='navbar'는 앱스럽게 탭메뉴를 구성할 수 있도록 해준다. 가로 최대:5개 -->
                <div data-role='navbar'>
                    <ul>
                        <li>
                            <a data-icon='home' href="../../tripus/">Home</a>
                        </li>
                        <li>
                            <a data-icon='calendar' class="ui-btn-active ui-state-persist" href="../mytrip">내 여행</a>
                        </li>
                        <li>
                            <a data-icon='edit' href="../tripnote">여행노트</a>
                        </li>
                        <li>
                            <a data-icon='gear' href="../setting">설정</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>