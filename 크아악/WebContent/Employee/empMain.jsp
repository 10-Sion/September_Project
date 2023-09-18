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
          <p>Student</p>
          <p>Teacher</p>
          <p>Employee</p>
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
  </script>
</body>
</html>
