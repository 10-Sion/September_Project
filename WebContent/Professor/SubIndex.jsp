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
  int pro_no = (int)session.getAttribute("pro_no"); //테스트용 세션값

  String pro_name = (String)session.getAttribute("pro_name");

  String major = (String)session.getAttribute("major");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.footer{
	margin-bottom: 20px;
    bottom: 20%;
    left: 70%;
	}
	
	.th{
	width : 90%;
	}

</style>
</head>
<body>
	<h1 align="center">강의 목록</h1>
	<div align="center">
	
	<table border="2" width="80%" height="30" class = "Sub_top">
		<tr>
			<th>과목코드</th>
			<th>교수명</th>
			<th>과목명</th>
			<th>전공</th>
			<th>강의 장소</th>
			<th>학점</th>
			<th>수강 정원</th>
			<th></th>
			<th></th>
		</tr>	
	</table>
	<table border="2" width="80%" height="30">	
<%
  SubBean sb = new SubBean();
   List list = new SubDao().getSublist(pro_no);
   for(int i = 0; i < list.size(); i++){
    sb = (SubBean)list.get(i);
    
  %>
   	 <tr>	
   	 		<th><%=sb.getSub_no()%></th>
			<th><%=sb.getPro_name()%></th> 
			<th><%=sb.getSub_name()%></th>
			<th><%=sb.getMajor()%></th>
			<th><%=sb.getPlace()%></th>
			<th><%=sb.getPoint()%></th>
			<th><%=sb.getCapacity()%></th>
			<th><a href="modSubject.jsp?pro_no=<%=sb.getPro_no()%>&sub_no=<%=sb.getSub_no()%>">수정</a></th> <%-- 수정할 페이지로 이동 --%>
			<th><a href="deleteSubject.jsp?sub_no=<%=sb.getSub_no()%>">삭제</a></th> <%-- 삭제할 페이지로 이동 --%>	
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
	<div class = "footer">
		<a href="InsertSubject.jsp">강의 등록</a>
		<a href="ProfessorIndex.jsp">메인 화면</a>
	</div>

</footer>
</html>