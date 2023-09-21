<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee 정보 수정 페이지</title>
</head>
<body>
    <h1>Employee 정보 수정 페이지</h1>
    <form method="post" action="/employee/edit">
        <input type="hidden" name="emp_no" value="${employee.emp_no}">
        <label for="pw">비밀번호:</label>
        <input type="password" name="pw" value="${employee.pw}">
        
        <!-- 나머지 필드들 추가 -->
        <label for="name">이름:</label>
        <input type="text" name="name" value="${employee.name}">
        
        <label for="addr">주소:</label>
        <input type="text" name="addr" value="${employee.addr}">
        
        <label for="phone">전화번호:</label>
        <input type="text" name="phone" value="${employee.phone}">
        
        <label for="tel">휴대폰번호:</label>
        <input type="text" name="tel" value="${employee.tel}">
        
        <label for="email">이메일:</label>
        <input type="text" name="email" value="${employee.email}">
        
        <!-- 저장 버튼 추가 -->
        <button type="submit">저장</button>
    </form>
</body>
</html>
