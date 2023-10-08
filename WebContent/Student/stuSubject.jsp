<%@page import="stuVO.SubVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	ArrayList stuSub = (ArrayList) request.getAttribute("stuSub");
	SubVO suVo = new SubVO();
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
	<h4>수강신청 과목 리스트</h4>
	<table>
		<tr>
			<th>과목 번호</th>
			<th>과목</th>
			<th>담당교수</th>
			<th>유형</th>
			<th>학년</th>
			<th>학기</th>
			<th>수업명</th>
			<th>강의실</th>
			<th>전공</th>
			<th>수강취소</th>
		</tr>
<%
	if(stuSub.size() == 0){
%>
	<tr>
		<td colspan="9" align="center"><b>등록된 강의가 없습니다.</b></td>
	</tr>
<%
	}else{
		for (int i = 0; i < stuSub.size(); i++) {
			suVo = (SubVO)stuSub.get(i);
%>
		<tr>
			<td><%=suVo.getSub_no() %></td>
			<td><%=suVo.getSub_name() %></td>
			<td><%=suVo.getPro_name() %></td>
			<td><%=suVo.getComp_sort() %></td>
			<td><%=suVo.getGrade() %></td>
			<td><%=suVo.getPeriod() %></td>
			<td><%=suVo.getEdu_goal() %></td>
			<td><%=suVo.getPlace() %></td>
			<td><%=suVo.getMajor() %></td>
			<td><a href="javascript:void(0);" 
			onclick="loadServletData('<%=contextPath%>/stu/delSubject.do?sub_no=<%=suVo.getSub_no()%>&stu_no=<%=session_no%>')">수강취소</a></td>
		</tr>
<%
		}
	}
%>
	</table>
</body>
</html>