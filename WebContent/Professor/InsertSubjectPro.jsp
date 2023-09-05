<%@page import="Subject.SubBean"%>
<%@page import="Professor.ProBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="SubBean" class="Subject.SubBean"/>
<jsp:useBean id="SubDao" class="Professor.ProDao"/>
<jsp:setProperty property="*" name="SubBean"/>
<% SubDao.InsertSubject(SubBean); %>
</body>
</html>