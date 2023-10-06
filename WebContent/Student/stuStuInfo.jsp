.
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="stuVO.StuVO"%> 
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
	//System.out.println(request.getAttribute("stuVO")); // 값 넘어옴
	StuVO sVo = (StuVO)request.getAttribute("stuVO");
	int stu_no = (Integer)session.getAttribute("stu_no");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3><%=stu_no %>학생 페이지</h3>
	<%-- 학생 정보 리스트 --%>
	<table border="1" >
		<tr align="center">
			<th>학번</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>주소</th>
			<th>휴대폰</th>
			<th>집 번호</th>
			<th>이메일</th>
			<th>학부</th>
			<th>전공</th>
			<th>학년</th>
			<th>재학여부</th>
		</tr>
		
		<%-- 학생 정보 뿌려주기 --%> 
		<tr align="center">
			<td><%=sVo.getStu_no() %></td>
			<td><%=sVo.getPw() %></td>
			<td><%=sVo.getName() %></td>
			<td><%=sVo.getAddr() %></td>
			<td><%=sVo.getPhone() %></td>
			<td><%=sVo.getTel() %></td>
			<td><%=sVo.getEmail() %></td>
			<td><%=sVo.getDep_name() %></td>
			<td><%=sVo.getMajor() %></td>
			<td><%=sVo.getGrade() %></td>
			<td><%=sVo.getStatus() %></td>
		</tr>
	</table>
</body>
</html>