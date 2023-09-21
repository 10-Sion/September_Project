<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>직원 세부 정보</title>
</head>
<body>
    <h1>직원 세부 정보</h1>
    
    <c:if test="${employee != null}">
        <table>
            <tr>
                <th>직원 번호:</th>
                <td>${employee.empNo}</td>
            </tr>
            <tr>
                <th>이름:</th>
                <td>${employee.name}</td>
            </tr>
            <tr>
                <th>주소:</th>
                <td>${employee.addr}</td>
            </tr>
            <tr>
                <th>전화번호:</th>
                <td>${employee.phone}</td>
            </tr>
            <tr>
                <th>휴대폰번호:</th>
                <td>${employee.tel}</td>
            </tr>
            <tr>
                <th>이메일:</th>
                <td>${employee.email}</td>
            </tr>
        </table>
    </c:if>
    
    <c:if test="${employee == null}">
        <p>직원 정보를 가져오지 못했습니다.</p>
    </c:if>
    
    <a href="/HakSaGwanLee/employee/list">직원 목록으로 돌아가기</a>
</body>
</html>
