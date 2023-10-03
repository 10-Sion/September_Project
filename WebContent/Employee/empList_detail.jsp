<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
        .edit_form {display: none;}
    </style>
    
    <meta charset="UTF-8">
    <title>직원 세부 정보</title>
</head>
<body>
    <h1>직원 세부 정보</h1>
    
    <c:if test="${employee != null}">
        <table>
            <tr>
                <th>직원 번호:</th>
                <td>${employee.empNo}</td>
            </tr>
            <tr>
                <th>이름:</th>
                <td>${employee.name}</td>
            </tr>
            <tr>
                <th>비밀 번호:</th>
                <td>${employee.pw}</td>
            </tr>
            <tr>
                <th>주소:</th>
                <td>${employee.addr}</td>
            </tr>
            <tr>
                <th>전화번호:</th>
                <td>${employee.phone}</td>
            </tr>
            <tr>
                <th>휴대폰번호:</th>
                <td>${employee.tel}</td>
            </tr>
            <tr>
                <th>이메일:</th>
                <td>${employee.email}</td>
            </tr>
        </table>
        
        <button class="editBtn" onclick="showEditForm()">수정</button>

        <!-- 수정 폼 -->
        <form action="<%=request.getContextPath()%>/employee/update" method="POST" onsubmit="return confirm('수정하시겠습니까?')" class="edit_form">
            <input type="hidden" name="currentEmployeeId" value="${employee.empNo}">
    
            <label for="newPw">새로운 비밀번호:</label>
            <input type="text" id="newPw" name="newPw" value="${employee.pw}"><br>
    
            <label for="newName">새로운 이름:</label>
            <input type="text" id="newName" name="newName" value="${employee.name}"><br>
    
            <label for="newAddr">새로운 주소:</label>
            <input type="text" id="newAddr" name="newAddr" value="${employee.addr}"><br>
    
            <label for="newPhone">새로운 전화번호:</label>
            <input type="text" id="newPhone" name="newPhone" value="${employee.phone}"><br>
    
            <label for="newTel">새로운 휴대폰번호:</label>
            <input type="text" id="newTel" name="newTel" value="${employee.tel}"><br>
    
            <label for="newEmail">새로운 이메일:</label>
            <input type="text" id="newEmail" name="newEmail" value="${employee.email}"><br>
    
            <input type="submit" value="수정">
            <button class="edit_cancle" onclick="cancelEditForm()">취소</button>
        </form>
    </c:if>
    
    <c:if test="${employee == null}">
        <p>직원 정보를 가져오지 못했습니다.</p>
    </c:if>
    
    <a href="#" onclick="loadServletData('<%=request.getContextPath()%>/employee/list')">직원 목록으로 돌아가기</a>
    
    <script src="../pageSetUp/myPage.js"></script>
</body>
</html>
