
<%@page import="JaeWooVO.SubBean"%>
<%@page import="JaeWooDAO.SubDao"%>
<%@page import="java.util.List"%>
<link rel="stylesheet" href="../pageSetUp/mainStyle.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>


<% 
  SubDao subDao = new SubDao();
   //테스트용 세션값
//  int pro_no = (int)session.getAttribute("pro_no"); //테스트용 세션값
  int pro_no = 1012;
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
	<h1 align="center">강의 목록</h1>
	<div align="center" class="table">
	
	<table border="1" class = "Sub_top">
		<tr>
			<th>과목코드</th>
			<th>교수명</th>
			<th>과목명</th>
			<th>학부</th>
			<th>전공</th>
			<th>강의 장소</th>
			<th>학점</th>
			<th>수강 정원</th>
			<th></th>
			<th></th>
		</tr>	
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
			<th><%=sb.getDep_name()%></th>
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
	<div class = "footer" align = "center">
		<a href="InsertSubject.jsp">강의 등록</a>
		<a href="ProfessorIndex.jsp">메인 화면</a>
	</div>

</footer>
</html>