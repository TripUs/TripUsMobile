<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=width, initial-scale=1">
        <title>Document</title>
        <style type="text/css">
        	img {
        		width: 300px;
        		height: 200px;
        	}
        </style>
    </head>
    <body>
        <div data-role='page'>
            <div data-role='header'>
                <h1>TripUs</h1>
            </div>
            <div data-role='content'>
                <h1>${bean.title }</h1>
				<div>
					<img src="${bean.firstimage }"/>			
				</div><br/>
				<div>
					전화 : ${bean.tel }
				</div><br/>
				<div>
					주소 : ${bean.addr1 }
				</div><br/>
				<div>
					${bean.homepage }
				</div><br/>
				<div>
					${bean.overview }
				</div>
			</div>
            <div data-role='footer' data-position='fixed'>
                <!-- data-role='navbar'는 앱스럽게 탭메뉴를 구성할 수 있도록 해준다. 가로 최대:5개 -->
                <div data-role='navbar'>
                    <ul>
                        <li>
                            <a data-icon='home' class="ui-btn-active ui-state-persist" href="#page-main">Home</a>
                        </li>
                        <li>
                            <a data-icon='bars' href="#">내 여행</a>
                        </li>
                        <li>
                            <a data-icon='camera' href="#">여행노트</a>
                        </li>
                        <li>
                            <a data-icon='camera' href="#">설정</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>