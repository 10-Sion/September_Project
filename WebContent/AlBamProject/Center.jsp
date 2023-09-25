<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<tr>
				<td><a href ="<%=contextPath%>/Lecture/LectureList.do">강의 리스트</a></td>
				<td><a href ="<%=contextPath%>/Lecture/Notice.do">공지사항</a>
		</tr>	
	</div>
</body>
</html>