<%@page import="Professor.ProBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%--
	SubIndex에서 request객체로 넘어온 pro_no의(세션 아이디 no값)과 
	수정할 행의 p_no값이 다른지 비교 
	SubIndex.jsp를 복사해서 if( 교수id == 로그인해서 저장된 세션)이면
	수정가능한 화면 보여주기,
	만약 권한이 없으면 (else)?
	alert("수정 권한이 없습니다.") 알림을 띄우고 history.back() 으로 이전페이지 보여주기.
 --%>
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
 	int pro_no = (int)session.getAttribute("pro_no");
 //	String p_name = (String)session.getAttribute("pro_no");
%>

<form action = "modSubjectPro.jsp" method = "post">
	<div align="center">
	<h1>과목 등록</h1>
	<table>
		<tr>
			<th>과목 이름</th>
			<td><input type = "text" name = "sub_name"></td>
		</tr>
		<tr>
			<th>교수 이름</th>
			<td>그녀석<%--<%=p_name%>--%></td>
		</tr>
		<tr>
			<th>교수 번호</th>
			<td><input type= "hidden" name="pro_no" value ="<%=pro_no%>"><%=pro_no%></td> <%-- <%=pro_no%> --%>		
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
		<input type="submit" value="수정" class="submit"/> 
		<input type="button" value="취소" onClick="history.back()"> 
	</div>
</form>
</body>
</html>