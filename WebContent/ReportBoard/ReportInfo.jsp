<%@page import="java.util.ArrayList"%>
<%@page import="reportVO.ReportVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Integer uniqueId = (Integer) session.getAttribute("uniqueId");
	System.out.println("ReportInfo.jsp 내부 세션 값 : " + uniqueId);
	session.setAttribute("uniqueId", uniqueId);
	ArrayList sublist = (ArrayList) request.getAttribute("submitlist");
	ReportVO reVo = new ReportVO();
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
			<th>학생 번호</th>
			<th>학생 이름</th>
			<th>제목</th>
			<th>내용</th>
			<th>첨부 파일명</th>
			<th>제출여부</th>
		</tr>
		<%
			for (int i = 0; i < sublist.size(); i++) {
				reVo = (ReportVO) sublist.get(i);
		%>
		<tr>
			<td><%=reVo.getWeek()%></td>
			<td><%=reVo.getSub_no()%></td>
			<td><%=reVo.getSub_name()%></td>
			<td><%=reVo.getReport_name()%></td>
			<td><%=reVo.getStu_no()%></td>
			<td><%=reVo.getStu_name()%></td>
			<td><%=reVo.getTitle()%></td>
			<td><%=reVo.getContent()%></td>
			<td><%=reVo.getFilename()%></td>
			<td>제출됨</td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>