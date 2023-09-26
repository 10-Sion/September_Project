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
                <p>Employee</p>
                <i class="fa-regular fa-circle-2"></i>
            </div>
            
            <div class="menu_item" onclick="loadServletData('<%=request.getContextPath()%>/professor/list')">
                <i class='bx bx-calendar'></i>
                <p>Professor</p>
            </div>
            
            <div class="menu_item" onclick="loadServletData('<%=request.getContextPath()%>/student/list')">
                <i class='bx bx-cog'></i>
                <p>Student</p>
            </div>
            
            
        </div>
    </div>
    

</body>
</html>
