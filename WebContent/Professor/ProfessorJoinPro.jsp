<%@page import="Professor.ProBean"%>
<%@page import="Professor.ProDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="ProBean" class="Professor.ProBean"/>
<jsp:useBean id="ProDao" class="Professor.ProDao"/>
<jsp:setProperty property="*" name="ProBean"/>
<%
	ProDao.JoinProfessor(ProBean);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>