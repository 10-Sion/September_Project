
<%@page import="JaeWooVO.ProBean"%>
<%@page import="JaeWooDAO.ProDao"%>
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
 	//int pro_no = (int)session.getAttribute("pro_no"); //로그인 된 교수의 정보를 가져오는 테스트용 세션값 가져오기
 	int pro_no = 1012;
 	System.out.println(pro_no);
 	
 	
 	ProDao pdao = new ProDao();
 	
 	ProBean pb = pdao.getProInfo(pro_no);
 	String pro_name = pb.getName();
 	String major = pb.getMajor();
 	String dep_name = pb.getDep_name();
 	
 	
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
			<th>학부</th>
			<td><input type = "hidden" name = "dep_name" value="<%=dep_name%>"><%=dep_name%></td>
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
				<select name="point">
							<option selected disabled>학점</option>
							<option value="1" >1 학점</option>
							<option value="2" >2  학점</option>
							<option value="3" >3  학점</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>수강인원</th>
			<td><input type="text" name= "capacity"></td>
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