<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="준현팀플.DBConnectionMgr" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="login.css" rel="stylesheet">
</head>
<body> 

<%-- value="<%=request.getParameter("uniqueId")%>" --%> 

<div class="login-form" >
    <form class="form-signin" method="post" action="../../LoginServlet">       
      <h2 class="form-signin-heading">로그인</h2>
      <input type="text" class="text-field" name="no" placeholder="고유번호" required="" autofocus="" />
      <input type="password" class="text-field" name="pw" placeholder="비밀번호" required=""/>      
		<br><br>
      <button class="submit-btn" type="submit">Login</button>   
    </form>
  </div>


</body>
</html>