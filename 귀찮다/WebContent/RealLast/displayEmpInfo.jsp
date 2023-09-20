<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Detail</title>
</head>
<body>
    <h1>Employee Detail</h1>
    <c:if test="${employee ne null}">
        <table border="1">
            <tr>
                <th>Employee No</th>
                <td>${employee.empNo}</td>
            </tr>
            <tr>
                <th>Password</th>
                <td>${employee.pw}</td>
            </tr>
            <tr>
                <th>Name</th>
                <td>${employee.name}</td>
            </tr>
            <tr>
                <th>Address</th>
                <td>${employee.addr}</td>
            </tr>
            <tr>
                <th>Phone</th>
                <td>${employee.phone}</td>
            </tr>
            <tr>
                <th>Telephone</th>
                <td>${employee.tel}</td>
            </tr>
            <tr>
                <th>Email</th>
                <td>${employee.email}</td>
            </tr>
        </table>
    </c:if>
</body>
</html>
