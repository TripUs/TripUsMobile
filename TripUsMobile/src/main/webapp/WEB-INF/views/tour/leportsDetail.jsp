<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <h1>TripUs</h1>
            </div>
            <div data-role='content'>
                <h1>${basicInfo.title }</h1>
				<div>
					<img class="detail-area-img" src="${basicInfo.firstimage }"/>			
				</div><br/>
				
				<div>
					${basicInfo.overview }
				</div>
				
				<div>
					위치 : ${basicInfo.addr1 }
				</div><br/>
				<div>
					전화 : ${basicInfo.tel }
				</div><br/>
				<div>
					${basicInfo.homepage }
				</div><br/>
				<div>
					수용인원 : ${detailInfo.accomcountleports }
				</div><br/>
				<div>
					유모차 대여 여부 : ${detailInfo.chkbabycarriage }
				</div><br/>
				<div>
					애완동물가능여부 : ${detailInfo.chkpetleports }
				</div><br/>
				<div>
					체험 가능 연령 : ${detailInfo.expagerangeleports }
				</div><br/>
				<div>
					개장시간 : ${detailInfo.openperiod }
				</div><br/>
				<div>
					주차요금 : ${detailInfo.parkingfeeleports }
				</div><br/>
				<div>
					주차시설 : ${detailInfo.parkingleports }
				</div><br/>
				<div>
					예약안내 : ${detailInfo.reservation }
				</div><br/>
				<div>
					쉬는날 : ${detailInfo.restdateleports }
				</div><br/>
				<div>
					입장료 : ${detailInfo.usefeeleports }
				</div><br/>
				<div>
					이용시간 : ${detailInfo.usetimeleports }
				</div><br/>
			
			</div>
            <div data-role='footer' data-position='fixed'>
                <!-- data-role='navbar'는 앱스럽게 탭메뉴를 구성할 수 있도록 해준다. 가로 최대:5개 -->
                <div data-role='navbar'>
                    <ul>
                        <li>
                            <a data-icon='home' class="ui-btn-active ui-state-persist" href="main">Home</a>
                        </li>
                        <li>
                            <a data-icon='calendar' href="#">내 여행</a>
                        </li>
                        <li>
                            <a data-icon='edit' href="#">여행노트</a>
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