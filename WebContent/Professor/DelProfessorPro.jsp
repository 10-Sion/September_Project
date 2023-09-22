
<%@page import="JaeWooDAO.ProDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	ProDao pDao = new ProDao();
	int pro_no = Integer.parseInt(request.getParameter("no"));
	int result = pDao.deleteProfessor(pro_no);
	
	if(result != -1){ 
%>
		<script>
		alert("회원탈퇴에 성공했습니다.");
		location.href = "main.jsp"
		</script>
<%
	}else{
%>
		<script>
		alert("회원탈퇴에 성공했습니다.");
		location.href = "main.jsp"
		</script>
<%		
	}
%>
	

</body>
</html>