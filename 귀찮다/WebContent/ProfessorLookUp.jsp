<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Professor List</title>
</head>
<body>
    <h1>Professor List</h1>

    <table border="1">
        <tr>
            <th>Professor Number</th>
            <th>Password</th>
            <th>Name</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Telephone</th>
            <th>Major</th>
            <th>Email</th>
            <th>Lab Number</th>
            <!-- 필요한 교수 정보 컬럼 추가 -->
        </tr>
        <c:forEach var="professor" items="${professorLookup}">
            <tr>
                <td>${professor.no}</td>
                <td>${professor.pw}</td>
                <td>${professor.name}</td>
                <td>${professor.addr}</td>
                <td>${professor.phone}</td>
                <td>${professor.tel}</td>
                <td>${professor.major}</td>
                <td><a href="mailto:${professor.email}">${professor.email}</a></td>
                <td>${professor.labnum}</td>
                <!-- 교수 정보 컬럼 출력 -->
            </tr>
        </c:forEach>
    </table>
</body>
</html>
