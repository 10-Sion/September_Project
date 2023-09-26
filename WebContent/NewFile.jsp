
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html; charset=UTF-8"%>


<%@page import="java.sql.Driver"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>DB 연결 테스트</h1>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GwanLee","pid","1234");
	
	if(con!=null){
		out.print("연결 성공");
	}else{
		out.print("연결 실패");
	}

%>



</body>
</html>