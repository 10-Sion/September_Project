<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../pageSetUp/gangSubStyle.css">
    <link rel="stylesheet" href="../pageSetUp/mainTopStyle.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <title>공용 강의실 메인 페이지</title>
</head>
<body>
	
    <div class="container">

    
        <!-- 왼쪽 사이드바 -->
        <div class="left_sidebar">
            <jsp:include page="publicGangSide.jsp" />
        </div>

        <!-- 메인 콘텐츠 영역 (개인 강의실 내용) -->
        <div class="main_content">
            
            
            <div class="base_content">
                <jsp:include page="gangSchedule.jsp" />
            </div>
            
              <div class="table">
                <!-- 불러올 페이지 동적 처리함 -->
              </div>
            
            
            
        </div>
    </div>
    
    <script src="../pageSetUp/gangSubApp.js"></script>
    <script src="../pageSetUp/myPage.js"></script>
</body>
</html>
