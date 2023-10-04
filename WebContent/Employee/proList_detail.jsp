<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        .edit_form {display: none;}
    </style>
    
    <meta charset="UTF-8">
    <title>교수 세부 정보</title>
</head>
<body>
    <h1>교수 세부 정보</h1>
    
    <c:if test="${professor != null}">
        <table>
            <tr>
                <th>교수 번호:</th>
                <td>${professor.proNo}</td>
            </tr>
            <tr>
                <th>이름:</th>
                <td>${professor.name}</td>
            </tr>
            <tr>
                <th>비밀 번호:</th>
                <td>${professor.pw}</td>
            </tr>
            <tr>
                <th>주소:</th>
                <td>${professor.addr}</td>
            </tr>
            <tr>
                <th>휴대폰번호:</th>
                <td>${professor.phone}</td>
            </tr>
            <tr>
                <th>전화번호:</th>
                <td>${professor.tel}</td>
            </tr>
            <tr>
                <th>이메일:</th>
                <td>${professor.email}</td>
            </tr>
            <tr>
                <th>학과:</th>
                <td>${professor.depName}</td>
            </tr>
            <tr>
                <th>전공:</th>
                <td>${professor.major}</td>
            </tr>
            <tr>
                <th>연구실 번호:</th>
                <td>${professor.labNum}</td>
            </tr>
        </table>
        
        <!-- 수정 폼 -->
        <form action="<%=request.getContextPath()%>/professor/update" method="post" class="edit_form">
            <input type="hidden" name="currentProfessorId" value="${professor.proNo}">
    
            <label for="newPw">새로운 비밀번호:</label>
            <input type="text" id="newPw" name="newPw" value="${professor.pw}"><br>
    
            <label for="newName">새로운 이름:</label>
            <input type="text" id="newName" name="newName" value="${professor.name}"><br>
    
            <label for="newAddr">새로운 주소:</label>
            <input type="text" id="newAddr" name="newAddr" value="${professor.addr}"><br>
    
            <label for="newPhone">새로운 전화번호:</label>
            <input type="text" id="newPhone" name="newPhone" value="${professor.phone}"><br>
    
            <label for="newTel">새로운 휴대폰번호:</label>
            <input type="text" id="newTel" name="newTel" value="${professor.tel}"><br>
    
            <label for="newEmail">새로운 이메일:</label>
            <input type="text" id="newEmail" name="newEmail" value="${professor.email}"><br>
    
            <label for="newDepName">새로운 학과:</label>
            <input type="text" id="newDepName" name="newDepName" value="${professor.depName}"><br>
    
            <label for="newMajor">새로운 전공:</label>
            <input type="text" id="newMajor" name="newMajor" value="${professor.major}"><br>
    
            <label for="newLabNum">새로운 연구실 번호:</label>
            <input type="text" id="newLabNum" name="newLabNum" value="${professor.labNum}"><br>
    
            <input type="submit" value="수정">
            <button class="edit_cancel" onclick="cancelEditForm()">취소</button>
        </form>
        
        <button class="editBtn" onclick="showEditForm()">수정</button>
    </c:if>
    
    <c:if test="${professor == null}">
        <p>교수 정보를 가져오지 못했습니다.</p>
    </c:if>
    
    <a href="#" onclick="loadServletData('<%=request.getContextPath()%>/professor/list')">교수 목록으로 돌아가기</a>
    
    <script src="../pageSetUp/myPage.js"></script>
</body>
</html>
