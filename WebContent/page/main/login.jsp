<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="준현팀플.DBConnectionMgr" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="login.css" rel="stylesheet">
</head>
<body>
    <form id="login-form">
        <input type="text" id="no" class="text-field" placeholder="고유번호" required="" autofocus />
        <input type="password" id="pw" class="text-field" placeholder="비밀번호" required />
        <button type="button" class="submit-btn" onclick="submitLoginForm()">Login</button>
    </form>

    <script>
        function submitLoginForm() {
            var uniqueId = document.getElementById("no").value;
            var userPassword = document.getElementById("pw").value;

            // 데이터를 부모 창에 전달
            window.opener.postMessage({ uniqueId: uniqueId, userPassword: userPassword }, "*");

            window.close();
        }
    </script>
</body>
</html>
