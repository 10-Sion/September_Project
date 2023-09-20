<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Professor Information</title>
</head>
<body>
    <h1>Professor Information</h1>

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
        <tr>
            <td>${professorInfo.no}</td>
            <td>${professorInfo.pw}</td>
            <td>${professorInfo.name}</td>
            <td>${professorInfo.addr}</td>
            <td>${professorInfo.phone}</td>
            <td>${professorInfo.tel}</td>
            <td>${professorInfo.major}</td>
            <td><a href="mailto:${professorInfo.email}">${professorInfo.email}</a></td>
            <td>${professorInfo.labnum}</td>
        </tr>
    </table>
</body>
</html>
