<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>학생 세부 정보</title>
</head>
<body>
    <h1>학생 세부 정보</h1>
    
    <c:if test="${student != null}">
        <table>
            <!-- 학생 정보 표시 부분 (이전 코드와 동일) -->
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
    
            <input type="submit" value="수정">
        </form>
        
        <!-- 삭제 폼 -->
        <form action="<%=request.getContextPath()%>/student/delete" method="POST" onsubmit="return confirm('정말로 삭제하시겠습니까?');">
            <input type="hidden" name="stuNo" value="${student.stuNo}">
            <input type="submit" value="삭제">
        </form>
    </c:if>
    
    <c:if test="${student == null}">
        <p>학생 정보를 가져오지 못했습니다.</p>
    </c:if>
    
    <a href="#" onclick="loadServletData('<%=request.getContextPath()%>/student/list')">학생 목록으로 돌아가기</a>
</body>
</html>
