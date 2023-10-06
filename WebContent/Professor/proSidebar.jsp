<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Integer pro_no = (Integer)session.getAttribute("uniqueId");
String contextPath = request.getContextPath(); 
%>
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
        	<div class="menu_item">
        		<h1>나의 정보</h1>
        	
        	</div>
            <div class="menu_item"  onclick="loadPage('MyInfoProfessor.jsp')">
                <i class='bx bxs-dashboard'></i>
               <a><p>나의 정보</p></a>
            </div>
            
            <div class="menu_item" onclick="loadPage('<%=contextPath%>/Lecture/ProLectureList.do?pro_no=<%=pro_no%>')">
                <i class='bx bx-message-rounded-dots'></i>
<%--                 <a href ="<%=contextPath%>/Lecture/ProLectureList.do?pro_no=<%=pro_no%>"><p>개설 강의 관리</p></a> --%>
                <p>개설 강의 관리</p>
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
    <script>
    function loadServletData(servletUrl) {
	  
	    console.log(servletUrl);
	    
	    $.ajax({
	        url: servletUrl,
	        type: 'GET',
	        dataType: 'html',
	        success: function(data) {
	            // 서블릿에서 반환된 데이터를 화면에 표시
	            $('.table').html(data);
	        },
	        error: function(xhr, status, error) {
	            console.error(error);
	        }
	    });
	}
    
   
  </script>
</body>
</html>