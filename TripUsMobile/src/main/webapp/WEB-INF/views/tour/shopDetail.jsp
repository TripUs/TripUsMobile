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
					장서는 날 : ${detailInfo.fairday }
				</div><br/>
				<div>
					영업 시간 : ${detailInfo.opentime }
				</div><br/>
				<div>
					문의 및 안내 : ${detailInfo.infocentershopping }
				</div><br/>
				<div>
					주차 시설 : ${detailInfo.parkingshopping }
				</div><br/>
				<div>
					쉬는 날 : ${detailInfo.restdateshopping }
				</div><br/>
				<div>
					판매 품목 : ${detailInfo.saleitem }
				</div><br/>
				<div>
					판매 품목별 가격 : ${detailInfo.saleitemcost }
				</div><br/>
				<div>
					규모 : ${detailInfo.scaleshopping }
				</div><br/>
				<div>
					유모차 대여 여부 : ${detailInfo.chkbabycarriageshopping }
				</div><br/>
				<div>
					애완동물 가능 여부 : ${detailInfo.chkpetshopping }
				</div><br/>
				<div>
					매장 안내 : ${detailInfo.shopguide }
				</div><br/>
				
			</div>
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