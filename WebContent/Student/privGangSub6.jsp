<%@page import="reportVO.ReportlistVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	// 개설된 과제리스트를 반환 받는 rilst 변수
	ArrayList rlist = (ArrayList)request.getAttribute("reportlist");
	ReportlistVO rlistVo = new ReportlistVO();
	Integer session_no = (Integer)session.getAttribute("uniqueId");
	System.out.println(session_no);
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
					onclick="loadPage('<%=contextPath%>/ReportBoard/ReportForm.jsp?report_name=<%=rlistVo.getReposrt_name()%>')">미제출</a></td>
		</tr>
<% 
	}
%>
	</table>
	<a href="javascript:void(0);" 
					onclick="loadServletData('<%=contextPath%>/Report/ReportInfo.do?stu_no=<%=session_no%>')">제출과제목록</a>
</body>
</html>