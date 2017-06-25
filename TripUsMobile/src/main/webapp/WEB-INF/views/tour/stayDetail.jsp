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
        <div data-role='page'>
            <div data-role='header'>
                <a href="#" data-rel="back" class="ui-btn ui-shadow ui-icon-arrow-l ui-btn-icon-left ui-btn-icon-notext">Back</a>
                <h1>${basicInfo.title }</h1>
            </div>
            <div data-role='content'>
                <div>
					<img class="detail-area-img" src="${basicInfo.firstimage }"/>			
				</div>
				<div>
					<a data-role="button" href="../addmytrip_list/${basicInfo.contentid }">내 여행지 추가하기</a>
				</div><br/>
				
				<div>
					mytripCode : ${sessionScope.mytripCode }
				</div>
				
				<div>
					${basicInfo.overview }
				</div>
				
				<div>
					${basicInfo.homepage }
				</div><br/>
				<div>
					주소 : ${basicInfo.addr1 } ${basicInfo.addr2 }
				</div><br/>
				<div>
					전화 : ${basicInfo.tel }
				</div><br/>
				
				<div>
					수용가능 인원 : ${detailInfo.accomcountlodging }
				</div><br/>
				<div>
					입실시간 : ${detailInfo.checkintime } &nbsp; &nbsp; &nbsp; 퇴실시간 : ${detailInfo.checkouttime }
				</div><br/>
				<div>
					객실내 취사 : ${detailInfo.goodstay }
				</div><br/>
				<div>
					굿스테이 : ${detailInfo.goodstay }
				</div><br/>
				<div>
					문의 및 안내 : ${detailInfo.infocenterlodging }
				</div><br/>
				<div>
					주차시설 : ${detailInfo.parkinglodging } &nbsp; &nbsp; &nbsp; 픽업 서비스 : ${detailInfo.pickup }
				</div><br/>
				<div>
					객실유형 : ${detailInfo.roomtype }  &nbsp; &nbsp; &nbsp; 객실 수 : ${detailInfo.roomcount }
				</div><br/>
				<div>
					예약 안내 : ${detailInfo.reservationlodging }
				</div><br/>
				<div>
					예약안내 홈페이지 : ${detailInfo.reservationurl }
				</div><br/>
				<div>
					규모 : ${detailInfo.scalelodging }
				</div><br/>
				
				<p><strong>시설 안내</strong></p>
				<div>
					바비큐장 : ${detailInfo.barbecue }  &nbsp; &nbsp; &nbsp; 자전거 대여 : ${detailInfo.bicycle } &nbsp; &nbsp; &nbsp; 캠프파이어 : ${detailInfo.campfire }
				</div><br/>
				<div>
					휘트니스 : ${detailInfo.fitness }  &nbsp; &nbsp; &nbsp; 노래방 : ${detailInfo.karaoke } &nbsp; &nbsp; &nbsp; 공용 PC룸 : ${detailInfo.publicpc }
				</div><br/>
				<div>
					사우나실 : ${detailInfo.sauna }  &nbsp; &nbsp; &nbsp; 스포츠 시설 : ${detailInfo.sports }
				</div><br/>
				
				<p><strong>객실 정보</strong></p>
				<c:forEach items="${subList }" var="bean">
					<p><strong>${bean.roomtitle }</strong></p>
					<table>
						<tr>
							<td>
								<img src="${bean.roomimg1 }"/>
							</td>
							<td>
								<img src="${bean.roomimg2 }"/>
							</td>	
						</tr>
						<tr>
							<td>
								객실 크기 : ${bean.roomsize1 }<br/>
								객실 수 : ${bean.roomcount }<br/>
								기준 인원 : ${bean.roombasecount }<br/>
								기준 소개 : ${bean.roomintro }<br/>
							</td>
							<td>
								욕조 : ${bean.roombath } &nbsp; &nbsp; 에어컨 : ${bean.roomaircondition }<br/>
								TV : ${bean.roomtv } &nbsp; &nbsp; 냉장고 : ${bean.roomrefrigerator }<br/>
								PC : ${bean.roompc } &nbsp; &nbsp; 인터넷 : ${bean.roominternet }<br/>
								취사용품 : ${bean.roomcook } &nbsp; &nbsp; 테이블 : ${bean.roomTable }<br/>
							</td>	
						</tr>
					</table>
				</c:forEach>
				
			</div> <!-- end content -->
			
            <div data-role='footer' data-position='fixed'>
                <!-- data-role='navbar'는 앱스럽게 탭메뉴를 구성할 수 있도록 해준다. 가로 최대:5개 -->
                <div data-role='navbar'>
                    <ul>
                        <li>
                            <a data-icon='home' class="ui-btn-active ui-state-persist" href="../main">Home</a>
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