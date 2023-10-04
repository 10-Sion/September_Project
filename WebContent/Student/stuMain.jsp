<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
   Integer pro_no = (Integer)session.getAttribute("uniqueId");
   String center = request.getParameter("center");
 %>
<!DOCTYPE html>
<html>
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
      <jsp:include page="stuSidebar.jsp" />
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
          <h2>교수 페이지</h2>
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
        <div class="three_dots">
          <i class='bx bx-dots-vertical-rounded'></i>
        </div>
      </div>

      <div class="table">
      		
<%-- <%			if(center == null ){  --%>
<%--  %>  --%>
<!--  				기본 페이지	 dddddddddddd -->
<%-- <%			}else{				  --%>
<%--  %> --%>
<%--  				<jsp:include page="${center}" /> --%>
<!--  				<p>서블릿 요청함</p> -->
<%-- <%			}		 --%>
<%--  %>     	       	  --%>
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
        	  $('.table').empty();
              $('.table').html(data);
          },
          error: function(xhr, status, error) {
              console.error(error);
          }
      });
  }
  
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
