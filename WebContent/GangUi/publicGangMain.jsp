<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../pageSetUp/ganSubStyle.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <title>공용 강의실 메인 페이지</title>
</head>
<body>
    <div class="container">
        <!-- 왼쪽 사이드바 (공용 강의실 링크 포함) -->
        <div class="left_sidebar">
            <jsp:include page="publicGangSide.jsp" />
        </div>

        <!-- 메인 콘텐츠 영역 (전체 강의 목록 표시) -->
        <div class="main_content">
            <!-- 메인 네비게이션 바 -->
            <div class="main_navbar">
                <!-- 네비게이션 바 내용 -->
            </div>
            <div class="menu_item_name_and_filter">
                <!-- 콘텐츠 제목 및 필터 영역 -->
                <div class="menu_item_name">
                    <h2>공용 강의실 메인 페이지</h2>
                </div>
            </div>
            <!-- 전체 강의 목록 표시 -->
            <ul>
                <li><a href="public_course1.jsp">강의 1</a></li>
                <li><a href="public_course2.jsp">강의 2</a></li>
                <!-- 추가 강의 목록 -->
            </ul>
        </div>
    </div>
</body>
</html>
