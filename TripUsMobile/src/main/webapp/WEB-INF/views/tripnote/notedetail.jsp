<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<link rel="stylesheet" href="../resources/css/themec.min.css"/>
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
        <div data-role='page' style="background-color: white;">
            <div data-role='header' data-position='fixed' style="background-color: #F05562; color: white;">
                <a href="#" data-rel="back" class="ui-btn ui-shadow ui-icon-mybackicon ui-btn-icon-left ui-btn-icon-notext ui-corner-all">Back</a>
                <h1>${noteInfo.usernicname }님의 여행기</h1>
            </div>
        	
            <div data-role='content' style="padding: 0px 10px;">
      			<div style="background-color: #e9e9e9; padding: 5px 20px; margin-top: 10px; margin-bottom: 5px; border-radius: 10px;">
      				<h3>${noteInfo.title }</h3>
      				<table>
            			<tr>
            				<td width="35px"><img src="${noteInfo.userprofile }" style="width: 35px; height: 35px;"/></td>
            				<td width="30%" style="padding-left: 10px;">
            					<strong>${noteInfo.usernicname }</strong><br/>
            					
            					<jsp:useBean id="now" class="java.util.Date" />
								<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
	
								<c:if test="${today eq noteInfo.reporting_date }">
	            					<small>${noteInfo.reporting_time }</small>
	            					<img src="../resources/imgs/icon/newicon.png" style="width: 20px; height: 20px; position: relative; top: 5px;"/>
								</c:if>
								<c:if test="${today ne noteInfo.reporting_date }">
	            					<small>${noteInfo.reporting_date }</small>
								</c:if>
            				</td>
            				<td>
            					<div data-role="controlgroup" data-type="horizontal" style="position:relative; top:-15px; left: 20px; height: 10px;">
					            	<c:if test="${noteLike eq 1 }">
										<a style="width: 45px; height: 10px; line-height: 10px;" id="notelikebtn" data-role="button" href="#"><span style="color: red;">♥</span> ${noteInfo.likeflag }</a>
									</c:if>
									<c:if test="${noteLike ne 1 }">
										<a style="width: 45px; height: 10px; line-height: 10px;" id="notelikebtn" data-role="button" href="#">♥ ${noteInfo.likeflag }</a>
									</c:if>
			            			<button style="width: 45px; height: 10px; line-height: 5px;"><small>팔로우</small></button>
								</div>
            				</td>
            			</tr>
            		</table>
            	</div>
      			
      			<input type="hidden" id="likeCnt" value="${noteInfo.likeflag }"/>
      			<input type="hidden" id="noteidx" value="${noteInfo.idx }"/>
      			<input type="hidden" id="noteLike" value="${noteLike }"/>
      			<input type="hidden" id="userInfo" value="${sessionScope.userInfo.id }">
				
      			<script type="text/javascript">
      				var idx = $('#noteidx').val();
      				var notelike = $('#noteLike').val();
	      			var likeCnt = $('#likeCnt').val();
      				var userInfo = $('#userInfo').val();
	      			
      				$('#notelikebtn').click(function() {
      					if(userInfo != '') {
							$.ajax({ 
					        	url: "../noteLike",
					            type:'POST', 					 
					            data:{ 
					            	idx : idx,
					            	likeflag : notelike,
					            	likeCnt : likeCnt
					            }, 
					            success : function(data){
					            	notelike = data;
					            	if(notelike == 1) { 
					            		likeCnt++;
					            		$('#notelikebtn').html('<span style="color: red;">♥</span> ' + likeCnt);
					            	}
					            	else {
					            		likeCnt--;
					            		$('#notelikebtn').html('♥ ' + likeCnt);
					            	}
					            }, 
					            error : function(){ 
					            	alert('AJAX 통신 실패'); 
					            } 
					        });		
						} else {
							alert('로그인 후 사용하실 수 있습니다.');
						}
					});
      			</script>
      			
      			<!-- Day Content -->
            	<c:forEach items="${contentInfo }" var="bean" varStatus="n">
            	<div class="ui-corner-all custom-corners">
            		<div class="ui-bar ui-bar-a" style="background: white; border: none;">
		            	<div style="box-sizing: border-box; padding-bottom: 5px; padding-left: 2px; border-bottom: 3px solid #e9e9e9;">
		            		<img src="../resources/imgs/icon/tripcon2.png" style="width: 30px; height: 23px; position: relative; top: 5px;"/>
					        <h3><span style="color: #F05562;">Day${bean.daynum }</span> - ${bean.title }</h3>
		            	</div>
		            </div>
		            <div class="ui-body ui-body-a" style="border: none;">
		            	<img src="${imgInfo[n.index].imgname }" width="100%"/>
		            	<p>${bean.content }</p>
		            </div>
				</div>
            	</c:forEach>
            	
            	<a href="../notecomment/${noteInfo.idx }" data-role="button" data-transition="slideup">
            		<img src="../resources/imgs/icon/comment.png" style="position: relative; top: 5px; width: 30px; height: 20px;"/>
            		&nbsp;&nbsp;댓글
            	</a>
            </div> <!-- end content -->
            
            <div data-role='footer' data-position='fixed' data-theme="c">
                <div data-role='navbar'>
                    <ul>
                        <li>
                            <a data-icon='home' href="../../tripus/">Home</a>
                        </li>
                        <li>
                            <a data-icon='calendar' href="../mytrip">내 여행</a>
                        </li>
                        <li>
                            <a data-icon='edit' class="ui-btn-active ui-state-persist" href="../tripnote">여행노트</a>
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