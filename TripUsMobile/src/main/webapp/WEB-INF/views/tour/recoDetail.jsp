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
				
				<p><strong>${basicInfo.title } 상세정보</strong></p>
				<div>
					코스 총 거리 : ${detailInfo.distance }
				</div>
				<div>
					문의 및 안내 : ${detailInfo.infocentertourcourse }
				</div>
				<div>
					코스 일정 : ${detailInfo.schedule }
				</div>
				<div>
					코스 총 소요시간 : ${detailInfo.taketime }
				</div>
				<div>
					코스 테마 : ${detailInfo.theme }
				</div>
	
				<h2>코스 정보</h2>
				<c:forEach items="${subList }" var="bean">
					<p><strong><a href="../detail/${bean.subcontentid }">${bean.subname }</a></strong></p>
					<div>
						<img class="detail-area-img" src="${bean.subdetailimg }"/>
					</div>
					<div>
						<p><strong>코스 개요</strong></p>
						${bean.subdetailoverview }
					</div>
				</c:forEach>
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