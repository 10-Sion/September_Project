<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
            <th>Tel</th>
            <th>Phone</th>
            <th>Major</th>
            <th>Email</th>
            <th>Lab Number</th>
        </tr>
        <tr>
            <td>${professorInfo.proNo}</td>
            <td>${professorInfo.pw}</td>
            <td>${professorInfo.name}</td>
            <td>${professorInfo.addr}</td>
            <td>${professorInfo.tel}</td>
            <td>${professorInfo.phone}</td>
            <td>${professorInfo.major}</td>
            <td><a href="mailto:${professorInfo.email}">${professorInfo.email}</a></td>
            <td>${professorInfo.labNum}</td>
        </tr>
    </table>
</body>
</html>
