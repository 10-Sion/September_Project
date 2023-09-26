<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
String contextPath = request.getContextPath(); 
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a { text-decoration-line: none; }
</style>
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
            <div class="menu_item" >
                <i class='bx bxs-dashboard'></i>
                <a href ="<%=contextPath%>/Lecture/LectureList.do"><p>Account</p></a>               	
            </div>
            
            <div class="menu_item" onclick="loadPage('/Lecture/LectureList.do')">
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
