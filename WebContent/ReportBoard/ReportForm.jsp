<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	int stu_no = (Integer)session.getAttribute("stu_no");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>과제 등록</h1>
	<form action="<%=contextPath%>/Report/ReportUpload.do"
		method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" name="title"></td>
				<td>작성자</td>
				<td ><input type="text" readonly="readonly" name="stu_no" value="<%=stu_no%>" /></td>
			</tr>
			<tr>
				<th>비밀글 설정</th>
				<td colspan="3"><input type="checkbox" name=secret /></td>
			</tr>
			<tr>
				<td colspan="4">
				<textarea cols="30" rows="5" name="content"></textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="reportfile" value="첨부파일 찾기" /></td>
				<td colspan="4"><input type="submit" value="과제등록"></td>
			</tr>
		</table>
	</form>
</body>
</html>