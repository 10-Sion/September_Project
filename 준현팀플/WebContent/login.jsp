<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="준현팀플.DBConnectionMgr" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body> 

<h1>로그인</h1>

<form method="post" action="loginPro.jsp">
		아이디 : <input type="text" name="user_id"><br>
		비밀번호 : <input type="password" name="user_pw"><br>
		<input type="submit" value="로그인">
		<input type="reset" value="초기화">

</form>
</body>
</html>