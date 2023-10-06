<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
	String contextPath = request.getContextPath();
	System.out.println( contextPath );
	response.sendRedirect(contextPath + "/Lecture/Main");
%>