<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String center = request.getParameter("center");
	
	if(center == null){
		center = "Center.jsp";		
	}
	String contextPath = request.getContextPath();
	System.out.println( center );
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<table width="100%" height="100%">
			<tr align="left">
				<td height="30%"> 상단 메뉴 </td>
			</tr>
			<tr>
				<td height="40%"><jsp:include page="${center}" />	
			</tr>
			<tr>
				<td height="30%">하단 메뉴</td>
			</tr>	
		</table>
			

</body>
</html>