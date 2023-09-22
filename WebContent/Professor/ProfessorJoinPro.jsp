

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="ProBean" class="JaeWooVO.ProBean"/>
<jsp:useBean id="ProDao" class="JaeWooDAO.ProDao"/>
<jsp:setProperty property="*" name="ProBean"/>
<%
	ProDao.JoinProfessor(ProBean);
	response.sendRedirect("ProfessorIndex.jsp");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>