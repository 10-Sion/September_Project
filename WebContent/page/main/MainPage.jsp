<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
    <%
        String contextPath = request.getContextPath();
        Integer uniqueId = (Integer) session.getAttribute("uniqueId");
        
        out.println("uniqueId: " + uniqueId); // uniqueId 값을 출력
    %>
    <header>
        <!-- 로그인과 회원가입 링크 -->
   		 <div class="user-links">
        <%
        if (uniqueId != null) {
        %>
        <a href="../../LoginServlet" id="logoutButton" class="small-link">로그아웃</a>
        <%
        } else {
        %>
        <a href="login.jsp" id="loginButton" class="small-link">로그인</a>
        <a href="Form.jsp" id="FormButton" class="small-link">회원가입</a>
        <%
        }
        %>
    </div>

        <!-- JavaScript 파일을 로드하면서 uniqueId 값을 포함하여 전달 -->
        <script>
            var uniqueId = <%= uniqueId %>;
        </script>
        <script src="js/login.js"></script>
        
        <div class="navigation">
            <a href="#" class="menuItem">DOOR</a>
            <a href="#" class="menuItem">강의실</a>
            <a href="#" class="menuItem">공지사항</a>
            <!-- uniqueId를 사용하여 My page로 이동하는 함수 호출 -->
            <a href="#" class="menuItem" onclick="redirectToMyPage('<%= uniqueId %>')">마이페이지</a>
        </div>
    </header>

    <!-- 나머지 HTML 내용을 계속 작성할 수 있습니다. -->
    
    <div class="container-fluid" _msthidden="18">
        <div class="row" _msthidden="18">
            <div class="col-md-12" _msthidden="18">
                <br>
                <div class="carousel slide" id="carousel-280553" _msthidden="11">
                    <ol class="carousel-indicators">
                        <li data-slide-to="0" data-target="#carousel-280553" class="active"></li>
                        <li data-slide-to="1" data-target="#carousel-280553"></li>
                        <li data-slide-to="2" data-target="#carousel-280553"></li>
                    </ol>
                    <div class="carousel-inner" _msthidden="9">
                        <div class="carousel-item active" _msthidden="3">
                            <img class="d-block w-100" alt="캐러셀 부트스트랩 퍼스트" src="image/ryan-jacobson-cXUOQWdRV4I-unsplash.jpg" _msthidden="A" _mstalt="87807538" _msthash="490">
                            <div class="carousel-caption" _msthidden="2"></div>
                        </div>
                        <div class="carousel-item" _msthidden="3">
                            <img class="d-block w-100" alt="캐러셀 부트스트랩 두 번째" src="image/priscilla-du-preez-ggeZ9oyI-PE-unsplash.jpg" _msthidden="A" _mstalt="85431086" _msthash="493">
                            <div class="carousel-caption" _msthidden="2"></div>
                        </div>
                        <div class="carousel-item" _msthidden="3">
                            <img class="d-block w-100" alt="캐러셀 부트스트랩 서드" src="image/dom-fou-YRMWVcdyhmI-unsplash.jpg" _msthidden="A" _mstalt="74234810" _msthash="496">
                            <div class="carousel-caption" _msthidden="2"></div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carousel-280553" data-slide="prev" _msthidden="1"><span class="carousel-control-prev-icon"></span> <span class="sr-only" _msttexthash="15942420" _msthidden="1" _msthash="499">이전의</span></a> <a class="carousel-control-next" href="#carousel-280553" data-slide="next" _msthidden="1"><span class="carousel-control-next-icon"></span> <span class="sr-only" _msttexthash="9473516" _msthidden="1" _msthash="500">다음</span></a>
                </div>
            </div>
        </div>
    </div>

    <!-- 하단 화면 -->
    <footer>
        <!-- 이 부분에 하단 내용을 추가할 수 있습니다. -->
    </footer>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
</body>
</html>
