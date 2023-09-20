<%@page import="Professor.ProDao"%>
<%@page import="Subject.SubDao"%>
<%@page import="java.util.List"%>
<%@page import="Subject.SubBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>


<% 
  SubDao subDao = new SubDao();
   //테스트용 세션값
//  int pro_no = (int)session.getAttribute("pro_no"); //테스트용 세션값

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
			<th>과목명</th>
			<th>교수명</th>
			<th>학부</th>
			<th>전공</th>
			<th>강의 장소</th>
			<th>학점</th>
			<th>수강 정원</th>
		</tr>	
<%
  SubBean sb = new SubBean();
   List list = new SubDao().getSublist();
   for(int i = 0; i < list.size(); i++){
    sb = (SubBean)list.get(i);
    
  %>
   	 <tr>	
   	 		<th><%=sb.getSub_no()%></th>
			<th><a href = "SubjectDetail.jsp?sub_no=<%=sb.getSub_no()%>" ><%=sb.getSub_name()%></a></th> 
			<th><%=sb.getPro_name()%></th>
			<th><%=sb.getDep_name()%></th>
			<th><%=sb.getMajor()%></th>
			<th><%=sb.getPlace()%></th>
			<th><%=sb.getPoint()%></th>
			<th><%=sb.getCapacity()%></th>
	</tr>
	
<!-- no int primary key auto_increment, -- 강의코드 -->
<!-- name varchar(20), 	-- 과목명 -->
<!-- Pro_name varchar(20),	-- 교수 이름, -->
<!-- Pro_no int not null, -- 교수 번호 -->
<!-- place varchar(20) not null, -- 강의 장소 -->
<!-- count int not null, -- 수강 가능 인원 -->
<!-- major varchar(20) -- 전공 -->

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