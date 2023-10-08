<%@page import="JaeWooVO.PlanVO"%>
<%@page import="JaeWooVO.LectureVO"%>
<%@page import="JaeWooDAO.LectureDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


th, td {
	width : 300px;
	padding: 2px ;
	border: 1px solid #aaa;
	background-clip: padding-box;
	scroll-snap-align: start;
	margin : 0;
	text-align: center;
}

</style>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String contextPath = request.getContextPath();
		
		int sub_no = Integer.parseInt(request.getParameter("sub_no"));
		LectureVO lv = (LectureVO)request.getAttribute("lv");
		PlanVO pv = (PlanVO)request.getAttribute("plan");
	%>

	<form action="modSubjectPro.jsp" method="post">
		<div align="center">
			<h1>수업 계획</h1>
			<table id = "tt" width = "900" border=1>
				<tr>
					<th>과목 이름</th>
					<td><%=lv.getSub_name()%></td>
					<th>전공</th>
					<td><%=lv.getMajor()%></td>
					
				</tr>
				<tr>				
					<th>대상 학년</th>
					<td><%=lv.getGrade()%> 학년</td>
					<th>이수 구분</th>
					<td><%=lv.getComp_sort()%></td>
				</tr>
				<tr>
					
					<th>부여 학점</th>
					<td><%=lv.getCredit()%> 학점</td>	
					<th>강의 장소 (건물명-호수)</th>
					<td><%=lv.getPlace()%></td>			
				</tr>
				<tr>
					<th>교수 이름</th>
					<td><%=lv.getPro_name()%></td>
					<th>연락처/이메일</th>
					<td><%=lv.getPro_email()%></td>
				</tr>
				<tr>
					<th>교육 목표</th>
					<td colspan = 3><%=lv.getEdu_goal()%></td>
				</tr>
				<tr>
					<th>주 교재</th>
					<td colspan = 3><%=lv.getTextbook()%></td>
				</tr>
			</table>
		</div>
		<div align="center">
		<table width = "900" border=1>
		<h2 align="center">강의 평가 계획</h2>
		<tr width = 90%>
				<th>평가 항목</th>
				<th>중간고사</th>
				<th>기말고사</th>
				<th>퀴즈</th>
				<th>과제</th>
				<th>출석</th>
				<th>질문</th>
				<th>토론</th>
		</tr>
		<tr width = 90%>
				<th>비율</th>
				<th><%=pv.getMid_exam()%></th>
				<th><%=pv.getFinal_exam()%></th>
				<th><%=pv.getQuiz()%></th>
				<th><%=pv.getTask()%></th>
				<th><%=pv.getAttendance()%></th>
				<th><%=pv.getJilmun()%></th>
				<th><%=pv.getToron()%></th>
		</tr>
		</table>
			<input type="button" value="강의실 나가기" onClick="history.back()">
		</div>
</body>
</html>