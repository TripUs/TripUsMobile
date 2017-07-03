<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<body>
        <div id="main" data-role='page'>
            <div data-role='header'>
            	<a href="#" data-rel="back" class="ui-btn ui-shadow ui-icon-arrow-l ui-btn-icon-left ui-btn-icon-notext">Back</a>
                <h2>여행일정 공유</h2>
            </div>
        	<div data-role='content'>
        		<div data-role="navbar">
        			<ul>
        				<li><a id="nav-friend" href="#" class="ui-btn-active">친구와 일정 공유</a></li>
        				<li><a id="nav-invite" href="#">TripUs 초대</a></li>
        			</ul>
        		</div>
            	<div id="mytrip-friend">
	            	<ul data-role="listview" data-filter="true" data-filter-placeholder="Search Name" data-inset="true">
                	<c:forEach items="${friendList }" var="bean">
                		<li data-icon="delete">
	                		<a href="#"><img src="${bean.friendprofile }"/>
	                		<h2>${bean.friendnicname }
		                	</h2></a>
	                		<a href="#invite-mytrip-friend" onclick="invitemytrip('${bean.friendid }')" data-rel="popup" data-position-to="window" data-transition="pop">친구 삭제</a>
	                	</li>
                   	</c:forEach>
                	</ul>
                	
                	<div data-role="popup" id="add-friend"></div>
					<div data-role="popup" id="invite-mytrip-friend"></div>
	            </div>
	            
	            <div id="mytrip-invite">
	            	<form action="sendmail">
	            		<input type="email" name="address" placeholder="상대의 E-Mail을 적어주세요"/>
	            		<button>발송</button>
	            	</form>
	            </div>
            </div>
            
            <script type="text/javascript">
	            var invitemytrip = function(data) {
	        		console.log('invite friend callback' + data);
	        		$('#invite-mytrip-friend').html("<h3>일정 공유</h3>");
	        		$('#invite-mytrip-friend').append("<p>친구와 여행일정을 공유 하시겠습니까?</p>");
	        		$('#invite-mytrip-friend').append("<a href='invitefriend/" + data + "' data-ajax='false' class='ui-shadow ui-btn ui-corner-all ui-btn-b ui-icon-check ui-btn-icon-delete ui-btn-inline ui-mini'>확인</a>");
	        		$('#invite-mytrip-friend').append("<a href='#' data-rel='back' class='ui-shadow ui-btn ui-corner-all ui-btn-inline ui-mini'>취소</a>");
	        	};
        	
            	$('#nav-friend').click(function() {
            		$('#mytrip-invite').hide();
            		$('#mytrip-friend').show();
            	});
				$('#nav-invite').click(function() {
					$('#mytrip-friend').hide();
            		$('#mytrip-invite').show();
            	});
            </script>
            
            <div data-role='footer' data-position='fixed'>
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