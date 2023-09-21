<%@page import="Leture.LectureVO"%>
<%@page import="Leture.LectureDAO"%>
<%@page import="Subject.SubBean"%>
<%@page import="Professor.ProDao"%>
<%@page import="Professor.ProBean"%>
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
	border-bottom: 1;
	border-top: 0;
	border-left: 1;
	border-right: 0;
	text-align : center;
}

tbody tr:last-child th,
tbody tr:last-child td {
  border-bottom: 1;
 }
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

		int sub_no = Integer.parseInt(request.getParameter("sub_no"));
		LectureDAO ld = new LectureDAO();
		LectureVO lv = new LectureVO();
			lv = ld.getSubject(sub_no);
	%>

	<form action="modSubjectPro.jsp" method="post">
		<div align="center">
			<h1>과목 상세 정보</h1>
			<table width="900">
				<tr>
					<th>과목 이름</th>
					<td><%=lv.getSub_name()%></td>
					<th>전공</th>
					<td><%=lv.getMajor()%></td>
					
				</tr>
				<tr>				
					<th>대상 학년</th>
					<td><%=lv.getGrade() %></td>
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
					<td>sdfsdfs@adsfad</td>
				</tr>
				<tr>
					<th>교육 목표</th>
					<td colspan = 3><%=lv.getEdu_goal()%></td>
				</tr>
				<tr>
					<th>주 교재</th>
					<td colspan = 3><%=lv.getTextbook()%></td>
				</tr>



<!-- 		edu_goal varchar(100), -- 교육 목표 -->

<!-- 		textbook varchar(20), -- 교재 -->
			</table>
		</div>
		<h2 align="center">강의 평가 계획</h2>
		<div id="buttons" align="center">
			<input type="button" value="강의실 나가기" onClick="history.back()">
		</div>
	</form>
</body>
</html>