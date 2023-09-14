<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    
</head>
<body>
    <h1>Employee 세부 정보 페이지</h1>
    <p>직원 번호: ${employee.emp_no}</p>
    <p>비밀번호: ${employee.pw}</p>
    <p>이름: ${employee.name}</p>
    <p>주소: ${employee.addr}</p>
    <p>전화번호: ${employee.phone}</p>
    <p>휴대폰번호: ${employee.tel}</p>
    <p>이메일: ${employee.email}</p>
    <a href="/employee/edit?emp_no=${employee.emp_no}">수정</a>
    <a href="/employee/delete?emp_no=${employee.emp_no}">삭제</a>
</body>
</html>
