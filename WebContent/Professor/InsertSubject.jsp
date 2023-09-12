<%@page import="Professor.ProDao"%>
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
	
 //	int pro_no = Integer.parseInt( request.getParameter("no")) ;
 //	String P_name = request.getParameter("name");
 	int pro_no = (int)session.getAttribute("pro_no"); //로그인 된 교수의 정보를 가져오는 테스트용 세션값 가져오기
 	System.out.println(pro_no);
 	
 	
 	ProDao pdao = new ProDao();
 	
 	ProBean pb = pdao.getProInfo(pro_no);
 	String pro_name = pb.getName();
 	String major = pb.getMajor();	
 	
 	
%>

<form action = "InsertSubjectPro.jsp" method ="post">
	<div align="center">
	<h1>과목 등록</h1>
	<table>
		<tr>
			<th>과목명</th>
			<td><input type = "text" name = "sub_name"></td>
		</tr>
		<tr>
			<th>교수명</th>
			<td><input type= "hidden" name="pro_name" value ="<%=pro_name%>"><%=pro_name%></td>
		</tr>
		<tr>
			<th>전공</th>
			<td><input type= "hidden" name="major" value ="<%=major%>"><%=major%></td>
		</tr>
		<tr>
			<td><input type= "hidden" name="pro_no" value ="<%=pro_no%>"></td> <%-- <%=pro_no%> --%>		
		</tr>
		<tr>
			<th>강의 장소(건물명-호수)</th>
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
		<tr>
			<th>수강인원</th>
			<td><input type="text" name= "count"></td>
		</tr>
	</table>
	</div>
	<div id="buttons" align="center">
		<input type="submit" value="수업등록" class="submit"/>
		<input type="reset" value="등록취소" class="cancel"/><br>
		<br><br><br><br>
		<input type="button" value="이전 페이지" class="cancel" onclick="history.back()"/>
	</div>
</form>
</body>
</html>