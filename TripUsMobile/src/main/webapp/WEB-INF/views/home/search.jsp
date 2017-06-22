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
        <div id="search" data-role='page'>
            <div data-role='header'>
                <h1>TripUs</h1>
            </div>
        	
            <div data-role='content'>
            	<form action="search" method="post">
	            	<input type="text" id="input-keyword" name="keyword" placeholder="어디를 가고 싶으신가요?"/>
	            	<button>검색</button>
            	</form>
            	
            	<a data-role="button" onclick="checkAvailability()" href="#">주변 검색</a>
            	
            	<ul data-role='listview' data-inset='true'>
                    <li data-role='list-divider'>지역 검색결과</li>
                    <c:forEach items="${areaList }" var="bean">
	            		<li>
	                        <a href="basicInfo?areacode=${bean.areacode }&sigungucode=${bean.sigungucode }">
	                            <span><strong>${bean.name }</strong></span>
	                        </a>
                    	</li>
	            	</c:forEach>
            	</ul>
            	
            	<ul data-role='listview' data-inset='true'>
                    <li data-role='list-divider'>키워드 검색결과</li>
                    <c:forEach items="${keywordList }" var="bean">
	            		<li>
	                        <a href="detail/${bean.contentid }">
	                            <img src="${bean.firstimage }"/>
	                            <span><strong>${bean.title }</strong></span><br/>
	                            <span>${bean.addr1 }</span>
	                            <span class="ui-li-count">11</span>
	                        </a>
                    	</li>
	            	</c:forEach>
            	</ul>
            </div>
            
            <script type="text/javascript">
	            function checkAvailability(){
	                cordova.plugins.diagnostic.isGpsLocationAvailable(function(available){
	                    console.log("GPS location is " + (available ? "available" : "not available"));
	                    if(!available){
	                       checkAuthorization();
	                    }else{
	                        console.log("GPS location is ready to use");
	                    }
	                }, function(error){
	                    console.error("The following error occurred: "+error);
	                });
	            }
	            function checkAuthorization(){
	                cordova.plugins.diagnostic.isLocationAuthorized(function(authorized){
	                    console.log("Location is " + (authorized ? "authorized" : "unauthorized"));
	                    if(authorized){
	                        checkDeviceSetting();
	                    }else{
	                        cordova.plugins.diagnostic.requestLocationAuthorization(function(status){
	                            switch(status){
	                                case cordova.plugins.diagnostic.permissionStatus.GRANTED:
	                                    console.log("Permission granted");
	                                    checkDeviceSetting();
	                                    break;
	                                case cordova.plugins.diagnostic.permissionStatus.DENIED:
	                                    console.log("Permission denied");
	                                    // User denied permission
	                                    break;
	                                case cordova.plugins.diagnostic.permissionStatus.DENIED_ALWAYS:
	                                    console.log("Permission permanently denied");
	                                    // User denied permission permanently
	                                    break;
	                            }
	                        }, function(error){
	                            console.error(error);
	                        });
	                    }
	                }, function(error){
	                    console.error("The following error occurred: "+error);
	                });
	            }
	            function checkDeviceSetting(){
	                cordova.plugins.diagnostic.isGpsLocationEnabled(function(enabled){
	                    console.log("GPS location setting is " + (enabled ? "enabled" : "disabled"));
	                    if(!enabled){
	                        cordova.plugins.locationAccuracy.request(function (success){
	                            console.log("Successfully requested high accuracy location mode: "+success.message);
	                            //여기가 GPS활성화를 했을경우(확인을 선택경우)
	                            //이후 geolocation API 사용~~
	                        }, function onRequestFailure(error){
	                            //여기는 GPS활성화를 안했을경우(취소를 선택한경우)
	                            //geolocation API 사용하면 안됨.
	                            console.error("Accuracy request failed: error code="+error.code+"; error message="+error.message);
	                            if(error.code !== cordova.plugins.locationAccuracy.ERROR_USER_DISAGREED){
	                                if(confirm("Failed to automatically set Location Mode to 'High Accuracy'. Would you like to switch to the Location Settings page and do this manually?")){
	                                    cordova.plugins.diagnostic.switchToLocationSettings();
	                                }
	                            }
	                        }, cordova.plugins.locationAccuracy.REQUEST_PRIORITY_HIGH_ACCURACY);
	                    }
	                }, function(error){
	                    console.error("The following error occurred: "+error);
	                });
	            }
            	//checkAvailability(); // start the check
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
            </div><!-- end footer -->
        </div><!-- end page -->
    </body>
</html>