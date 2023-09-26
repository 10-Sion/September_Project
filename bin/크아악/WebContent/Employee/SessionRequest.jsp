<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>세션 값 전달</title>
</head>
<body>
    <h1>세션 값</h1>
    <form action="empMain.jsp" method="GET">
        <label for="sessionValue">세션 값 입력:</label>
        <input type="text" id="sessionValue" name="currentEmployeeId">
        <button type="submit">전송</button>
    </form>
</body>
</html>
