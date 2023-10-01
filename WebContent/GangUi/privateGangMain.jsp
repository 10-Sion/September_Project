<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../pageSetUp/gangStyle.css">
    <title>개인 강의실 메인 페이지</title>
</head>
<body>
    <div class="container">
        <!-- 왼쪽 사이드바 (개인 강의실 페이지 링크 포함) -->
        <div class="left_sidebar">
            <jsp:include page="privateGangSide.jsp" />
        </div>

        <!-- 메인 콘텐츠 영역 (개인 강의실 내용) -->
        <div class="main_content">
            <!-- 메인 네비게이션 바 -->
            <div class="main_navbar">
                <!-- 네비게이션 바 내용 -->
            </div>
            <div class="menu_item_name_and_filter">
                <!-- 콘텐츠 제목 및 필터 영역 -->
                <div class="menu_item_name">
                    <h2>개인 강의실 메인 페이지</h2>
                </div>
            </div>
            <!-- 개인 강의실 페이지 내용 -->
            <h3>공지사항</h3>
            <p>공지사항 내용</p>
            <h3>과제</h3>
            <p>과제 목록 및 내용</p>
            <!-- 개인 강의 목록 -->
            <h3>개인 강의 목록</h3>
            <ul>
                <li><a href="my_course1.jsp">내 강의 1</a></li>
                <li><a href="my_course2.jsp">내 강의 2</a></li>
                <!-- 추가 개인 강의 목록 -->
            </ul>
        </div>
    </div>
</body>
</html>
