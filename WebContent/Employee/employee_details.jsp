<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="../pageSetUp/mainStyle.css">
    <style>
        .edit_form {display: none;}
    </style>
</head>
<body>
    <h1>Employee 세부 정보 페이지</h1>

    <table>
        <tr>
            <th>직원 번호</th>
            <td>${employee.getEmpNo()}</td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td>${employee.getPw()}</td>
        </tr>
        <tr>
            <th>이름</th>
            <td>${employee.getName()}</td>
        </tr>
        <tr>
            <th>주소</th>
            <td>${employee.getAddr()}</td>
        </tr>
        <tr>
            <th>전화번호</th>
            <td>${employee.getPhone()}</td>
        </tr>
        <tr>
            <th>휴대폰번호</th>
            <td>${employee.getTel()}</td>
        </tr>
        <tr>
            <th>이메일</th>
            <td>${employee.getEmail()}</td>
        </tr>
    </table>
    
    <button class="editBtn" onclick="showEditForm()">수정</button>
    
    <!-- 수정 폼 -->
    <form class="edit_form" action="${pageContext.request.contextPath}/employee/update" method="POST" accept-charset="UTF-8">
        <input type="hidden" name="currentEmployeeId" value="${employee.getEmpNo()}">
        
        <label for="newPw">비밀번호:</label>
        <input type="text" id="newPw" name="newPw" value="${employee.getPw()}"><br>
    
        <label for="newName">이름:</label>
        <input type="text" id="newName" name="newName" value="${employee.getName()}"><br>
    
        <label for="newAddr">주소:</label>
        <input type="text" id="newAddr" name="newAddr" value="${employee.getAddr()}"><br>
    
        <label for="newPhone">전화번호:</label>
        <input type="text" id="newPhone" name="newPhone" value="${employee.getPhone()}"><br>
    
        <label for="newTel">휴대폰번호:</label>
        <input type="text" id="newTel" name="newTel" value="${employee.getTel()}"><br>
    
        <label for="newEmail">이메일:</label>
        <input type="text" id="newEmail" name="newEmail" value="${employee.getEmail()}"><br>
    
        <input type="submit" value="수정">
        <button class="edit_cancle" onclick="cancelEditForm()">취소</button>
    </form>

    <script src="../pageSetUp/myPage.js"></script>
</body>
</html>
