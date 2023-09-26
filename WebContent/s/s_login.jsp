<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath() %>/stu/loginPro.do"  method="post" >
		학 번 : <input type="text" name="stu_no"> <br>
		비 번 : <input type="text" name="stu_pw"> <br>
		<input type="submit" value="로그인"> <input type="reset" value="다시입력">
	</form>
</body>
</html>