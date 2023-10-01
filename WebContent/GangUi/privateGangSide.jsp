<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="left_sidebar">
        <div class="close_hamburger_btn">
            <i class='bx bx-x-circle'></i>
        </div>

        <div class="logo">
            <h2 onclick="myFunction()">School</h2>
        </div>

        <div class="menu_items">
            <div class="menu_item" onclick="loadPage('gangTable1.jsp')">
                <i class='bx bxs-dashboard'></i>
                <p>나의 강의 목록</p>
            </div>
            
            <div class="menu_item" onclick="loadPage('gangTable2.jsp')">
                <i class='bx bx-message-rounded-dots'></i>
                <p>공지사항</p>
                <i class="fa-regular fa-circle-2"></i>
            </div>
            <div class="menu_item" onclick="loadPage('gangTable3.jsp')">
                <i class='bx bx-message-rounded-dots'></i>
                <p>과제</p>
                <i class="fa-regular fa-circle-3"></i>
            </div>
            <div class="menu_item" onclick="loadPage('gangTable4.jsp')">
                <i class='bx bx-message-rounded-dots'></i>
                <p>커뮤니티</p>
                <i class="fa-regular fa-circle-4"></i>
            </div>
            
        </div>
    </div>
</body>
</html>
