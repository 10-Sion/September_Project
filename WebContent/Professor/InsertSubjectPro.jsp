<%@page import="Subject.SubBean"%>
<%@page import="Professor.ProBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding("UTF-8"); %>
 <% int pro_no = (int)session.getAttribute("pro_no");//테스트용 세션값  %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="SubBean" class="Subject.SubBean"/>
<jsp:useBean id="ProDao" class="Professor.ProDao"/>
<jsp:setProperty property="*" name="SubBean"/>
<% ProDao.InsertSubject(SubBean); %>
<% response.sendRedirect("SubIndex.jsp"); %>
</body>
</html>