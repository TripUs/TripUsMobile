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
	    <script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=0f2e3ff280f258cf4dc5f49a68d055b8&libraries=services"></script>
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
        <div data-role='page'>
            <div data-role='header' data-position='fixed' style="background-color: #F05562; color: white;">
                <a href="#" data-rel="back" class="ui-btn ui-shadow ui-icon-arrow-l ui-btn-icon-left ui-btn-icon-notext ui-corner-all">Back</a>
                <h1>${basicInfo.title }</h1>
            </div>
            <div data-role='content' style="background-color: white;">
                <div data-role="controlgroup" data-type="horizontal">
	            	<img class="detail-area-img" src="${basicInfo.firstimage }"/>			
					<c:if test="${likeflag eq 1 }">
						<a id="likebutton" class="mytrip-detail-btn" data-role="button" style="background-color: white; color: black;" href="#" onclick="likeupdate()"><span style="color: red;">♥</span> ${likeCnt }</a>
					</c:if>
					<c:if test="${likeflag ne 1 }">
						<a id="likebutton" class="mytrip-detail-btn" data-role="button" style="background-color: white; color: black;" href="#" onclick="likeupdate()">♥ ${likeCnt }</a>
					</c:if>
					<c:if test="${sessionScope.mytripCode ne null}">
						<a class="mytrip-detail-btn" id="addmytrip-food" data-role="button" style="background-color: white; color: black;" href="../addmytrip_list/${basicInfo.contentid }">내 여행지 추가</a>
					</c:if>
					<c:if test="${sessionScope.mytripCode eq null}">
						<a class="mytrip-detail-btn" id="addmytrip-food" onclick="addmytripfood()" data-role="button" style="background-color: white; color: black;" href="#">내 여행지 추가</a>
					</c:if>
				</div>
				
				<div id="mytrip-food" style="display: none; position: fixed; top: 10%; width: 80%; left: 5%; z-index: 100; background-color: white; border: 5px solid #F05562; border-radius: 20px; padding: 15px;">
					<h4></h4>
					<ul id="mytripfood" data-role="listview" data-inset="true"></ul>
					<div></div>
				</div>
				
				<input type="hidden" id="usertripcode" value="${sessionScope.mytripCode }">
				<input type="hidden" id="userInfoid" value="${sessionScope.userInfo.id }">
				<input id="userprofile" type="hidden" name="userprofile" value="${sessionScope.userInfo.profile }" />
				<input id="usernicname" type="hidden" name="usernicname" value="${sessionScope.userInfo.nicname }" />
				<input id="mytripcode" type="hidden" name="mytripcode" value="${sessionScope.mytripCode }" />
				<input id="firstimage" type="hidden" name="firstimage" value="${basicInfo.firstimage }" />
				<input id="title" type="hidden" name="title" value="${basicInfo.title }" />
				
								
				<script type="text/javascript">
					var likeflag = ${likeflag };
					var likeCnt = ${likeCnt };
					var contentid = ${basicInfo.contentid };
					var userInfo = $('#userInfoid').val();
					var usertripcode = $('#usertripcode').val();
					
					function likeupdate() {
						if(userInfo != '') {
							$.ajax({ 
					        	url: "../likeupdate",
					            type:'POST', 					 
					            data:{ 
					            	contentid : contentid,
					            	likeflag : likeflag
					            }, 
					            success : function(data){
					            	likeflag = data;
					            	if(likeflag == 1) { 
					            		likeCnt = likeCnt + 1;
					            		$('#likebutton').html('<span style="color: red;">♥</span> ' + likeCnt);
					            	}
					            	else {
					            		likeCnt = likeCnt - 1;
					            		$('#likebutton').html('♥ ' + likeCnt);
					            	}
					            }, 
					            error : function(){ 
					            	alert('AJAX 통신 실패'); 
					            } 
					        });		
						} else {
							alert('로그인 후 사용하실 수 있습니다.');
						}
					};
					
					function removeTripPop() {
						$('#mytrip-food').hide();
					};
					
					function tripDetail(data) {
						
					};
					
					function addmytripfood() {
						if(userInfo == '') {
							alert('로그인 후 사용하실 수 있습니다.');
						} else {
							$.ajax({ 
					        	url: "../getMyTrip",
					            type:'POST', 					 
					            success : function(data){
					            	var usernicname = $('#usernicname').val();
					            	$('#mytrip-food div').html('');
					            	if(data.length != 0) {
					            		$('#mytrip-food h4').html(usernicname + '님의 여행목록');
					            		$('#mytripfood').html("<li class='ui-li-has-thumb ui-first-child ui-last-child' data-icon='plus'>"
													+ "<a onclick='tripDetail(" + data[0]['code'] + ")' href='#'>"
					            					+ "<img src='" + data[0]['coverimg'] + "' style='width: 100%; height: 100%;'/>"
					            					+ "<h2>[" + data[0]['thema'] + "] " + data[0]['title'] + "</h2>"
					            					+ "<p>" + data[0]['startdate'] + " ~ " + data[0]['enddate'] + "</p></a></li>");
					            		for(var i=1; i<data.length; i++) {
						            		$('#mytripfood').html("<li class='ui-li-has-thumb ui-first-child ui-last-child' data-icon='plus'>"
													+ "<a onclick='tripDetail("+data[i]['code']+")' href='#'><img src='" + data[i]['coverimg'] + "' style='width: 100%; height: 100%;'/>"
											        + "<h2>[" + data[i]['thema'] + "] " + data[i]['title'] + "</h2>"
											        + "<p>" + data[i]['startdate'] + " ~ " + data[i]['enddate'] + "</p></a></li>");
							            }
					            		$('#mytripfood').append('<button onclick="removeTripPop()" class="ui-btn ui-shadow ui-corner-all ui-last-child" style="background-color: #F05562; color: white;">취소</button>');
								        $('#mytripfood').listview('refresh');
					            	} else {
					            		$('#mytrip-food').html('<h4>' + usernicname + '님의 여행목록이 없습니다.</h4>'
						            				+ '<p>새로운 여행을 추가하시겠습니까?</p>'
						            				+ '<a class="ui-btn" href="../addmytrip">여행 추가</a>'
						            				+ '<a onclick="removeTripPop()" class="ui-btn" href="#">취소</a><br/>');
					            	} 
					            	$('#mytrip-food').show();
					            }, 
					            error : function(){ 
					            	alert('AJAX 통신 실패'); 
					            } 
					        });
						}
					};
					
					function tripDetail(paramdata) {
						$.ajax({ 
				        	url: "../getMyTripDetail",
				            type:'POST',
				            data: {
				            	mytripcode: paramdata
				            },
				            success : function(data){
				            	$('#mytrip-food div').html('');
				            	$('#mytrip-food h4').html('여행지 추가');
				            	$('#mytripfood').html('<li class="ui-first-child ui-last-child" data-icon="plus">'
										+ '<a onclick="addTrip(' + data[0]['code'] + ', \'' + data[0]['tripdate'] + '\')" href="#">'
								        + '<h2>여행 ' + data[0]['daynum'] + '일차 - ' + data[0]['tripdate'] + '</h2></a></li>');
								for(var i=1; i<data.length; i++) {
									$('#mytripfood').append('<li class="ui-first-child ui-last-child" data-icon="plus">'
										+ '<a onclick="addTrip(' + data[i]['code'] + ', \'' + data[i]['tripdate'] + '\')" href="#">'
									    + '<h2>여행 ' + data[i]['daynum'] + '일차 - ' + data[i]['tripdate'] + '</h2></a></li>');
								}
			            		$('#mytripfood').append('<button onclick="removeTripPop()" class="ui-btn ui-shadow ui-corner-all ui-last-child" style="background-color: #F05562; color: white;">취소</button>');
				            	$('#mytripfood').listview('refresh');
				            	$('#mytrip-food').show();
				            }, 
				            error : function(){ 
				            	alert('AJAX 통신 실패'); 
				            } 
				        });
					};
					
					function addTrip(code, tripdate) {
						$('#mytrip-food h4').html('<h4>여행지에 추가하시겠습니까?</h4>');
						$('#mytripfood').html('');
						$('#mytripfood').listview('refresh');
						$('#mytrip-food div').html('<button onclick="addTrip2(' + code + ', \'' + tripdate + '\')">추가</button><button onclick="removeTripPop()">취소</button>');
					};
					
					function addTrip2(code, tripdate) {
						alert(tripdate);
						$.ajax({ 
				        	url: "../addTrip",
				            type:'POST',
				            data: {
				            	contentid: contentid,
				            	code: code,
				            	title: $('#title').val(),
				            	tripdate: tripdate,
				            	firstimage: $('#firstimage').val(),
				            	mapx: $('#mapx').val(),
				            	mapy: $('#mapy').val()
				            },
				            success : function(data){
				            	$('#mytrip-food').hide();
				           	}, 
				            error : function(){ 
				            	alert('AJAX 통신 실패'); 
				            } 
				        });
					};
				</script>
				
				<div style="padding-left: 10px; padding-right: 10px; position: relative; top: -48px;">
					<form action="../detailmap" method="post">
						<input type="hidden" name="title" value="${basicInfo.title }" />
						<input id="mapx" type="hidden" name="mapx" value="${basicInfo.mapx }" />
						<input id="mapy" type="hidden" name="mapy" value="${basicInfo.mapy }" />
						<button>지도보기</button>
					</form>
					
					<div style="padding: 5px;">
						<table>
							<c:if test="${basicInfo.overview ne '데이터 없음' }">
								<tr>
									<th colspan="4" style="text-align: left;">${basicInfo.title } 소개</th>
								</tr>
								<tr>
									<td colspan="4">${basicInfo.overview }</td>
								</tr>
								<tr><td colspan="4">&nbsp;</td></tr>
							</c:if>
							<c:if test="${basicInfo.addr1 ne '데이터 없음' }">						
								<tr>
									<th style="text-align: left;">위치</th>
									<td colspan="3">${basicInfo.addr1 }</td>
								</tr>
							</c:if>
							<c:if test="${basicInfo.tel ne '데이터 없음' }">
								<tr>
									<th style="text-align: left;">전화</th>
									<td colspan="3">${basicInfo.tel }</td>
								</tr>
							</c:if>
							<c:if test="${basicInfo.homepage ne '데이터 없음' }">
								<tr>
									<th colspan="4" style="text-align: left;">${basicInfo.homepage }</th>
								</tr>
							</c:if>
							<c:if test="${detailInfo.firstmenu ne '데이터 없음' }">
								<tr>
									<th style="text-align: left;">대표메뉴</th>
									<td colspan="3">${detailInfo.firstmenu }</td>
								</tr>
							</c:if>
						</table>
					</div>
					<div data-role="collapsible" data-enhanced="true" class="ui-collapsible ui-collapsible-inset ui-corner-all ui-collapsible-collapsed">
						<h4 class="ui-collapsible-heading ui-collapsible-heading-collapsed">
							<a href="#" class="ui-collapsible-heading-toggle ui-btn ui-btn-icon-left ui-icon-plus" style="border-bottom: 2px solid #cccccc; background-color: white;">
								식당 상세정보
								<div class="ui-collapsible-heading-status">click to expand contents</div>
							</a>
						</h4>
						<div class="ui-collapsible-content ui-collapsible-content-collapsed" aria-hidden="true">
							<table>
								<tbody>
									<c:if test="${detailInfo.treatmenu ne '데이터 없음' }">
										<tr>
											<th width="30%">메뉴</th>
											<td colspan="3">${detailInfo.treatmenu }</td>
										</tr>
									</c:if>
									<c:if test="${detailInfo.reservationfood ne '데이터 없음' }">
										<tr>
											<th width="30%">예약안내</th>
											<td colspan="3">${detailInfo.reservationfood }</td>
										</tr>
									</c:if>
									<c:if test="${detailInfo.opentimefood ne '데이터 없음' }">
										<tr>
											<th width="30%">영업시간</th>
											<td colspan="3">${detailInfo.opentimefood }</td>
										</tr>
									</c:if>
									<c:if test="${detailInfo.restdatefood ne '데이터 없음' }">
										<tr>
											<th width="30%">쉬는날</th>
											<td colspan="3">${detailInfo.restdatefood }</td>
										</tr>
									</c:if>
									<c:if test="${detailInfo.firstmenu ne '데이터 없음' }">
										<tr>
											<th width="30%">할인정보</th>
											<td colspan="3">${detailInfo.firstmenu }</td>
										</tr>
									</c:if>
									<c:if test="${detailInfo.parkingfood ne '데이터 없음' }">
										<tr>
											<th width="30%">주차시설</th>
											<td colspan="3">${detailInfo.parkingfood }</td>
										</tr>
									</c:if>
									<c:if test="${detailInfo.packing ne '데이터 없음' }">
										<tr>
											<th width="30%">포장여부</th>
											<td colspan="3">${detailInfo.packing }</td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
					
					<div class="ui-corner-all custom-corners">
			        	<div class="ui-bar ui-bar-a" style="background-color: #F05562; border: 2px solid #F05562; border-radius: 5px;">
			           		<h3 style="color: white;">사진 정보</h3>
			           	</div>
			           	<div id="foodupimg" class="ui-body ui-body-a img-slider" style="border: none;">
							<c:forEach items="${areaImg }" var="imgName">
					           	<div>
							    	<a href="#" style="text-decoration: none; color: gray;">
						            	<img class="slide-img" src="${imgName }" style="border-radius: 10px;"/>
						            </a>
						       	</div>    
					        </c:forEach>
					        <div>
							    <a href="#" style="text-decoration: none; color: gray;">
						           	<img class="slide-img" src="../resources/imgs/addImg.png" style="border-radius: 10px;"/>
						       	</a>
						    </div>
					    </div>
					    <div>
					    	<a data-role="button" href="#" onclick="showfoodImg()" style="background-color: white; border: 2px solid #F05562; border-radius: 10px; color: #F05562;">사진 추가</a>
					    </div>
			        </div>
			        
			        <div id="foodpop" style="border: 2px solid #F05562; border-radius: 10px; display: none; width: 90%; position: fixed; top: 30%; left: 5%; z-index: 100;">
				        <form id="fileFormFood" action="uploadImg" method="post" enctype="multipart/form-data" data-ajax="false" style="background-color: white;">
							<div style="padding: 10px;">
								<input type="hidden" name="contentid" value="${basicInfo.contentid }"/>
								<input style="z-index: 100" type="file" id="uploadFood" name="file"/>
								<a href="#" class="ui-btn ui-btn-inline" style="color: white; background-color: #F05562; box-sizing: border-box; display: inline-block; width: 45%; z-index: 100" onclick="uploadimage()">업로드</a>
								<a href="#" class="ui-btn ui-btn-inline" style="color: white; background-color: #F05562; box-sizing: border-box; display: inline-block; width: 45%; z-index: 100" onclick="hidefoodImg()">취소</a>
							</div>
						</form>
				    </div>
		
					<script type="text/javascript">
				        function showfoodImg() {
				        	if(userInfo == '') {
								alert('로그인 후 사용하실 수 있습니다.');
							} else {
				        		$('#foodpop').show();
							}
				        };
				        
				        function hidefoodImg() {
				        	$('#foodpop').hide();
				        };
				    
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
		            	$(window).on('resize', createSlick);
				        
				        function uploadimage(){
	                 		var form = $('#fileFormFood')[0];
	                        var formData = new FormData(form);
	                        $.ajax({
	                        	url: '../uploadImg',
	                            processData: false,
	                            contentType: false,
	                            data: formData,
	                            type: 'POST',
	                            success: function(data){
	                            	$('#foodpop').hide();
	                            	$('#foodupimg').append('<div>'
	    					    			+ '<a href="#" style="text-decoration: none; color: gray;">'
	    				            		+ '<img class="slide-img" src="' + data + '" style="border-radius: 10px;"/></a></div>');
	                            	createSlick();
	                            	$(window).on('resize', createSlick);
	                            }
	                    	});
	                    };
			        </script>
	                
			        <div class="ui-corner-all custom-corners">
			        	<div class="ui-bar ui-bar-a" style="background-color: #F05562; border: 2px solid #F05562; border-radius: 5px;">
			           		<h3 style="color: white;">리뷰</h3>
			           	</div>
			           	<div class="ui-body ui-body-a" style="border: none;">
							<ul id="reviewfood" data-role="listview" data-inset="true">
							<c:forEach items="${review }" var="bean">
					           	 <li><a href="#" data-icon='false'>
					           	 	<img src="${bean.profile }" class="ui-corner-all"/>
					           	 	<p><strong>${bean.nicname }</strong></p>
					           	 	<p>${bean.review }</p>
					           	 </a></li>   
					        </c:forEach>
					        </ul>
					    </div>
					    <div>
					    	<div data-role='fieldcontain'>
								<input id="review" name="review" type="text" placeholder="리뷰를 등록하세요" />
								<button id="review_add" style="border: 2px solid #F05562; border-radius: 5px; background-color: white; color: #F05562;">입력</button>
							</div>
					    </div>
			        </div>
			        
					<script type="text/javascript">				
						var nicname = $("#usernicname").val();
					    var profile = $("#userprofile").val();
						var url = '../detail/' + ${basicInfo.contentid };
						$("#review_add").click(function(){
							var review = $("#review").val();
							if(nicname != '') {
								$.ajax({ 
						        	url: url, 	 
						            type:'POST', 					 
						            data:{
						            	review: $('#review').val()
						            }, 
						            success : function(data){ 
						            	$('#reviewfood').append("<li class='ui-li-has-thumb ui-first-child ui-last-child' data-icon='false'>"
	    										+ "<a href='#'>"
	        									+ "<img src='" + profile + "' class='ui-corner-all'/>"
	        									+ "<h2>" + nicname + "</h2>"
	        									+ "<p>" + review + "</p></a></li>");
						            	$('#reviewfood').listview('refresh');
						            }, 
						            error : function(){ 
						            	alert('AJAX 통신 실패'); 
						            } 
						        });					
							} else {
								alert('로그인 후 리뷰를 작성하세요');
							}
						});
					</script>
				</div>
			</div>
            <div data-role='footer' data-position='fixed'>
                <!-- data-role='navbar'는 앱스럽게 탭메뉴를 구성할 수 있도록 해준다. 가로 최대:5개 -->
                <div data-role='navbar'>
                    <ul>
                        <li>
                            <a data-icon='home' class="ui-btn-active ui-state-persist" href="../home">Home</a>
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