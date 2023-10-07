<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Main Page</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">   
    <link href="css/bottom.css" rel="stylesheet">
</head>
<body>
	<div class="top">
		<jsp:include page="mainTop.jsp" />
	</div>

    <!-- 나머지 HTML 내용을 계속 작성할 수 있습니다. -->
   <div class="main">
    <div class="container-fluid">
	    <div class="row">
	        <div class="col-md-12">
	            <br>
	            <div class="carousel slide" id="carousel-280553">
	                <ol class="carousel-indicators">
	                    <li data-slide-to="0" data-target="#carousel-280553" class="active"></li>
	                    <li data-slide-to="1" data-target="#carousel-280553"></li>
	                    <li data-slide-to="2" data-target="#carousel-280553"></li>
	                </ol>
	                <div class="carousel-inner">
	                    <div class="carousel-item active">
	                        <img class="d-block w-100" alt="캐러셀 부트스트랩 퍼스트" src="image/ryan-jacobson-cXUOQWdRV4I-unsplash.jpg" style="height: 85vh;">
	                        <div class="carousel-caption"></div>
	                    </div>
	                    <div class="carousel-item">
	                        <img class="d-block w-100" alt="캐러셀 부트스트랩 두 번째" src="image/priscilla-du-preez-ggeZ9oyI-PE-unsplash.jpg" style="height: 85vh;">
	                        <div class="carousel-caption"></div>
	                    </div>
	                    <div class="carousel-item">
	                        <img class="d-block w-100" alt="캐러셀 부트스트랩 서드" src="image/dom-fou-YRMWVcdyhmI-unsplash.jpg" style="height: 85vh;">
	                        <div class="carousel-caption"></div>
	                    </div>
	                </div>
	                <a class="carousel-control-prev" href="#carousel-280553" data-slide="prev">
	                	<span class="carousel-control-prev-icon"></span> 
	                	<span class="sr-only">이전의</span></a> 
	                	
	                <a class="carousel-control-next" href="#carousel-280553" data-slide="next">
	                	<span class="carousel-control-next-icon"></span> 
	                	<span class="sr-only">다음</span></a>
	            </div>
	        </div>
	    </div>
	</div>

    <!-- 하단 화면 -->
    <footer>
    	<div class="right-footer">
    		<jsp:include page="mainLeftFooter.jsp" />
    	</div>
    	<div class="left-footer">
    		<jsp:include page="mainRightFooter.jsp" />
    	</div>
    </footer>
	</div>
	<div class="real-footer">
		<div class="footer-page">
			<a>대학 홈페이지</a>
			<a>대학원 홈페이지</a>
		</div>
		
		<div class="footer-content">
			<h6>부산캠퍼스</h6>
			<p>pax. 123-4567</p>
			<p>tel. 12 3456 7890</p> 
		</div>
		COPYRIGHT ⓒ 2023 UNIVERSITY. ALL RIGHTS RESERVED.
	</div>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
    
    <script>
	    function openLoginPopup() {
	        // 팝업 창의 URL을 지정
	        var loginPopupURL = "login.jsp";
	
	        // 팝업 창의 크기와 위치 계산
	        var popupWidth = 400;
	        var popupHeight = 400;
	        var leftPosition = (window.screen.width - popupWidth) / 2;
	        var topPosition = (window.screen.height - popupHeight) / 2;
	
	        // 팝업 창의 속성 설정
	        var popupOptions = "width=" + popupWidth + ",height=" + popupHeight + ",left=" + leftPosition + ",top=" + topPosition + ",status=no,toolbar=no,scrollbars=no";
	
	        // 팝업 창 열기
	        var loginPopup = window.open(loginPopupURL, "Login", popupOptions);
	
	        // 팝업 창이 닫힐 때 이벤트 처리
	        loginPopup.onunload = function() {
	            // 팝업 창이 닫히면 이곳에서 원하는 동작을 수행
	            // 예: 팝업 창에서 로그인 결과 데이터를 가져와서 기존 창에서 처리
	            // AJAX를 사용하여 서블릿에 로그인 데이터를 전송하고 결과를 받아와 처리
	        };
	    }
	</script>
</body>
</html>
