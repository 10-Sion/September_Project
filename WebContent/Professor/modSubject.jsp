
<%@page import="JaeWooVO.SubBean"%>
<%@page import="JaeWooDAO.ProDao"%>
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

 	int pro_no = (int)session.getAttribute("pro_no");

 
 	//Subindex에서 수정 버튼을 클릭할때 넘겨받은 sub_no 을 저장
 	int sub_no = Integer.parseInt( request.getParameter("sub_no")) ;
 	ProDao pdao = new ProDao();
 	SubBean sb = pdao.getSubject(sub_no);
%>

<form action = "modSubjectPro.jsp" method = "post">
	<div align="center">
	<h1>개설과목 수정</h1>
	<table>
		<tr>
			<td><input type = "hidden" name = "sub_no" value ="<%=sub_no%>"></td>
		</tr>
		<tr>
			<th>과목 이름</th>
			<td><input type = "text" name = "sub_name" value= "<%=sb.getSub_name()%>"></td>
		</tr>
		<tr>
			<th>교수 이름</th>
			<td><input type = "hidden" name = "pro_name" value= "<%=sb.getPro_name()%>"><%=sb.getPro_name()%></td>
		</tr>
		<tr>
			<th>학부</th>
			<td><input type = "hidden" name = "dep_name" value="<%=sb.getDep_name()%>"><%=sb.getDep_name()%></td>
		</tr>
		<tr>
			<th>전공</th>
			<td><input type= "hidden" name="major" value ="<%=sb.getMajor()%>"><%=sb.getMajor()%></td>
		</tr>
		<tr>
			<td><input type= "hidden" name="pro_no" value ="<%=sb.getPro_no()%>"></td> <%-- <%=pro_no%> --%>		
		</tr>
		<tr>
			<th>강의 장소 (건물명-호수)</th>
			<td><input type="text" name= "place"  value="<%=sb.getPlace()%>"></td>
		</tr>
		<p></p>
		<tr>
			<th>부여 학점</th>
			<td>
			<select name="point">
							<option value="1" <%if(sb.getPoint()==1){%>selected<%}%>>1</option>
							<option value="2" <%if(sb.getPoint()==2){%>selected<%}%>>2</option>
							<option value="3" <%if(sb.getPoint()==3){%>selected<%}%>>3</option>
			</select>
			</td>
		</tr>
		<tr>
			<th>수강인원</th>
			<td><input type="text" name= "capacity" value="<%=sb.getCapacity()%>"></td>
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