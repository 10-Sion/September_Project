<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Professor Info</title>
</head>
<body>
    <h1>Professor Information</h1>
    <table border="1">
        <tr>
            <th>Professor No</th>
            <th>Password</th>
            <th>Name</th>
            <th>Address</th>
            <th>Tel</th>
            <th>Phone</th>
            <th>Major</th>
            <th>Email</th>
            <th>Lab Number</th>
        </tr>

        <c:forEach items="${professors}" var="professor">
            <tr>
                <td>${professor.proNo}</td>
                <td>${professor.pw}</td>
                <td>${professor.name}</td>
                <td>${professor.addr}</td>
                <td>${professor.tel}</td>
                <td>${professor.phone}</td>
                <td>${professor.major}</td>
                <td>${professor.email}</td>
                <td>${professor.labNum}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
