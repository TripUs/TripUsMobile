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
        <link rel="stylesheet" href="../resources/css/slick.css"/>
		<link rel="stylesheet" href="../resources/css/slick-theme.css"/>
        <link rel="stylesheet" href="../resources/css/tripus.css">
        <script src="http://code.jquery.com/jquery-1.12.4.min.js"
                  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
                  crossorigin="anonymous"></script>
        <script type="text/javascript" src="../resources/js/jquery-migrate-1.4.1.min.js"></script>
        <script type="text/javascript" src="../resources/js/jquery.mobile-1.4.5.min.js"></script>
        <script type="text/javascript" src="../resources/js/tripus.js"></script>
	    <title>Document</title>
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
					<a class="mytrip-detail-btn" id="addmytrip-food" onclick="addmytripfood()" data-role="button" style="background-color: white; color: black;" href="../addmytrip_list/${basicInfo.contentid }">내 여행지 추가</a>
				</div>
				
				<input type="hidden" id="usertripcode" value="${sessionScope.mytripCode }">
				<input type="hidden" id="userInfoid" value="${sessionScope.userInfo.id }">
				
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
					
					function addmytripfood() {
						if(userInfo == '') {
							alert('로그인 후 사용하실 수 있습니다.');
						} else {
							if(usertripcode == '') {
								alert('여행지목록 불러오기');							
							} else {
								
							}
						}
					};
				</script>
				
				<div style="padding-left: 10px; padding-right: 10px; position: relative; top: -48px;">
					<div style="border: 2px solid #F05562; border-radius: 5px; padding: 5px;">
						<table>
							<c:if test="${basicInfo.overview ne '데이터 없음' }">
								<tr>
									<th colspan="4">${basicInfo.title } 소개</th>
								</tr>
								<tr>
									<td colspan="4">${basicInfo.overview }</td>
								</tr>
								<tr><td colspan="4">&nbsp;</td></tr>
							</c:if>
							<c:if test="${basicInfo.addr1 ne '데이터 없음' }">						
								<tr>
									<th>위치</th>
									<td colspan="3">${basicInfo.addr1 }</td>
								</tr>
							</c:if>
							<c:if test="${basicInfo.tel ne '데이터 없음' }">
								<tr>
									<th>전화</th>
									<td colspan="3">${basicInfo.tel }</td>
								</tr>
							</c:if>
							<c:if test="${basicInfo.homepage ne '데이터 없음' }">
								<tr>
									<th colspan="4">${basicInfo.homepage }</th>
								</tr>
							</c:if>
							<c:if test="${detailInfo.firstmenu ne '데이터 없음' }">
								<tr>
									<th>대표메뉴</th>
									<td colspan="3">${detailInfo.firstmenu }</td>
								</tr>
							</c:if>
						</table>
					</div>
					<div data-role="collapsible" data-enhanced="true" class="ui-collapsible ui-collapsible-inset ui-corner-all ui-collapsible-collapsed">
						<h4 class="ui-collapsible-heading ui-collapsible-heading-collapsed">
							<a href="#" class="ui-collapsible-heading-toggle ui-btn ui-btn-icon-left ui-icon-plus" style="border: 2px solid #F05562; background-color: white;">
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
					           	<div class="swiper-slide">
							    	<a href="#" style="text-decoration: none; color: gray;">
						            	<img class="slide-img" src="${imgName }" style="border-radius: 10px;"/>
						            </a>
						       	</div>    
					        </c:forEach>
					        <div class="swiper-slide">
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
				        /* $('.img-slider').slick({
				        	dots : false,
				        	infinite : true,
				        	speed : 300,
				        	slidesToShow : 1,
				        	centerMode : true,
				        	variableWidth : false
				        }); */
				        
				        function showfoodImg() {
				        	$('#foodpop').show();
				        };
				        
				        function hidefoodImg() {
				        	$('#foodpop').hide();
				        };
				        
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
	                            	$('#foodupimg').prepend('<div class="swiper-slide">'
	    					    			+ '<a href="#" style="text-decoration: none; color: gray;">'
	    				            		+ '<img class="slide-img" src="' + data + '" style="border-radius: 10px;"/></a></div>');
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
								<input id="userprofile" type="hidden" name="userprofile" value="${sessionScope.userInfo.profile }" />
								<input id="usernicname" type="hidden" name="usernicname" value="${sessionScope.userInfo.nicname }" />
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