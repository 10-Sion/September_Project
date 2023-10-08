<%@page import="JaeWooVO.ProIntroVO"%>
<%@page import="JaeWooVO.DepBean"%>
<%@page import="JaeWooVO.ProBean"%>
<%@page import="JaeWooDAO.ProDao"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	int pro_no = (Integer)session.getAttribute("uniqueId");

	String contextPath = request.getContextPath();
	ProDao pdao = new ProDao();
	
	ProBean pb = pdao.getProInfo(pro_no);
	ProIntroVO piv = pdao.getProIntro(pro_no); 
	
	String home = piv.getHomepage();
	String blog = piv.getBlog();
	String facebook= piv.getFacebook(); 
	String intro = piv.getIntroduce();
	
	if(home == null){
		home = "";
	}
	if(blog == null){
		blog = "";
	}
	if(facebook == null){
		facebook = "";
	}
	if(intro == null){
		intro = "";
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<form action="<%=contextPath%>/Lecture/InsertProIntro.do?pro_no=<%=pro_no%>" method="post">
		<div align="center" class="table" border ="1">
			<h1 align = "left">기본 정보</h1>
			<table border ="1">
				<tr>
					<input type="hidden" name="no" value="<%=pb.getNo()%>">
					<th>이름</th>
					<td><%=pb.getName()%></td>
				
					<th>학부</th>
					<td><%=pb.getDep_name()%></td>
					</tr> 
					<tr>
					<th>전공</th>
						<td>
							<%=pb.getMajor()%>
						</td>
					<th>이메일</th>
					<td><%=pb.getEmail()%></td>
				<tr>
					<th>연락처(휴대폰)</th>
					<td><%=pb.getPhone()%></td>

					<th>연락처(연구실)</th>
					<td><%=pb.getTel()%></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><%=pb.getAddr()%></td>
					<th>연구실 위치</th>
					<td><%=pb.getLabNum()%></td>
				</tr>
			</table>
		</div>
		<div id="buttons" align="center">
		<h1 align = "left">추가 정보</h1>
			<table border ="1">
				<tr>
					<th>홈페이지</th>
					<td><input type="text" name="homepage" style="width:90%;height:30px;font-size:15px;" value="<%=home%>"></td>
				</tr>
				<tr>	
					<th>블로그</th>
					<td><input type="text" name="blog" style="width:90%;height:30px;font-size:15px;" value="<%=blog%>" %>></td>
					</tr>
					<tr>	
					<th>페이스북</th>
					<td><input type="text" name="facebook" style="width:90%;height:30px;font-size:15px;" value="<%=facebook%>"></td>
					</tr>
					<tr>
					
					<th>자기소개</th>
					<td><textarea name="Introduce" style="width:90%;height:300px;font-size:20px;"><%=intro%></textarea></td>
					</tr>
			</table>
		</div>
		<div id="buttons" align="center">
			<input type="submit" value="입력하기" class="submit" />
		</div>
			
	</form>
</body>
</html>