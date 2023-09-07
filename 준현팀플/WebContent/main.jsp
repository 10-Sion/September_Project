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
 String user_id = (String)session.getAttribute("user_id");

if(user_id==null) { // 세션에 아이디가 저장되어 있지 않으면 미로그인화면 출력

	

}else{ // 아이디 저장되어 있으면 로그인 된 화면 출력
	out.println(user_id + "님 반갑습니다!");
}
%>


</body>
</html>