<%@page import="reportVO.ReportlistVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	
	ArrayList rlist = (ArrayList)request.getAttribute("reportlist");
	
	ReportlistVO rlistVo = new ReportlistVO();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
<%
	for(int i=0; i<rlist.size(); i++){
		rlistVo = (ReportlistVO)rlist.get(i);
%>
		<tr>
			<td><%=rlistVo.getWeek() %></td>
			<td><%=rlistVo.getSub_no() %></td>
			<td><%=rlistVo.getSub_name() %></td>
			<td><%=rlistVo.getReposrt_name() %></td>
			<td><%=rlistVo.getMethod() %></td>
			<td><%=rlistVo.getPeriod() %></td>
			<td><%=rlistVo.getDisclosure() %></td>
			<td><%=rlistVo.getPersonnel() %></td>
			<td><%=rlistVo.getPro_name() %></td>
			<td><a href="javascript:void(0);" 
			onclick="loadPage('<%=contextPath%>/ReportBoard/ReportForm.jsp?report_name=<%=rlistVo.getReposrt_name()%>')">제출하기</a></td>
		</tr>
<% 
	}
%>
		
	</table>
</body>
</html>