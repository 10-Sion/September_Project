<%@page import="java.util.ArrayList"%>
<%@page import="stuVO.SubVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
	ArrayList subList = (ArrayList)request.getAttribute("subList");
	SubVO subVo = new SubVO();
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
    <div class="table">
        <table>
			<tr align="center">
				<td>과목 번호</td>
				<td>과목 명</td>
				<td>담당교수</td>
				<td>전공</td>
				<td>유형</td>
				<td>학년</td>
				<td>학기</td>
				<td>수업명</td>
				<td>강의실</td>
				<td>수강신청</td>
			</tr>
<%
	for(int i = 0; i < subList.size(); i++){
	subVo = (SubVO)subList.get(i);
%>
			<tr align="center">
				<td><%=subVo.getSub_no() %></td>
				<td><%=subVo.getSub_name() %></td>
				<td><%=subVo.getPro_name() %></td>
				<td><%=subVo.getMajor() %></td>
				<td><%=subVo.getComp_sort() %></td>
				<td><%=subVo.getGrade() %></td>
				<td><%=subVo.getPeriod() %></td>
				<td><%=subVo.getEdu_goal() %></td>
				<td><%=subVo.getPlace() %></td>
				<td><a href="javascript:void(0);" 
    onclick="loadPage('<%=contextPath%>/stu/addSubject.do?sub_no=<%=subVo.getSub_no()%>&stu_no=<%=session_no%>&sub_no=<%=subVo.getSub_no()%>')">등록</a></td>
			</tr>
<%
	}
%>
    	</table>
    </div>
</body>
</html>