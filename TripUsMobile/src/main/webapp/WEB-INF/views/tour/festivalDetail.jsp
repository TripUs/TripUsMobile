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
    </head>
    <body>
        <div data-role='page'>
            <div data-role='header' data-position='fixed' style="background-color: #F05562; color: white;">
                <a href="#" data-rel="back" class="ui-btn ui-shadow ui-icon-mybackicon ui-btn-icon-left ui-btn-icon-notext ui-corner-all">Back</a>
                <h1>${basicInfo.title }</h1>
            </div>
            <div data-role='content' style="background-color: white;">
                <div data-role="controlgroup" data-type="horizontal">
                	<c:if test="${basicInfo.firstimage eq '데이터 없음' }">
						<img class="detail-area-img" src="http://localhost:8080/tripus/resources/imgs/no_img.jpg"/>			
					</c:if>
	            	<c:if test="${basicInfo.firstimage ne '데이터 없음' }">
		            	<img class="detail-area-img" src="${basicInfo.firstimage }"/>			
	            	</c:if>
					<c:if test="${likeflag eq 1 }">
						<a id="likebutton" class="mytrip-detail-btn" data-role="button" style="background-color: white; color: black;" href="#" onclick="likeupdate()"><span style="color: red;">♥</span> ${likeCnt }</a>
					</c:if>
					<c:if test="${likeflag ne 1 }">
						<a id="likebutton" class="mytrip-detail-btn" data-role="button" style="background-color: white; color: black;" href="#" onclick="likeupdate()">♥ ${likeCnt }</a>
					</c:if>
					<c:if test="${sessionScope.mytripCode ne 0}">
						<a class="mytrip-detail-btn" id="addmytrip-festival" data-role="button" style="background-color: white; color: black;" href="../addmytrip_list/${basicInfo.contentid }">내 여행지 추가</a>
					</c:if>
					<c:if test="${sessionScope.mytripCode eq 0}">
						<a class="mytrip-detail-btn" id="addmytrip-festival" onclick="addmytripfestival()" data-role="button" style="background-color: white; color: black;" href="#">내 여행지 추가</a>
					</c:if>
				</div>
				
				<div id="mytrip-festival" style="display: none; position: fixed; top: 10%; width: 80%; left: 5%; z-index: 100; background-color: white; border: 5px solid #F05562; border-radius: 20px; padding: 15px;">
					<h4></h4>
					<ul id="mytripfestival" data-role="listview" data-inset="true"></ul>
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
					var contenttypeid = ${basicInfo.contenttypeid };
					var title = $('#title').val();
					var firstimage = $('#firstimage').val();
					var mapx = ${basicInfo.mapx };
					var mapy = ${basicInfo.mapy };
					var areacode = ${basicInfo.areacode };
					var sigungucode = ${basicInfo.sigungucode };
					var userInfo = $('#userInfoid').val();
					var usertripcode = $('#usertripcode').val();
					
					function likeupdate() {
						if(userInfo != '') {
							$.ajax({ 
					        	url: "../likeupdate",
					            type:'POST', 					 
					            data:{ 
					            	contentid : contentid,
					            	contenttypeid : contenttypeid,
					            	title : title,
					            	firstimage : firstimage,
					            	mapx : mapx,
					            	mapy : mapy,
					            	areacode : areacode,
					            	sigungucode : sigungucode,
					            	likeCnt : likeCnt,
					            	likeflag : likeflag
					            }, 
					            success : function(data){
					            	likeflag = data;
					            	if(likeflag == 1) { 
					            		likeCnt++;
					            		$('#likebutton').html('<span style="color: red;">♥</span> ' + likeCnt);
					            	}
					            	else {
					            		likeCnt--;
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
						$('#mytrip-festival').hide();
					};
					
					function addmytripfestival() {
						if(userInfo == '') {
							alert('로그인 후 사용하실 수 있습니다.');
						} else {
							$.ajax({ 
					        	url: "../getMyTrip",
					            type:'POST', 					 
					            success : function(data){
					            	var usernicname = $('#usernicname').val();
					            	$('#mytrip-festival div').html('');
					            	if(data.length != 0) {
					            		$('#mytrip-festival h4').html(usernicname + '님의 여행목록');
					            		$('#mytripfestival').html("<li class='ui-li-has-thumb ui-first-child ui-last-child' data-icon='plus'>"
													+ "<a onclick='tripDetail(" + data[0]['code'] + ")' href='#'>"
					            					+ "<img src='" + data[0]['coverimg'] + "' style='width: 100%; height: 100%;'/>"
					            					+ "<h2>[" + data[0]['thema'] + "] " + data[0]['title'] + "</h2>"
					            					+ "<p>" + data[0]['startdate'] + " ~ " + data[0]['enddate'] + "</p></a></li>");
					            		for(var i=1; i<data.length; i++) {
						            		$('#mytripfestival').html("<li class='ui-li-has-thumb ui-first-child ui-last-child' data-icon='plus'>"
													+ "<a onclick='tripDetail("+data[i]['code']+")' href='#'><img src='" + data[i]['coverimg'] + "' style='width: 100%; height: 100%;'/>"
											        + "<h2>[" + data[i]['thema'] + "] " + data[i]['title'] + "</h2>"
											        + "<p>" + data[i]['startdate'] + " ~ " + data[i]['enddate'] + "</p></a></li>");
							            }
					            		$('#mytripfestival').append('<button onclick="removeTripPop()" class="ui-btn ui-shadow ui-corner-all ui-last-child" style="background-color: #F05562; color: white;">취소</button>');
								        $('#mytripfestival').listview('refresh');
					            	} else {
					            		$('#mytrip-festival').html('<h4>' + usernicname + '님의 여행목록이 없습니다.</h4>'
						            				+ '<p>새로운 여행을 추가하시겠습니까?</p>'
						            				+ '<a class="ui-btn" href="../addmytrip">여행 추가</a>'
						            				+ '<a onclick="removeTripPop()" class="ui-btn" href="#">취소</a><br/>');
					            	} 
					            	$('#mytrip-festival').show();
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
				            	$('#mytrip-festival div').html('');
				            	$('#mytrip-festival h4').html('여행지 추가');
				            	$('#mytripfestival').html('<li class="ui-first-child ui-last-child" data-icon="plus">'
										+ '<a onclick="addTrip(' + data[0]['code'] + ', \'' + data[0]['tripdate'] + '\')" href="#">'
								        + '<h2>여행 ' + data[0]['daynum'] + '일차 - ' + data[0]['tripdate'] + '</h2></a></li>');
								for(var i=1; i<data.length; i++) {
									$('#mytripfestival').append('<li class="ui-first-child ui-last-child" data-icon="plus">'
										+ '<a onclick="addTrip(' + data[i]['code'] + ', \'' + data[i]['tripdate'] + '\')" href="#">'
									    + '<h2>여행 ' + data[i]['daynum'] + '일차 - ' + data[i]['tripdate'] + '</h2></a></li>');
								}
			            		$('#mytripfestival').append('<button onclick="removeTripPop()" class="ui-btn ui-shadow ui-corner-all ui-last-child" style="background-color: #F05562; color: white;">취소</button>');
				            	$('#mytripfestival').listview('refresh');
				            	$('#mytrip-festival').show();
				            }, 
				            error : function(){ 
				            	alert('AJAX 통신 실패'); 
				            } 
				        });
					};
					
					function addTrip(code, tripdate) {
						$('#mytrip-festival h4').html('<h4>여행지에 추가하시겠습니까?</h4>');
						$('#mytripfestival').html('');
						$('#mytripfestival').listview('refresh');
						$('#mytrip-festival div').html('<button onclick="addTrip2(' + code + ', \'' + tripdate + '\')">추가</button><button onclick="removeTripPop()">취소</button>');
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
				            	$('#mytrip-festival').hide();
				           	}, 
				            error : function(){ 
				            	alert('AJAX 통신 실패'); 
				            } 
				        });
					};
				</script>
				
				<div style="padding-left: 10px; padding-right: 10px; position: relative; top: -48px;">
					<div style="padding: 5px;">
						<table style="width: 100%; font-size: 14px;">
							<c:if test="${basicInfo.overview ne '데이터 없음' }">
								<tr>
									<th colspan="4" style="font-size: 16px; width: 100%; border-bottom: 3px solid #e9e9e9; margin-bottom: 10px; padding-bottom: 5px; text-align: left;">${basicInfo.title } 소개</th>
								</tr>
								<tr>
									<td colspan="4">${basicInfo.overview }</td>
								</tr>
								<tr><td colspan="4">&nbsp;</td></tr>
							</c:if>
							<c:if test="${basicInfo.homepage ne '데이터 없음' }">
								<tr>
									<th colspan="4" style="text-align: left;">${basicInfo.homepage }</th>
								</tr>
							</c:if>
							<c:if test="${basicInfo.tel ne '데이터 없음' }">
								<tr>
									<th width="30%" style="text-align: left;">전화</th>
									<td colspan="3">${basicInfo.tel }</td>
								</tr>
							</c:if>
							<c:if test="${detailInfo.eventstartdate ne '데이터 없음' }">
									<tr>
										<th width="30%" style="text-align: left;">행사기간</th>
										<td colspan="3">${detailInfo.eventstartdate }~${detailInfo.eventenddate }</td>
									</tr>
								</c:if>
						</table>
					</div>
					<div style="width: 100%; border-bottom: 3px solid #e9e9e9; margin-top: 10px; padding-left: 5px; padding-bottom: 5px; margin-bottom: 10px;">
						<a id="festivaldetaila" href="#" style="text-decoration: none; color: #F05562; font-size: 16px; font-weight: bold;">
							행사·축제 상세정보 +
						</a>
					</div>
					
					<div id="festivaldetailpop" style="display: none; padding-left: 5px; margin-bottom: 20px;">
						<table style="font-size: 14px;">
							<tbody>
								<c:if test="${detailInfo.agelimit ne '데이터 없음' }">
									<tr>
										<th width="30%" style="text-align: left;">관람연령</th>
										<td colspan="3">${detailInfo.agelimit }</td>
									</tr>
								</c:if>
								<c:if test="${detailInfo.usetimefestival ne '데이터 없음' }">
									<tr>
										<th width="30%" style="text-align: left;">이용요금</th>
										<td colspan="3">${detailInfo.usetimefestival }</td>
									</tr>
								</c:if>
								<c:if test="${detailInfo.bookingplace ne '데이터 없음' }">
									<tr>
										<th width="30%" style="text-align: left;">예매처</th>
										<td colspan="3">${detailInfo.bookingplace }</td>
									</tr>
								</c:if>
								<c:if test="${detailInfo.discountinfofestival ne '데이터 없음' }">
									<tr>
										<th width="30%" style="text-align: left;">할인정보</th>
										<td colspan="3">${detailInfo.discountinfofestival }</td>
									</tr>
								</c:if>
								<c:if test="${detailInfo.festivalgrade ne '데이터 없음' }">
									<tr>
										<th width="30%" style="text-align: left;">축제등급</th>
										<td colspan="3">${detailInfo.festivalgrade }</td>
									</tr>
								</c:if>
								<c:if test="${detailInfo.spendtimefestival ne '데이터 없음' }">
									<tr>
										<th width="30%" style="text-align: left;">소요시간</th>
										<td colspan="3">${detailInfo.spendtimefestival }</td>
									</tr>
								</c:if>
								<c:if test="${detailInfo.subevent ne '데이터 없음' }">
									<tr>
										<th width="30%" style="text-align: left;">부대행사</th>
										<td colspan="3">${detailInfo.subevent }</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>
					
					<script type="text/javascript">
						var flag = 1;
						$('#festivaldetaila').click(function() {
							if(flag == 1) {
								flag = 0;
								$('#festivaldetailpop').show();
								$('#festivaldetaila').html('행사·축제 상세정보 -');
							}
							else {
								flag = 1;
								$('#festivaldetailpop').hide();
								$('#festivaldetaila').html('행사·축제 상세정보 +');
							}
						});
					</script>
					
					<!-- User Image -->
					<div style="width: 100%; background-color: white; border-bottom: 3px solid #e9e9e9; margin-top: 20px; margin-bottom: 10px;">
			        	<table style="width: 100%;">
			        		<tr>
			        			<td style="padding-left: 5px; font-size: 16px; color: #F05562; font-weight: bold; margin-bottom: 10px;">사진정보</td>
			        			<td align="right" style="padding-right: 5px;"><a href="#" onclick="showfestivalImg()" style="text-decoration: none; color: gray; font-size: 14px;">사진추가</a></td>
			        		</tr>
			        	</table>
			        </div>
			        <div id="festivalupimg" class="img-slider" style="border: none; margin-bottom: 20px;">
						<c:forEach items="${areaImg }" var="imgName">
					       	<div>
						    	<a href="#" style="text-decoration: none; color: gray;">
					            	<img class="slide-img" src="${imgName }" style="border-radius: 10px;"/>
					            </a>
					       	</div>    
					    </c:forEach>
						<div>
						    <a href="../allImg/${basicInfo.contentid }" data-transition="slide" style="text-decoration: none; color: gray;">
						       	<img class="slide-img" src="../resources/imgs/addImg.png" style="border-radius: 10px;"/>
						   	</a>
						</div>
					</div>
				    
			        <div id="festivalpop" style="border: 2px solid #F05562; border-radius: 10px; display: none; width: 90%; position: fixed; top: 30%; left: 5%; z-index: 100;">
				        <form id="fileFormfestival" action="uploadImg" method="post" enctype="multipart/form-data" data-ajax="false" style="background-color: white;">
							<div style="padding: 10px;">
								<input type="hidden" name="contentid" value="${basicInfo.contentid }"/>
								<input style="z-index: 100" type="file" id="uploadfestival" name="file"/>
								<a href="#" class="ui-btn ui-btn-inline" style="color: white; background-color: #F05562; box-sizing: border-box; display: inline-block; width: 45%; z-index: 100" onclick="uploadimage()">업로드</a>
								<a href="#" class="ui-btn ui-btn-inline" style="color: white; background-color: #F05562; box-sizing: border-box; display: inline-block; width: 45%; z-index: 100" onclick="hidefestivalImg()">취소</a>
							</div>
						</form>
				    </div>
		
					<script type="text/javascript">
				        function showfestivalImg() {
				        	if(userInfo == '') {
								alert('로그인 후 사용하실 수 있습니다.');
							} else {
				        		$('#festivalpop').show();
							}
				        };
				        
				        function hidefestivalImg() {
				        	$('#festivalpop').hide();
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
	                 		var form = $('#fileFormfestival')[0];
	                        var formData = new FormData(form);
	                        $.ajax({
	                        	url: '../uploadImg',
	                            processData: false,
	                            contentType: false,
	                            data: formData,
	                            type: 'POST',
	                            success: function(data){
	                            	$('#festivalpop').hide();
	                            	$('#festivalupimg').append('<div>'
	    					    			+ '<a href="#" style="text-decoration: none; color: gray;">'
	    				            		+ '<img class="slide-img" src="' + data + '" style="border-radius: 10px;"/></a></div>');
	                            	createSlick();
	                            	$(window).on('resize', createSlick);
	                            }
	                    	});
	                    };
			        </script>
	                
	                <!-- 지도보기 버튼 -->
					<div style="width: 100%; background-color: white; border-bottom: 3px solid #e9e9e9; margin-bottom: 10px;">
			        	<table style="width: 100%;">
			        		<tr>
			        			<td style="padding-left: 5px; font-size: 16px; color: #F05562; font-weight: bold; margin-bottom: 10px;">위치정보(지도)</td>
			        		</tr>
			        	</table>
			        </div>
					<form action="../detailmap" method="post" style="margin-bottom: 20px;">
						<input type="hidden" name="title" value="${basicInfo.title }" />
						<input id="mapx" type="hidden" name="mapx" value="${basicInfo.mapx }" />
						<input id="mapy" type="hidden" name="mapy" value="${basicInfo.mapy }" />
						
						<button style="width: 100%; height: 50px; padding: 0px; background-color: white; border: 2px solid #F05562; border-radius: 10px;">
							<img src="../resources/imgs/icon/map.png" style="width: 30px; position: relative; top: 5px; left: 0px;">
							<c:if test="${basicInfo.addr1 ne '데이터 없음' }">						
								<span style="line-height: 50px; font-size: 14px;">&nbsp;${basicInfo.addr1 }</span>
							</c:if>
						</button>
					</form>
	                
			        <div style="width: 100%; background-color: white; border-bottom: 3px solid #e9e9e9; margin-bottom: 10px;">
			        	<table style="width: 100%;">
			        		<tr>
			        			<td style="padding-left: 5px; font-size: 16px; color: #F05562; font-weight: bold; margin-bottom: 10px;">
			        				<a class="review-btn" style="color: #F05562">리뷰 +</a>
								</td>
			        		</tr>
			        	</table>
			        </div>
			        <div class="review-table" style="display: none;">
				    	<c:forEach items="${review }" var="bean">
			      			<div style="padding: 0px 10px; margin: 10px 0px; border: 2px solid #e9e9e9; border-radius: 10px;">
				   				<table style="widows: 100%; font-size: 14px;">
				           			<tr>
				           				<td width="35px"><img src="${bean.profile }" style="width: 35px; height: 35px;"/></td>
				           				<td style="padding-left: 10px;">
				           					<strong>${bean.nicname }</strong>
				           				</td>
				           				<td >
				           					<jsp:useBean id="now" class="java.util.Date" />
											<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
											<c:if test="${today eq bean.reporting_date }">
					           					&nbsp;&nbsp;<small>${bean.reporting_time }</small>
					           					<img src="../resources/imgs/icon/newicon.png" style="width: 20px; height: 20px; position: relative; top: 5px;"/>
					           				</c:if>
											<c:if test="${today ne bean.reporting_date }">
					           					&nbsp;&nbsp;<small>${bean.reporting_date }</small>
											</c:if>
				           				</td>
				           			</tr>
				           			<tr>
				           				<td>&nbsp;</td>
				            			<td colspan="2" style="padding-left: 10px; padding-bottom: 10px;">${bean.review }</td>
				            		</tr>
					        	</table>
				      		</div>
			      		</c:forEach>
						<div data-role='fieldcontain'>
							<input id="review" name="review" type="text" placeholder="리뷰를 등록하세요" />
							<button id="review_add" style="border: 2px solid #F05562; border-radius: 10px; background-color: white; color: #F05562;">입력</button>
						</div>
			      	</div>
				</div>
			</div>
			<script type="text/javascript">				
				var flag = 1;
				$('.review-btn').click(function() {
					if(flag == 1) {
						flag = 0;
						$('.review-table').show();
						$('.review-btn').html('리뷰 -');
					}
					else {
						flag = 1;
						$('.review-table').hide();
						$('.review-btn').html('리뷰 +');
					}
				});

			
				var nicname = $("#usernicname").val();
			    var profile = $("#userprofile").val();
				var url = '../detail/' + ${basicInfo.contentid };
				var d = new Date();
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
				            	$('.review-table').prepend('<div style="padding: 0px 10px; margin: 10px 0px; border: 2px solid #e9e9e9; border-radius: 10px;">'
						   				+ '<table style="widows: 100%; font-size: 14px;">'
						           		+ '<tr><td width="35px"><img src="${sessionScope.userInfo.profile }" style="width: 35px; height: 35px;"/></td>'
						           		+ '<td style="padding-left: 10px;"><strong>${sessionScope.userInfo.nicname }</strong></td>'
						           		+ '<td>&nbsp;&nbsp;<small>' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds() + '</small>'
							           	+ '&nbsp;<img src="../resources/imgs/icon/newicon.png" style="width: 20px; height: 20px; position: relative; top: 5px;"/></td></tr>'
						           		+ '<tr><td>&nbsp;</td><td colspan="2" style="padding-left: 10px; padding-bottom: 10px;">' + review + '</td></tr>'
							        	+ '</table></div>');
				            	$("#review").val('');
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
			
			<div data-role='footer' data-position='fixed' data-theme="c">
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