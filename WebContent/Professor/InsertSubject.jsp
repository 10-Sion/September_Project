
<%@page import="JaeWooVO.ProBean"%>
<%@page import="JaeWooDAO.ProDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String contextPath = request.getContextPath();		
%>
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
 	Integer pro_no = (Integer)session.getAttribute("uniqueId");
 	
 	System.out.println(pro_no);
 	
 	
 	ProDao pdao = new ProDao();
 	
 	ProBean pb = pdao.getProInfo(pro_no);
 	String pro_name = pb.getName();
 	String major = pb.getMajor();
 	String dep_name = pb.getDep_name();
 	String pro_email = pb.getEmail();
 	
%>

<form action= '<%=contextPath%>/Lecture/InsertSubject.do' method ="post" >
	<h1>과목 등록</h1>
	<div align="center" class="table">
	
	<table border="1">
		<tr>
			<th>과목명</th>
			<td><input type = "text" name = "sub_name"></td>
		</tr>
		<tr>
			<th>교수명</th>
			<td><input type= "hidden" name="pro_name" value ="<%=pro_name%>"><%=pro_name%>
				<input type= "hidden" name="major" value ="<%=pro_email%>">
				<input type= "hidden" name="pro_no" value ="<%=pro_no%>">
			</td>
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
			<th>학년</th>
			<td>
				<select name="grade">
							<option selected disabled>학기</option>
							<option value="1" >1학년</option>
							<option value="2" >2학년</option>
							<option value="3" >3학년</option>
							<option value="4" >4학년</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>이수 구분</th>
			<td>
				<select name="comp_sort">
							<option selected disabled>학기</option>
							<option value="교양 필수" >교양 필수</option>
							<option value="교양" >교양</option>
							<option value="전공 필수" >전공 필수</option>
							<option value="전공 기초" >전공 기초</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>교육 목표</th>
			<td><input type="text" name= "edu_goal"  width = "200px" height = "100px"></td>
		</tr>
		<tr>
			<th>강의 장소</th>
			<td><input type="text" name= "place" value= "<%=dep_name%>건물-000호"></td>	
		</tr>
		<tr>
			<th>부여 학점</th>
			<td>	
				<select name="credit">
							<option selected disabled>학점</option>
							<option value="1" >1 학점</option>
							<option value="2" >2  학점</option>
							<option value="3" >3  학점</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>학기</th>
			<td>
				<select name="period">
							<option selected disabled>학기</option>
							<option value="1" >1 학기</option>
							<option value="2" >2 학기</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>강의 장소</th>
			<td><input type="text" name= "place" value= "<%=dep_name%>건물-000호"></td>	
		</tr>
		<tr>
			<th>강의 교재</th>
			<td><input type="text" name= "textbook" ></td>	
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