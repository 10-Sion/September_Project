
<%@page import="JaeWooDAO.SubDao"%>
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
<jsp:useBean id="SubBean" class="JaeWooVO.SubBean"/>
<jsp:setProperty property="*" name="SubBean"/>
<%
	SubDao subDao = new SubDao();
	int check = subDao.ModSubject(SubBean); 
	
	if( check != -1){
%>
	<script>
	alert("과목 수정을 완료 하였습니다.");
	location.href = "SubIndex.jsp";
	</script>
<%		
	}else{
%>
	<script>
	alert("과목 수정에 실패하였습니다.");
	history.back();
	</script>
<%		
	}
%>
</body>
</html>