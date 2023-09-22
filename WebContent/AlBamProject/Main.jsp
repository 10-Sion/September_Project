<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String center = request.getParameter("center");
	
	if(center == null){
		center = "LectureList.jsp";		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

		<table width="100%" height="100%">
			<tr align="left">
				<td height="30%"> 상단 메뉴 </td>
			</tr>
			<tr>
				<td height="40%"><jsp:include page="${center}" /></td>
			</tr>
			<tr>
			<td>
				<div>
					<a href = "contextPath/Lecture/LectureList.do">강의 리스트</a>
				</div>
			</tr>
			<tr>
				<td height="30%">하단 메뉴</td>
			</tr>
		</table>

</body>
</html>