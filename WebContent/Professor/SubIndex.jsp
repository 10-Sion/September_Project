<%@page import="Professor.ProDao"%>
<%@page import="Subject.SubDao"%>
<%@page import="java.util.List"%>
<%@page import="Subject.SubBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>


<% 
  SubDao subDao = new SubDao();
  session.setAttribute("pro_no", 2003); //테스트용 세션값
  int pro_no = (int)session.getAttribute("pro_no"); //테스트용 세션값
 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.footer{
	margin-bottom: 20px;
	position: absolute;
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
			<th>과목명</th>
			<th>교수번호</th>
			<th>강의 장소</th>
			<th>학점</th>
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
			<th><%=sb.getSub_name()%></th>
			<th><%=sb.getPro_no()%></th>
			<th><%=sb.getPlace()%></th>
			<th><%=sb.getPoint()%></th>
			<th><a href="modSubject.jsp?pro_no=<%=sb.getPro_no()%>&sub_no=<%=sb.getSub_no()%>">수정</a></th> <%-- 수정할 페이지로 이동 --%>
			<th><a href="deleteSubject.jsp?sub_no=<%=sb.getSub_no()%>">삭제</a></th> <%-- 삭제할 페이지로 이동 --%>	
	</tr>
	

<%
	}
%>
	</table>
	</div>
</body>
<footer>
	<div class = "footer">
		<a href="InsertSubject.jsp">강의 등록</a>
	</div>

</footer>
</html>