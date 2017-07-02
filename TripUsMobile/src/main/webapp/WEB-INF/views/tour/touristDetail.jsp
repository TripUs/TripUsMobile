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
					<p><strong>소개</strong></p>
					${basicInfo.overview }
				</div>
				
				<div>
					${basicInfo.homepage }
				</div><br/>
				<div>
					전화 : ${basicInfo.tel }
				</div><br/>
				<div>
					주소 : ${basicInfo.addr1 } ${basicInfo.addr2 }
				</div><br/>
				<div><p><strong>관광지 상세정보</strong></p>
					<div>
						유모차대여 여부 : ${detailInfo.chkbabycarriage }
					</div><br/>
					<div>
						애완동물 동반 가능여부 : ${detailInfo.chkpet }
					</div><br/>
					<div>
						체험가능연령 : ${detailInfo.expagerange }
					</div><br/>
					<div>
						세계문화유산 : ${detailInfo.heritage1 }
					</div><br/>
					<div>
						자연유산 : ${detailInfo.heritage2 }
					</div><br/>
					<div>
						기록유산 유무 : ${detailInfo.heritage3 }
					</div><br/>
					<div>
						문의 및 안내 : ${detailInfo.infocenter }
					</div><br/>
					<div>
						주차시설 : ${detailInfo.parking }
					</div><br/>
					<div>
						쉬는 날 : ${detailInfo.restdate }
					</div><br/>
					<div>
						이용시기 : ${detailInfo.useseason }
					</div><br/>
					<div>
						이용시간 : ${detailInfo.usetime }
					</div><br/>
					<div>
						수용인원 : ${detailInfo.accomcount }
					</div><br/>
				</div>
				
			</div>
            <div data-role='footer' data-position='fixed'>
                <!-- data-role='navbar'는 앱스럽게 탭메뉴를 구성할 수 있도록 해준다. 가로 최대:5개 -->
                <div data-role='navbar'>
                    <ul>
                        <li>
                            <a data-icon='home' class="ui-btn-active ui-state-persist" href="../../tripus/">Home</a>
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