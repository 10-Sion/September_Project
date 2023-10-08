<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
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
            <div class="menu_item" onclick="loadServletData('<%=request.getContextPath()%>/employee/indivDetail')">
                <i class='bx bxs-dashboard'></i>
                <p>Account</p>
            </div>
            
            <div class="menu_item" onclick="loadServletData('<%=request.getContextPath()%>/employee/list')">
                <i class='bx bx-message-rounded-dots'></i>
                <p>통합 관리</p>
                <i class="fa-regular fa-circle-2"></i>
            </div>
            
            <div class="menu_item" onclick="loadPage('/HakSaGwanLee/Notices/post.jsp')">
                <i class='bx bx-calendar'></i>
                <p>공지사항 작성(미완)</p>
            </div>
            
            <div class="menu_item" onclick="window.location.href='empMainGang.jsp'">
                <i class='bx bx-cog'></i>
                <p>학사관리시스템</p>
            </div>
            
            
        </div>
    </div>
    
    <script src="../pageSetUp/myPage.js"></script>
</body>
</html>
