<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
        String contextPath = request.getContextPath();
        Integer uniqueId = (Integer) session.getAttribute("uniqueId");
        
        out.println("uniqueId: " + uniqueId); // uniqueId 값을 출력
    %>
    <header>
    	
    
        <!-- 로그인과 회원가입 링크 -->
   		 <div class="user-links">
   		 
        <%
        if (uniqueId != null) {
        %>
        <a href="../../LoginServlet" id="logoutButton" class="small-link">로그아웃</a>
        <%
        } else {
        %>
        <a href="login.jsp" id="loginButton" class="small-link">로그인</a>
        <a href="Form.jsp" id="FormButton" class="small-link">회원가입</a>
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
        	<a href="<%=request.getContextPath()%>/page/main/MainPage.jsp"><img src="image/Hogwarts-Crest.png" alt="로고 이미지"></a>
        	<h1>AAAA대학교</h1>
    	</div>
        
            <a href="../../GangUi/gangMain.jsp" class="menuItem">학사관리시스템</a>
            <a href="#" class="menuItem">강의실</a>
            <a href="#" class="menuItem">공지사항</a>
            <!-- uniqueId를 사용하여 My page로 이동하는 함수 호출 -->
            <a href="#" class="menuItem" onclick="redirectToMyPage('<%= uniqueId %>')">마이페이지</a>
        </div>
    </header>