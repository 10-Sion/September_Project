<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
	int session_no = (Integer)session.getAttribute("stu_no");
%>
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
            <div class="menu_item" onclick="loadServletData('<%=contextPath%>/stu/selStudnet.do?stu_no=<%=session_no%>')">
                <i class='bx bxs-dashboard'></i>
                <p>학생정보</p>
            </div>
            
            <div class="menu_item" onclick="loadServletData('<%=contextPath%>/stu/selSubject.do?stu_no=<%=session_no%>')">
                <i class='bx bx-message-rounded-dots'></i>
                <p>수강신청</p>
                <i class="fa-regular fa-circle-2"></i>
            </div>
            
            <div class="menu_item" onclick="loadPage('stuTable3.jsp')">
                <i class='bx bx-calendar'></i>
                <p>Score</p>
            </div>
            
            <div class="menu_item" onclick="loadPage('stuTable4.jsp')">
                <i class='bx bx-cog'></i>
                <p>Settings</p>
            </div>
            
            <div class="menu_item" onclick="loadServletData('<%=contextPath%>/ReportBoard/ReportList.jsp')">
                <i class='bx bx-cog'></i>
                <p>과제</p>
            </div>
        </div>
    </div>
</body>
</html>
