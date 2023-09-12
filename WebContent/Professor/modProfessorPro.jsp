<%@page import="Professor.ProDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="ProBean" class="Professor.ProBean"/>
<jsp:setProperty property="*" name="ProBean"/>
<%
	ProDao pDao = new ProDao();
	pDao.ModProfessor(ProBean); 

%>
</body>
</html>