<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Employee Information</title>
</head>
<body>
    <h1>Edit Employee Information</h1>
    
    <form action="${pageContext.request.contextPath}/employee/update" method="post">
        <input type="hidden" name="currentEmployeeId" value="${currentEmployeeId}">
        
        <label for="newPw">New Password:</label>
        <input type="text" id="newPw" name="newPw"><br>
        
        <label for="newName">New Name:</label>
        <input type="text" id="newName" name="newName"><br>
        
        <label for="newAddr">New Address:</label>
        <input type="text" id="newAddr" name="newAddr"><br>
        
        <label for="newPhone">New Phone:</label>
        <input type="text" id="newPhone" name="newPhone"><br>
        
        <label for="newTel">New Mobile:</label>
        <input type="text" id="newTel" name="newTel"><br>
        
        <label for="newEmail">New Email:</label>
        <input type="text" id="newEmail" name="newEmail"><br>
        
        <input type="submit" value="Save Changes">
    </form>
</body>
</html>
