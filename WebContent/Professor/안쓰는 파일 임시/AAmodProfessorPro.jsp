
<%@page import="JaeWooVO.ProBean"%>
<%@page import="JaeWooDAO.ProDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title></head>
<body>
<jsp:useBean id="ProBean" class="JaeWooVO.ProBean"/>
<jsp:setProperty property="*" name="ProBean"/>
<%
	ProDao pDao = new ProDao();
	int check = pDao.ModProfessor(ProBean);
	
	if(check != -1 ){
		out.println("<script>alert('수정완료');</script>");	
// 		response.sendRedirect("ProfessorIndex.jsp");
	}else{ 
		out.println("<script>alert('수정실패');</script>");
		out.println("<script>location.href = history.back();</script>");
    } 
	out.println("<script>location.href = 'ProfessorIndex.jsp';</script>");
%>

</body>
</html>