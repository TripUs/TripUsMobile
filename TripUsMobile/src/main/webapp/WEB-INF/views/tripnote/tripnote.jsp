<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
        		<c:set value="Travel Notes" var="tripnote_sub"></c:set>
        		<c:set value="Community" var="tripnote_community"></c:set>
        		<c:set value="My Travel Notes" var="tripnote_mynotes"></c:set>
        		<c:set value="You can use it after login" var="tour_alert"></c:set>
        	</c:if>                    
        	<!-- 한국어 -->
        	<c:if test="${sessionScope.userInfo.lang ne 1 }">
        		<c:set value="여행 노트" var="tripnote_sub"></c:set>
        		<c:set value="커뮤니티" var="tripnote_community"></c:set>
        		<c:set value="내 여행노트" var="tripnote_mynotes"></c:set>
        		<c:set value="로그인 후 사용하실 수 있습니다." var="tour_alert"></c:set>
        	</c:if>
        	
            <div data-role='header' data-position='fixed' style="background-color: #F05562; color: white;">
                <h1>${tripnote_sub }</h1>
            </div>
        	
            <div data-role='content'>
        		<div class="sub-navbar">
	        		<div data-role="navbar">
	        			<ul>
	        				<li><a id="nav-all" href="#" class="ui-btn-active">${tripnote_community }</a></li>
	        				<li><a id="nav-mynote" href="#" onclick="chkLogin()">${tripnote_mynotes }</a></li>
	        			</ul>
	        		</div>
        		</div>
            	<div style="width: 100%; height: 42px; z-index: 90; top: 0px; position: fixed; background-color: #F05562; color: white; line-height: 42px; text-align: center;">${mytrip.title }</div>

				<input type="hidden" id="noteuser" value="${sessionScope.userInfo.id }">

				<script type="text/javascript">
					function chkLogin() {
						if($('#noteuser').val()=='') {
							alert("${tour_alert}");
							$('#nav-all').trigger('click');
						} else {
							$('#all-note').hide();
				        	$('#my-note').show();
						}
					};
				</script>

            	<div id="all-note" style="padding: 0px 10px;">
            		<!-- <h1>전체 여행노트</h1> -->
            		<c:forEach items="${allNote }" var="bean">
            			<div style="margin: 0px 0px; display: inline-block; box-sizing: border-box; width: 49%; padding: 5px 0px;">
            				<div style="border: 2px solid #e9e9e9; padding: 5px;">
            					<div>
            						<table>
            							<tr>
            								<td width="35px"><img src="${bean.userprofile }" style="width: 35px; height: 35px;"/></td>
            								<td style="padding-left: 10px;">
            									<strong>${bean.usernicname }</strong><br/>
            									<jsp:useBean id="now" class="java.util.Date" />
												<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
					
												<c:if test="${today eq bean.reporting_date }">
					            					<small>${bean.reporting_time }</small>
					            					<img src="resources/imgs/icon/newicon.png" style="width: 20px; height: 20px; position: relative; top: 5px;"/>
												</c:if>
												<c:if test="${today ne bean.reporting_date }">
					            					<small>${bean.reporting_date }</small>
												</c:if>
            								</td>
            							</tr>
            						</table>
            					</div>
            					<div>
    								<a href="noteDetail/${bean.idx }" style="text-decoration: none;">
	    								<img src="${bean.thema }" style="width: 100%; height: 110px;"/>
	    	        					<p class="notetitle-text" style="color: gray; overflow: hidden;text-overflow: ellipsis;white-space: nowrap;width: 95%;height: 20px;text-decoration: none;">
	    	        					<strong>${bean.title }</strong></p>
            						</a>
            					</div>
            					<div align="center">
            						<p><span style="color: red;">♥</span>${bean.likeflag } &nbsp; 
            						<img src="resources/imgs/icon/comment.png" style="position: relative; top: 5px; width: 25px; height: 18px;"/>
            						${bean.commentnum }</p>
            					</div>
            				</div>
            			</div>
            		</c:forEach>
            		
            		<c:if test="${sessionScope.userInfo ne null }">
	            		<a href="addtripNote" style="position: fixed; top: 80%; left: 83%;">
			                <img style="width: 40px; height: 40px; border-radius: 30px;" src="resources/imgs/icon/addplus.png"/>
			            </a>
		            </c:if>
            	</div><!-- end all-note -->
            
            	<div id="my-note" style="display: none; padding: 0px 10px;">
            		<c:forEach items="${myNote }" var="bean">
            			<div style="margin: 0px 0px; display: inline-block; box-sizing: border-box; width: 49%; padding: 5px 0px;">
            				<div style="border: 2px solid #e9e9e9; padding: 5px;">
            					<div>
            						<table>
            							<tr>
            								<td width="35px"><img src="${bean.userprofile }" style="width: 35px; height: 35px;"/></td>
            								<td style="padding-left: 10px;">
            									<strong>${bean.usernicname }</strong><br/>
            									<jsp:useBean id="now1" class="java.util.Date" />
												<fmt:formatDate value="${now1}" pattern="yyyy-MM-dd" var="today" />  
					
												<c:if test="${today eq bean.reporting_date }">
					            					<small>${bean.reporting_time }</small>
					            					<img src="resources/imgs/icon/newicon.png" style="width: 20px; height: 20px; position: relative; top: 5px;"/>
												</c:if>
												<c:if test="${today ne bean.reporting_date }">
					            					<small>${bean.reporting_date }</small>
												</c:if>
            								</td>
            							</tr>
            						</table>
            					</div>
            					<div>
    								<a href="noteDetail/${bean.idx }" style="text-decoration: none;">
	    								<img src="${bean.thema }" style="width: 100%; height: 110px;"/>
	    	        					<p class="notetitle-text" style="color: gray; overflow: hidden;text-overflow: ellipsis;white-space: nowrap;width: 95%;height: 20px;text-decoration: none;">
	    	        					<strong>${bean.title }</strong></p>
            						</a>
            					</div>
            					<div align="center">
            						<p><span style="color: red;">♥</span>${bean.likeflag } &nbsp; 
            						<img src="resources/imgs/icon/comment.png" style="position: relative; top: 5px; width: 25px; height: 18px;"/>
            						${bean.commentnum }</p>
            					</div>
            				</div>
            			</div>
            		</c:forEach>
            		
            		<a href="addtripNote" style="position: fixed; top: 80%; left: 83%;">
		                <img style="width: 40px; height: 40px; border-radius: 30px;" src="resources/imgs/icon/addplus.png"/>
		            </a>
            	</div><!-- end my-note -->
            
            </div><!-- end content -->
            
            <script type="text/javascript">
            	$('#nav-all').click(function() {
	        		$('#my-note').hide();
	        		$('#all-note').show();
	        	});
			</script>
            <div data-role='footer' data-position='fixed' data-theme="c">
                <div data-role='navbar'>
                    <ul>
                        <li>
                            <a data-icon='home' href="../tripus/">Home</a>
                        </li>
                        <li>
                            <a data-icon='calendar' href="mytrip">내 여행</a>
                        </li>
                        <li>
                            <a data-icon='edit' class="ui-btn-active ui-state-persist" href="tripnote">여행노트</a>
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