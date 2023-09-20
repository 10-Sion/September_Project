<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="real_jjin_mak.Employee" %>
<%@ page import="real_jjin_mak.EmployeeModel" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Information</title>
</head>
<body>
    <h1>Employee Information</h1>
    <%
        // EmployeeModel 인스턴스 생성
        EmployeeModel employeeModel = new EmployeeModel();
        Employee employee = employeeModel.getEmployeeById(1); // 예시로 empId=1을 사용
    %>
    <p>Employee No: <%= employee.getEmpNo() %></p>
    <p>Name: <%= employee.getName() %></p>
    <p>Address: <%= employee.getAddr() %></p>
	<p>Phone: <%= employee.getPhone() %></p>
	<p>Tel: <%= employee.getTel() %></p>
	<p>Email: <%= employee.getEmail() %></p>

</body>
</html>
