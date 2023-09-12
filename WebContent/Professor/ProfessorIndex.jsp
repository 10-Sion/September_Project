<%@page import="Subject.SubDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<% 

session.setAttribute("pro_no", 1002); //테스트용 세션값
  int pro_no = (int)session.getAttribute("pro_no"); //테스트용 세션값 
  
  
  
  System.out.println(pro_no);


%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
	<h1> 교수 메인 페이지</h1>
	<tr>
		<td>
		<a href="SubIndex.jsp">강의 목록</a>
		</td>
	</tr>
	<tr>
		<td>
		<a href="InsertSubject.jsp">강의 등록</a>
		</td>
	</tr>
	<tr>
		<td>
		<a href="modProfessor.jsp">교수 정보</a>
		</td>
	</tr>
	<tr>
		<td>
		<a href="ProfessorJoin.jsp">회원 가입</a>
		</td>
	</tr>
	</div>
</body>
</html>