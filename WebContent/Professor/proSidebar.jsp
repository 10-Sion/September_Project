<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
	a { text-decoration-line: none; }
</style>
<body>
    <div class="left_sidebar">
        <div class="close_hamburger_btn">
            <i class='bx bx-x-circle'></i>
        </div>

        <div class="logo">
            <h2 onclick="myFunction()">School</h2>
        </div>

        <div class="menu_items">
            <div class="menu_item"  onclick="loadPage('proTable1.jsp')">
                <i class='bx bxs-dashboard'></i>
               <a><p>전체 강의 리스트</p></a>
            </div>
            
            <div class="menu_item" onclick="loadPage('proTable2.jsp')">
                <i class='bx bx-message-rounded-dots'></i>
                <p>Subject</p>
                <i class="fa-regular fa-circle-2"></i>
            </div>
            
            <div class="menu_item" onclick="loadPage('proTable3.jsp')">
                <i class='bx bx-calendar'></i>
                <p>Score</p>
            </div>
            
            <div class="menu_item" onclick="loadPage('proTable4.jsp')">
                <i class='bx bx-cog'></i>
                <p>Settings</p>
            </div>
            
            
        </div>
    </div>
</body>
</html>
