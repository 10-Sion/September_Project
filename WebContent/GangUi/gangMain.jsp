<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<!DOCTYPE html>
<html lang="en">
<head>
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../pageSetUp/gangStyle.css">
    <link rel="stylesheet" href="../pageSetUp/mainTopStyle.css">
    <link rel="stylesheet" href="../pageSetUp/gangMainList.css">
    <title>강의실 메인 페이지</title>
</head>
<body>

	<div class="top">
		<jsp:include page="../page/main/mainTop.jsp" />
	</div>
    <div class="container">
        <!-- 왼쪽 사이드바 (공용 강의실 링크 포함) -->
        <div class="left_sidebar">
            <jsp:include page="gangMainSide.jsp" />
        </div>

        <!-- 메인 콘텐츠 영역 (접속한 사용자의 개인 정보 표시) -->
        <div class="main_content">
            <!-- 메인 네비게이션 바 -->
            <div class="main_navbar">
                <!-- 네비게이션 바 내용 -->
            </div>
            <div class="menu_item_name_and_filter">
                <!-- 콘텐츠 제목 및 필터 영역 -->
                <div class="menu_item_name">
                    <h2>강의실 메인 페이지</h2>
                </div>
            </div>
            
            <!-- 강의실 메인 페이지 내용 -->
            
           	<div class="main-content">
	           	<div class="gangMain-left">
	           		<!-- 개인정보 페이지 -->
	           	</div>
	           	<div>
	           		<jsp:include page="../page/main/mainRightFooter.jsp" />
	           	</div>
           	</div>
        </div>
    </div>


	<script src="../pageSetUp/gangApp.js"></script>
</body>
</html>
