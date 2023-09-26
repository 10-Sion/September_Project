<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <link rel="stylesheet" href="../pageSetUp/gangStyle.css">
  <title>Document</title>
</head>
<body>
  <div class="container">
    
      <%
    String currentSessionParam = request.getParameter("currentSession");
    if (currentSessionParam != null && !currentSessionParam.isEmpty()) {
    	
        int currentSession = Integer.parseInt(currentSessionParam);
        session.setAttribute("currentSession", currentSession);
    }
    %>
    <%-- 세션에서 값을 읽어와 출력 --%>
    <% Integer currentSession = (Integer) session.getAttribute("currentSession"); %>
    <% if (currentSession != null) { %>
        <p>현재 로그인 ID: <%= currentSession %></p>
    <% } else { %>
        <%-- error.jsp 페이지로 이동 --%>
        <% request.setAttribute("errorMessage", "로그인 정보를 가져오지 못했습니다."); %>
        <% request.getRequestDispatcher("/Employee/error.jsp").forward(request, response); %>
    <% } %>

  
    <div class="left_sidebar">
      <!-- 불러올 페이지 동적 처리함 -->
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
            <p>Num</p>
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
          <div class="sort sort_and_filter">
            <p>Sort</p>
            <i class='bx bx-sort-down'></i>
          </div>
          <div class="filter sort_and_filter">
            <p>Filter</p>
            <i class='bx bx-filter'></i>
          </div>
        </div>
      </div>
      <div class="tabs">
        <div class="tab_name">
          <p onclick="loadServletData('/HakSaGwanLee/employee/list')">Employee</p>
          <p onclick="loadServletData('/HakSaGwanLee/professor/list')">Professor</p>
          <p onclick="loadServletData('/HakSaGwanLee/student/list')">Student</p>
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

  <script>
  //    페이지 로딩 함수
  function loadPage(pageUrl) {
      $.ajax({
          url: pageUrl,
          type: 'GET',
          dataType: 'html',
          success: function(data) {
              $('.table').html(data);
          },
          error: function(xhr, status, error) {
              console.error(error);
          }
      });
  }
  //    서블릿 데이터 처리 함수
  function loadServletData(servletUrl) {
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
