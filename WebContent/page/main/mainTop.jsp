<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/mainTop.css">
</head>
<body>
    <header>
        <div class="navigation">
            <div class="logo">
                <a href="<%=request.getContextPath()%>/page/main/MainPage.jsp"><img src="image/Hogwarts-Crest.png" alt="로고 이미지"></a>
                <h1>교학대학교</h1>
            </div>
            <a href="../../GangUi/gangMain.jsp" class="menuItem">학사관리시스템</a>
            <a href="../../QnA/list.jsp" class="menuItem">강의실</a>
            <a href="../../Notices/list.jsp" class="menuItem">공지사항</a>

            <!-- 로그인 상태에 따라 다르게 표시 -->
            <div class="user-links">
                <%
                Integer uniqueId = (Integer) session.getAttribute("uniqueId");
                String userRole = (String) session.getAttribute("userRole");
                String username = (String) session.getAttribute("username");
                if (uniqueId != null) {
                %>
                <p><%=username%>님이 로그인 중
                    <a href="../../LoginServlet" id="logoutButton" class="small-link">로그아웃</a>
                </p>
                <%
                    // "직원"으로 로그인한 경우에만 회원가입 버튼 표시
                    if ("직원".equals(userRole)) {
                %>
                <a href="Form.jsp" id="FormButton" class="small-link">회원 추가</a>
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
        </div>
    </header>

</body>
</html>
