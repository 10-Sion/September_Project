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
    <button class="editBtn">수정</button>

    <!-- 폼을 이용하여 정보 수정 -->
	<form class="edit_form" action="/Employee/employee/indivDetail" method="POST">
	    <label for="pw">비밀번호:</label>
	    <input type="text" id="pw" name="pw" value="${employee.getPw()}"><br>
	
	    <label for="name">이름:</label>
	    <input type="text" id="name" name="name" value="${employee.getName()}"><br>
	
	    <label for="addr">주소:</label>
	    <input type="text" id="addr" name="addr" value="${employee.getAddr()}"><br>
	
	    <label for="phone">전화번호:</label>
	    <input type="text" id="phone" name="phone" value="${employee.getPhone()}"><br>
	
	    <label for="tel">휴대폰번호:</label>
	    <input type="text" id="tel" name="tel" value="${employee.getTel()}"><br>
	
	    <label for="email">이메일:</label>
	    <input type="text" id="email" name="email" value="${employee.getEmail()}"><br>
	
	    <input type="submit" value="수정">
	    <button class="edit_cancle">취소</button>
	</form>

    
    
<script src="../pageSetUp/edit.js"></script>



</body>
</html>
