<%@page import="Professor.ProBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	ProBean pb = new ProBean();
	String no = request.getParameter("no");
	
%>

<form action = "ProModify.jsp" method = "post">
	<div align="center">
	<h1>교수 정보</h1>
	<table>
		<tr>
			<th>교수 아이디</th>
			<td>id</td>
		</tr>
		<tr>
			<th>교수 이름</th>
			<td></td>
		</tr>
		
	

<!-- 	private int no; // 교수 식별 번호 -->
<!-- 	private String id;	//교수 아이디 -->
<!-- 	private String pw;	// 교수 비밀번호 -->
<!-- 	private String name; // 교수 이름  -->
<!-- 	private String addr; // 교수 거주지 -->
<!-- 	private String tel; // 연구실 전화번호 -->
<!-- 	private String phone; // 교수 휴대전화 번호 -->
<!-- 	private String major; // 학부(전공) -->
<!-- 	private String email; //교수 이메일 주소 -->
<!-- 	private String labAddr; // 연구실 번 -->
	</table>
	</div>
</form>
</body>
</html>