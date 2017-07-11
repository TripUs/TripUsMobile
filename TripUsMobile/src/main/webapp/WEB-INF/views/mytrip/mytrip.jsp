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
            <!-- 영어 -->
        	<c:if test="${sessionScope.userInfo.lang eq 1 }">
        		<c:set value="My Travel" var="mytrip"></c:set>
        		<c:set value="Delete Travel" var="mytrip_del"></c:set>
        		<c:set value="Would you like to plan your trip now?" var="mytrip_management_planTrip"></c:set>
        		<c:set value="Add Travel" var="mytrip_management_addTravel"></c:set>
        		<c:set value="This feature requires login." var="mytrip_management_login"></c:set>
        		<c:set value="Do you want to sign in now?" var="mytrip_management_signIn"></c:set>
        		<c:set value="Are you sure you want to delete this trip?" var="mytrip_management_deleteTrip"></c:set>
        		<c:set value="LogIn" var="login"></c:set>
        		<c:set value="Delete" var="delete"></c:set>
        		<c:set value="Cancel" var="cancel"></c:set>
        	</c:if>
        	<!-- 한국어 -->
        	<c:if test="${sessionScope.userInfo.lang ne 1 }">
        		<c:set value="내 여행관리" var="mytrip"></c:set>
        		<c:set value="여행 삭제" var="mytrip_del"></c:set>
        		<c:set value="지금 여행 계획을 세우시겠어요?" var="mytrip_management_planTrip"></c:set>
        		<c:set value="여행 추가" var="mytrip_management_addTravel"></c:set>
        		<c:set value="로그인이 필요한 기능입니다." var="mytrip_management_login"></c:set>
        		<c:set value="지금 로그인 하시겠습니까?" var="mytrip_management_signIn"></c:set>
        		<c:set value="여행을 삭제하시겠습니까?" var="mytrip_management_deleteTrip"></c:set>
        		<c:set value="로그인" var="login"></c:set>
        		<c:set value="삭제" var="delete"></c:set>
        		<c:set value="취소" var="cancel"></c:set>
        	</c:if>
        	
            <div data-role='header' data-position='fixed' style="background-color: #F05562; color: white;">
                <h1>${mytrip }</h1>
            </div>
        	
            <div data-role='content' style="padding: 0px 10px;">
            	<c:choose>
	                <c:when test="${not empty sessionScope.userInfo}">
	                	<!-- 로그인이 되어 있는 경우 -->
	                	
	                	<c:choose>
			                <c:when test="${not empty tripList}">
			                	<!-- 여행 목록이 있는 경우 -->
			                	<ul data-role="listview" data-inset="true" data-split-icon="delete">
			                	<c:forEach items="${tripList }" var="bean">
			                		<li><a href="mytripdetail/${bean.code }">
				                            <img src="${bean.coverimg }" style="height: 100%;"/>	<!-- 이미지 아이콘 -->
				                            <h2>[${bean.thema}] ${bean.title }</h2>
				                            <p>${bean.startdate } ~ ${bean.enddate }</p>
				                        </a>
				                        <a href="#" onclick="showtrippop('${bean.code }')">${mytrip_del }</a>
				                    </li>		
			                	</c:forEach>
			                	</ul>
			                </c:when>
			                
			                <c:otherwise>
			                	<!-- 여행 목록이 없는 경우 -->
			                	<c:if test="${sessionScope.userInfo.lang eq 1 }">
		           					<h2> No Travel Listings from  ${sessionScope.userInfo.nicname } </h2>
		           				</c:if>
		           				<c:if test="${sessionScope.userInfo.lang ne 1 }">
			                		 <h2>${sessionScope.userInfo.nicname } 님의 여행목록이 없습니다.</h2>
			                	</c:if>
			                	<p>${mytrip_management_planTrip }</p>
			                	<p><a href="addmytrip">${mytrip_management_addTravel }</a></p>
			                </c:otherwise>
		                </c:choose>
		                <a href="addmytrip" style="position: fixed; top: 80%; left: 83%;">
		                	<img style="width: 40px; height: 40px; border-radius: 30px;" src="resources/imgs/icon/addplus.png"/>
		                </a>
	                </c:when> 
	                
	                <c:otherwise>
	                	<!-- 로그인이 되어 있지 않은 경우 -->
	                	<h2>&nbsp;</h2>
	                	<h2> &nbsp;${mytrip_management_login }</h2>
	                	<h4>&nbsp;</h4>
	                	<p> &nbsp; ${mytrip_management_signIn } &nbsp; <a href="setting">${login }</a></p>
	                </c:otherwise>
                </c:choose>
            </div>
            
            <div id="deltrippop" style="display: none; z-index: 100; width: 75%; position: fixed; top: 30%; left: 10%; padding: 10px 10px; background-color: white; border: 2px solid #F05562; border-radius: 10px;"></div>
            
            <script type="text/javascript">
            	function canceltrippop() {
            		$('#deltrippop').hide();
            	};
            	
            	function showtrippop(code) {
            		$('#deltrippop').html('<h3>${mytrip_management_deleteTrip}</h3>');
            		$('#deltrippop').append('<a href="delMyTrip/'+ code + '" data-ajax="false" class="ui-shadow ui-btn ui-corner-all ui-btn-inline ui-mini" style="background-color: #F05562; color: white;">${delete}</a>'
                        	+ '<a href="#" class="ui-shadow ui-btn ui-corner-all ui-btn-inline ui-mini" style="background-color: #F05562; color: white;" onclick="canceltrippop()">${cancel}</a>');
            		$('#deltrippop').show();
            	}
            </script>
            
            <div data-role='footer' data-position='fixed' data-theme="c">
                <!-- data-role='navbar'는 앱스럽게 탭메뉴를 구성할 수 있도록 해준다. 가로 최대:5개 -->
                <div data-role='navbar'>
                    <ul>
                        <li>
                            <a data-icon='home' href="../tripus/">Home</a>
                        </li>
                        <li>
                            <a data-icon='calendar' class="ui-btn-active ui-state-persist" href="mytrip">내 여행</a>
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