<!--
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
-->
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
            <div class="menu_item" onclick="loadPage('stuTable1.jsp')">
                <i class='bx bxs-dashboard'></i>
                <p>강의 정보</p>
            </div>
            
            <div class="menu_item" onclick="loadPage('stuTable2.jsp')">
                <i class='bx bx-message-rounded-dots'></i>
                <p>수업 활동</p>
                <i class="fa-regular fa-circle-2"></i>
            </div>
            
            <div class="menu_item" onclick="loadPage('stuTable3.jsp')">
                <i class='bx bx-calendar'></i>
                <p>커뮤니티</p>
            </div>
            
            <div class="menu_item" onclick="loadPage('stuTable4.jsp')">
                <i class='bx bx-cog'></i>
                <p>강의실 관리</p>
            </div>
            
            
        </div>
    </div>
</body>
</html>
