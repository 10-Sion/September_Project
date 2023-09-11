<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Show Professor List</title>
</head>
<body>
    <h1>Professor List</h1>
    <table border="1">
        <tr>
            <th>Professor No</th>
            <th>Name</th>
            <th>Tel</th>
            <th>Major</th>
        </tr>

        <c:forEach items="${professors}" var="professor">
            <tr>
                <td><a href="<c:url value='displayProInfo.jsp'><c:param name='pro_no' value='${professor.proNo}'/></c:url>">${professor.proNo}</a></td>
                <td>${professor.name}</td>
                <td>${professor.tel}</td>
                <td>${professor.major}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
