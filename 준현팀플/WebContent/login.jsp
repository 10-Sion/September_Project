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

<form method="post" action="LoginServlet">
		고유번호  : <input type="text" name="no" value="<%=request.getParameter("uniqueId")%>"><br>
		비밀번호 : <input type="password" name="pw"><br>
		<input type="submit" value="로그인">
		<input type="reset" value="초기화">

</form>
</body>
</html>