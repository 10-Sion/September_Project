<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student 리스트 페이지</title>
</head>
<body>
    <h1>Student 리스트 페이지</h1>
    <table>
        <tr>
            <th>학번</th>
            <th>이름</th>
            <th>전화번호</th>
            <th>이메일</th>

        </tr>
        <c:forEach items="${students}" var="student">
            <tr>
                <td>${student.stuNo}</td>
                <td>${student.name}</td>
                <td>${student.phone}</td>
                <td>${student.email}</td>
                <td>
                    <a href="#" onclick="loadServletData('/HakSaGwanLee/student/detail?currentStudentId=${student.stuNo}')">세부 정보</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
