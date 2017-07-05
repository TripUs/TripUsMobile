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
        <title>Document</title>
	    <script type="text/javascript">
		    $(document).ready(function() {
	        	$('.img-slider').slick({
	        		dots : false,
	        		infinite : true,
	        		speed : 300,
	        		slidesToShow : 1,
	        		centerMode : true,
	        		variableWidth : false
	        	});
	        });            	
	    </script>
    </head>
    <body>
        <div id="main" data-role='page' style="background-color: white;">
            <div data-role='header' data-position='fixed' style="background-color: #F05562; color: white;">
                <h1>여행 노트</h1>
            </div>
        	
            <div data-role='content'>
        		<div class="sub-navbar">
	        		<div data-role="navbar">
	        			<ul>
	        				<li><a id="nav-all" href="#" class="ui-btn-active">커뮤니티</a></li>
	        				<li><a id="nav-mynote" href="#" onclick="chkLogin()">내 여행노트</a></li>
	        			</ul>
	        		</div>
        		</div>
            	<div style="width: 100%; height: 42px; z-index: 90; top: 0px; position: fixed; background-color: #F05562; color: white; line-height: 42px; text-align: center;">${mytrip.title }</div>

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
            									<small>${bean.reporting_date }</small>
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
            						<p><span style="color: red;">♥</span>${bean.likeflag } &nbsp; 댓글수</p>
            					</div>
            				</div>
            			</div>
            		</c:forEach>
            		
            		<a href="addtripNote" style="position: fixed; top: 80%; left: 83%;">
		                <img style="width: 40px; height: 40px; border-radius: 30px;" src="resources/imgs/icon/addplus.png"/>
		            </a>
            	</div><!-- end all-note -->
            
            	<div id="my-note" style="display: none;">
            		<h1>내 여행노트</h1>
            	</div><!-- end my-note -->
            
            </div><!-- end content -->
            
            <script type="text/javascript">
            	$('#nav-all').click(function() {
	        		$('#my-note').hide();
	        		$('#all-note').show();
	        	});
				$('#nav-mynote').click(function() {
					$('#all-note').hide();
	        		$('#my-note').show();
				});
			</script>
            <div data-role='footer' data-position='fixed' data-theme="c">
                <!-- data-role='navbar'는 앱스럽게 탭메뉴를 구성할 수 있도록 해준다. 가로 최대:5개 -->
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