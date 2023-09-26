
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
            <div class="menu_item" onclick="loadPage('stuTable1.jsp')">
                <i class='bx bxs-dashboard'></i>
                <p>전체 강의 목록</p>
            </div>
            
            <div class="menu_item" onclick="loadPage('stuTable2.jsp')">
                <i class='bx bx-message-rounded-dots'></i>
                <p>나의 강의</p>
                <i class="fa-regular fa-circle-2"></i>
            </div>
            
        </div>
    </div>
</body>
</html>
