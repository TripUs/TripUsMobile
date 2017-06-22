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
				
				<form action="upload" method="post" enctype="multipart/form-data" data-ajax="false">
					<div>
						<input type="text" name="contentid" value="${basicInfo.contentid }" hidden="hidden"/>
						<input type="text" name="contenttypeid" value="${basicInfo.contenttypeid }" hidden="hidden"/>
					</div>
					<div>
						<label for="file"></label>
						<input type="file" name="file"/>
					</div>
					<div>
						<button>업로드</button>
					</div>
				</form>
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
					대표 메뉴 : ${detailInfo.firstmenu }
				</div><br/>
				<div>
					영업 시간 : ${detailInfo.opentimefood }
				</div><br/>
				<div>
					문의 및 안내 : ${detailInfo.infocenterfood }
				</div><br/>
				<div>
					할인정보 : ${detailInfo.firstmenu }
				</div><br/>
				<div>
					어린이 놀이방 : ${detailInfo.kidsfacility }
				</div><br/>
				<div>
					포장 가능 여부 : ${detailInfo.packing }
				</div><br/>
				<div>
					주차시설 : ${detailInfo.parkingfood }
				</div><br/>
				<div>
					예약 안내 : ${detailInfo.reservationfood }
				</div><br/>
				<div>
					쉬는날 : ${detailInfo.restdatefood }
				</div><br/>
				<div>
					좌석수 : ${detailInfo.seat }
				</div><br/>
				<div>
					메뉴 : ${detailInfo.treatmenu }
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