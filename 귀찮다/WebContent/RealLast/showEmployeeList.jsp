<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee List</title>
</head>
<body>
    <h1>Employee List</h1>
    <table border="1">
        <tr>
            <th>Employee No</th>
            <th>Name</th>
            <th>Telephone</th>
            <th>Email</th>
        </tr>
        <c:forEach var="employee" items="${employees}">
            <tr>
                <td>${employee.empNo}</td>
                <td>${employee.name}</td>
                <td>${employee.tel}</td>
                <td>${employee.email}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
