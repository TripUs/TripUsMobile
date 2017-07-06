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
                <h1><img src="../resources/imgs/icon/comment2.png" style="position: relative; top: 5px; width: 30px; height: 20px;"/> &nbsp;댓글</h1>
            </div>
        	
            <div data-role='content' style="padding: 0px 10px;">
      			<div id="comment-table" >
	      		<c:forEach items="${comment }" var="bean">
      				<div style="padding: 0px 10px; margin: 10px 0px; border: 2px solid #e9e9e9; border-radius: 10px;">
	   					<table style="widows: 100%;">
	            			<tr>
	            				<td width="35px"><img src="${bean.userprofile }" style="width: 35px; height: 35px;"/></td>
	            				<td style="padding-left: 10px;">
	            					<strong>${bean.usernicname }</strong>
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
	            				<td style="text-align: right;">
	            					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            					<a href="#" style="text-decoration: none; color: gray;">답글</a>
	            				</td>
	            			</tr>
	            			<tr>
	            				<td>&nbsp;</td>
	            				<td colspan="2" style="padding-left: 10px;">${bean.usercomment }</td>
	            			</tr>
		           		</table>
	      			</div>
      			</c:forEach>
      			</div>
      			
      			<div>
      				<textarea id="note_comment" name="comment"></textarea>
      				<button id="commentbtn" style="background-color: #F05562; color: white;">작성</button>
      			</div>
      			
      			<fmt:formatDate value="${now}" pattern="hh:mm:ss" var="curr"/>
      			<input type="hidden" id="note_idx" value="${idx }"/>
      
      			<script type="text/javascript">
      				$('#commentbtn').click(function() {
      					var url = "../notecomment/" + $('#note_idx').val();
      					var comment = $('#note_comment').val();
      					$.ajax({ 
					       	url: url,
					        type:'POST', 					 
					        data:{ 
					          	idx : $('#note_idx').val(),
					           	comment : comment
					        }, 
					        success : function(data){
					        	$('#comment-table').prepend('<div style="padding: 0px 10px; margin: 10px 0px; border: 2px solid #e9e9e9; border-radius: 10px;">'
					        			+ '<table id="comment-table" style="widows: 100%; margin-bottom: 10px;"><tr>'
			            				+ '<td width="35px"><img src="${sessionScope.userInfo.profile }" style="width: 35px; height: 35px;"/></td>'
			            				+ '<td style="padding-left: 10px;"><strong>${sessionScope.userInfo.nicname }</strong></td>'
			            				+ '<td >&nbsp;&nbsp;<small>${curr }</small>'
				            			+ '<img src="../resources/imgs/icon/newicon.png" style="width: 20px; height: 20px; position: relative; top: 5px;"/>'
				            			+ '</td><td style="text-align: right;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
			            				+ '<a href="#" style="text-decoration: none; color: gray;">답글</a></td></tr>'
			            				+ '<tr><td>&nbsp;</td><td colspan="2" style="padding-left: 10px;">' + comment + '</td></tr></table></div>');
					        }, 
					        error : function(){ 
					           	alert('AJAX 통신 실패'); 
					        } 
					    });
      				});
      			</script>
      
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