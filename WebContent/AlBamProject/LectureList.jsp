<%@page import="java.util.ArrayList"%>
<%@page import="JaeWooDAO.LectureDAO"%>
<%@page import="JaeWooVO.LectureVO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath(); 
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.footer{
	margin : 100px;
	margin-bottom: 20px;
    bottom: 20%;
    left: 70%;
	}
	

</style>
</head>
<body>
	<h1 align="center">강의실(전체 강의리스트)</h1>
	<div align="center">
	
	<table border="2" width="80%" height="50px" class = "Sub_top">
		<tr>
			<th>과목코드</th>
			<th>학년</th>
			<th>과목명</th>
			<th>교수명</th>
			<th>전공</th>
			<th>강의 장소</th>
			<th>학점</th>
			<th>수업계획서</th>
		</tr>	
<%
 ArrayList list = (ArrayList)request.getAttribute("list");
   for(int i = 0; i < list.size(); i++){
	   LectureVO lv = (LectureVO)list.get(i);

  %>
   	 <tr>	
   	 		<th><%=lv.getSub_no()%></th>
   	 		<th><%=lv.getGrade()%></th>
			<th><a href = "<%=contextPath%>/Lecture/LectureList.do?sub_no=<%=lv.getSub_no()%>" ><%=lv.getSub_name()%></a></th> 
			<th><%=lv.getPro_name()%></th>
			<th><%=lv.getMajor()%></th>
			<th><%=lv.getPlace()%></th>
			<th><%=lv.getCredit()%></th>
			<th><a href = "<%=contextPath%>/Lecture/LecturePlan.do?sub_no=<%=lv.getSub_no()%>" >수업 계획</a></th> 	
	</tr>

<%
	}
%>
	</table>
	</div>
</body>
<footer>
	<div class = "footer" align = "center">
		<a href="InsertSubject.jsp">강의 등록</a>
		<a href="ProfessorIndex.jsp">메인 화면</a>
	</div>
</footer>
</html>