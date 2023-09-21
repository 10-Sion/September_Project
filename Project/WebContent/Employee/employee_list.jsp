<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    
</head>
<body>
    <h1>Employee 리스트 페이지</h1>
	<table>
	    <tr>
	        <th>직원 번호</th>
	        <th>이름</th>
	        <th>전화번호</th>
	        <th>이메일</th>
	        <th>조회/수정/삭제</th>
	    </tr>
	    <c:forEach items="${employees}" var="employee">
	        <tr>
	            <td>${employee.empNo}</td>
	            <td>${employee.name}</td>
	            <td>${employee.phone}</td>
	            <td>${employee.email}</td>
	            <td>
                    <a href="#" onclick="loadServletData('/HakSaGwanLee/employee/detail?currentEmployeeId=${employee.empNo}')">세부 정보</a>
	            </td>
	        </tr>
	    </c:forEach>
	</table>

</body>
</html>
