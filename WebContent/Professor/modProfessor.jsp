<%@page import="Professor.ProBean"%>
<%@page import="Professor.ProDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); 
//	int pro_no = Integer.parseInt( request.getParameter("no")) ;
//	String P_name = request.getParameter("name");
	int pro_no = (int)session.getAttribute("pro_no");
//	String p_name = (String)session.getAttribute("pro_no");

	ProDao pdao = new ProDao();
	ProBean pb = pdao.getProInfo(pro_no);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = "modProfessorPro.jsp" method ="post">
	<div align="center">
	<h1>교수 정보</h1>
	<table>
		<tr>
			<th>이름</th>
			<td><input type = "text" name = "name" value = "<%=pb.getName()%>"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type= "password" name="pwd" value = "<%=pb.getPw()%>"></td>
		</tr>
		<tr>
			<th>전공</th>
			<td><input type = "text" name = "major" value = "<%=pb.getMajor()%>"></td>
		</tr>
		<tr>
			<th>연락처(휴대폰)</th>
			<td><input type = "text" name = "phone" value = "<%=pb.getPhone()%>"></td>
		</tr>
		<tr>
			<th>연락처(연구실)</th>
			<td><input type = "text" name = "tel" value = "<%=pb.getTel()%>"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type = "text" name = "major" value = "<%=pb.getAddr()%>"></td>
		</tr>	
		<tr>
			<th>이메일</th>
			<td><input type="text" name= "email" value= "<%=pb.getEmail()%>"></td>
		</tr>
		<tr>
			<th>연구실 위치</th>
			<td><input type="text" name= "labNum" value= "<%=pb.getLabNum()%>"></td>
		</tr>
	</table>
	</div>
	<div id="buttons" align="center">
		<input type="submit" value="수정하기" class="submit"/>
		<input type="reset" value="수정취소" class="cancel"/><br>
		<br><br><br><br>
		<input type="button" value="이전 페이지" class="cancel" onclick="history.back()"/>
	</div>
</form>
</body>
</html>