<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Integer uniqueId = (Integer) session.getAttribute("uniqueId");
	System.out.println("ReportInfo.jsp 내부 세션 값 : " + uniqueId);
	session.setAttribute("uniqueId", uniqueId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>제출과제목록</h3>
	<table>
		<tr>
			<th>주차</th>
			<th>과목번호</th>
			<th>과 목</th>
			<th>과제명</th>
			<th>제출방법</th>
			<th>제출기한</th>
			<th>공개여부</th>
			<th>제출인원</th>
			<th>담당교수</th>
			<th>제출여부</th>
		</tr>
	</table>
</body>
</html>