<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        .edit_form {display: none;}
    </style>
    
    <meta charset="UTF-8">
    <title>학생 세부 정보</title>
</head>
<body>
    <h1>학생 세부 정보</h1>
    
    <c:if test="${student != null}">
        <table>
            <tr>
                <th>학번:</th>
                <td>${student.stuNo}</td>
            </tr>
            <tr>
                <th>이름:</th>
                <td>${student.name}</td>
            </tr>
            <tr>
                <th>비밀번호:</th>
                <td>${student.pw}</td>
            </tr>
            <tr>
                <th>주소:</th>
                <td>${student.addr}</td>
            </tr>
            <tr>
                <th>전화번호:</th>
                <td>${student.phone}</td>
            </tr>
            <tr>
                <th>휴대폰번호:</th>
                <td>${student.tel}</td>
            </tr>
            <tr>
                <th>이메일:</th>
                <td>${student.email}</td>
            </tr>
            <tr>
                <th>학부:</th>
                <td>${student.dep_name}</td>
            </tr>
            <tr>
                <th>전공:</th>
                <td>${student.major}</td>
            </tr>
        </table>
    
        <!-- 수정 폼 -->
        <form action="<%=request.getContextPath()%>/student/update" method="POST">
            <input type="hidden" name="currentStudentId" value="${student.stuNo}">
    
            <label for="newPw">새로운 비밀번호:</label>
            <input type="text" id="newPw" name="newPw" value="${student.pw}"><br>
    
            <label for="newName">새로운 이름:</label>
            <input type="text" id="newName" name="newName" value="${student.name}"><br>
    
            <label for="newAddr">새로운 주소:</label>
            <input type="text" id="newAddr" name="newAddr" value="${student.addr}"><br>
    
            <label for="newPhone">새로운 전화번호:</label>
            <input type="text" id="newPhone" name="newPhone" value="${student.phone}"><br>
    
            <label for="newTel">새로운 휴대폰번호:</label>
            <input type="text" id="newTel" name="newTel" value="${student.tel}"><br>
    
            <label for="newEmail">새로운 이메일:</label>
            <input type="text" id="newEmail" name="newEmail" value="${student.email}"><br>
            
            <label for="newDepName">새로운 학부:</label>
            <input type="text" id="newDepName" name="newDepName" value="${student.dep_name}"><br>
            
            <label for="newMajor">새로운 전공:</label>
            <input type="text" id="newMajor" name="newMajor" value="${student.major}"><br>
    
            <input type="submit" value="수정">
        </form>
        
    </c:if>
    
    <c:if test="${student == null}">
        <p>학생 정보를 가져오지 못했습니다.</p>
    </c:if>
    
    <a href="#" onclick="loadServletData('<%=request.getContextPath()%>/student/list')">학생 목록으로 돌아가기</a>
    
    <script src="../pageSetUp/myPage.js"></script>
</body>
</html>
