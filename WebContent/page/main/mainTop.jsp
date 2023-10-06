<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    
<%
        String contextPath = request.getContextPath();
        Integer uniqueId = (Integer) session.getAttribute("uniqueId");
   
        String userRole = (String) session.getAttribute("userRole"); // 사용자 역할을 가져옴
		String username = (String) session.getAttribute("username");
      //  out.println("uniqueId: " + uniqueId); // uniqueId 값을 출력
    %>
    <header>
    	
    
        <!-- 로그인과 회원가입 링크 -->
   		 <div class="user-links">
   		 
        <%
    if (uniqueId != null) {
    %>
    <p><%=username%>로그인 중
    <a href="../../LoginServlet" id="logoutButton" class="small-link">로그아웃</a></p>
    <%
        // "직원"으로 로그인한 경우에만 회원가입 버튼을 표시
        if ("직원".equals(userRole)) {
    %>
    <a href="Form.jsp" id="FormButton" class="small-link">회원추가</a>
    <%
        }
    %>
    <%
    } else {
    %>
    <a href="login.jsp" id="loginButton" class="small-link">로그인</a>
    <%
    }
    %>
    </div>

        <!-- JavaScript 파일을 로드하면서 uniqueId 값을 포함하여 전달 -->
        <script>
            var uniqueId = <%= uniqueId %>;
        </script>
        <script src="js/login.js"></script>
        
        
        <div class="navigation">
        
        <div class="logo">
        	<a href="<%=request.getContextPath()%>/page/main/MainPage.jsp"><img src="<%=request.getContextPath()%>/page/main/image/Hogwarts-Crest.png" alt="로고 이미지"></a>
        	<h1>동명대학교</h1>
    	</div>
        
            <a href="../../GangUi/gangMain.jsp" class="menuItem">학사관리시스템</a>
            <a href="../../QnA/list.jsp" class="menuItem">강의실</a>
            <a href="../../Notices/list.jsp" class="menuItem">공지사항</a>
            <!-- uniqueId를 사용하여 My page로 이동하는 함수 호출 -->
            <a href="#" class="menuItem" onclick="redirectToMyPage('<%= uniqueId %>')">마이페이지</a>
        </div>
    </header>
</html>