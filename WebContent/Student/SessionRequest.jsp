<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
	session.setAttribute("uniqueId", 2000);
	session.setAttribute("stu_no", 2000);
%>
<!DOCTYPE html>
<html>
<head>
    <title>세션 값 전달</title>
</head>
<body>
    <h1>세션 값</h1>
    <form action="../Student/stuMain.jsp" method="POST">
        <label for="sessionValue">세션 값 입력:</label>
        <input type="text" id="sessionValue" name="stu_no1">
        <button type="submit">전송</button>
    </form>
</body>
</html>