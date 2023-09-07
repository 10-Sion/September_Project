<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Employee List</title>
</head>
<body>
    <h1>Employee List</h1>
<!-- 데이터 가져와 보여줄 테이블 -->    
    <table border="1">
        <tr>
		    <th>Employee ID</th>
		    <th>Password</th>
		    <th>Name</th>
		    <th>Address</th>
		    <th>Phone</th>
		    <th>Email</th>
		</tr> 

        <c:forEach var="employee" items="${employeeLookup}">
            <tr>
                <td>${employee.no}</td>
                <td>${employee.name}</td>
                <td>${employee.addr}</td>
                <td>${employee.phone}</td>
                <td>${employee.email}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
