<%@page import="Professor.ProBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
 // int pro_no = Integer.parseInt( request.getParameter("no")) ;
 //	String P_name = request.getParameter("name");
%>

<form action = "InsertSubjectPro.jsp" method = "post">
	<div align="center">
	<h1>과목 등록</h1>
	<table>
		<tr>
			<th>과목 이름</th>
			<td><input type = "text" name = "sub_name"></td>
		</tr>
		<tr>
			<th>교수 이름</th>
			<td>그녀석<%--<%=P_name%>--%></td>
		</tr>
		<tr>
			<th>교수 번호</th>
			<td><a type = "text" a name ="pro_no"  value ="2003"/>2003</td> <%-- <%=pro_no%> --%>		
		</tr>
		<tr>
			<th>강의 장소 (건물명-호수)</th>
			<td><input type="text" name= "place"></td>
		</tr>
		<p></p>
		<tr>
			<th>부여 학점</th>
			<td>	
				1<input type="radio" name="point" value= 1>
				2<input type="radio" name="point" value= 2>
				3<input type="radio" name="point" value= 3>
			</td>
		</tr>
		
	</table>
	</div>
	<div id="buttons" align="center">
		<input type="submit" value="수업등록" class="submit"/> 
		<input type="reset" value="등록취소" class="cancel"/>
	</div>
</form>
</body>
</html>