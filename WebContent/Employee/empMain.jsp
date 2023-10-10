<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <link rel="stylesheet" href="../pageSetUp/mainStyle.css">
  <title>Document</title>
</head>
<body>
  <div class="container">
    <%
    String currentEmployeeIdParam = request.getParameter("currentEmployeeId");
    if (currentEmployeeIdParam != null && !currentEmployeeIdParam.isEmpty()) {
        int currentEmployeeId = Integer.parseInt(currentEmployeeIdParam);
        session.setAttribute("currentEmployeeId", currentEmployeeId);
    }
    %>
    <%-- 세션에서 값을 읽어와 출력 --%>
    <% Integer currentEmployeeId = (Integer) session.getAttribute("uniqueId"); %>

  	
    <div class="left_sidebar">
      <jsp:include page="empSidebar.jsp" />
    </div>

    <div class="main_content">
    
      <div class="left_right_sidebar_opener">
      
        <div class="hamburger">
          <i class='bx bx-menu'></i>
        </div>
        
        <div class="student">
          <div class="profile_img">
            <img src="https://i.postimg.cc/Sxb6gssQ/img-1.jpg" alt="profile img">
          </div>
          
          <div class="profile_name">
            <p>관리자 ID <%= currentEmployeeId %></p>
          </div>
          
        </div>
      </div>
      <div class="main_navbar">
        
      </div>
      <div class="menu_item_name_and_filter">
        <div class="menu_item_name">
          <h2>Database</h2>
        </div>
        <div class="filter_and_sort">

        </div>
      </div>
      <div class="tabs">
        <div class="tab_name">
          <p onclick="loadServletData('<%=request.getContextPath()%>/employee/list')">Employee</p>
          <p onclick="loadServletData('<%=request.getContextPath()%>/professor/list')">Professor</p>
          <p onclick="loadServletData('<%=request.getContextPath()%>/student/list')">Student</p>
        </div>
        <div class="three_dots">
          <i class='bx bx-dots-vertical-rounded'></i>
        </div>
      </div>

      <div class="table">
        <!-- 불러올 페이지 동적 처리함 -->
      </div>
      
    </div>
  </div>


  <script src="../pageSetUp/myPage.js"></script>
</body>
</html>
