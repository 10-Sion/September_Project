<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        </tr>
        <c:forEach var="professor" items="${professorList}">
            <tr>
                <td>${professor.no}</td>
                <td>${professor.pw}</td>
                <td>${professor.name}</td>
                <td>${professor.addr}</td>
                <td>${professor.phone}</td>
                <td>${professor.tel}</td>
                <td>${professor.major}</td>
                <td>${professor.email}</td>
                <td>${professor.labnum}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
