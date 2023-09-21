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
            <tr>
                <th>학번:</th>
                <td>${student.stuNo}</td>
            </tr>
            <tr>
                <th>이름:</th>
                <td>${student.name}</td>
            </tr>
            <tr>
                <th>비밀 번호:</th>
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
                <th>학과:</th>
                <td>${student.depName}</td>
            </tr>
            <tr>
                <th>전공:</th>
                <td>${student.major}</td>
            </tr>
            <tr>
                <th>학년:</th>
                <td>${student.grade}</td>
            </tr>
            <tr>
                <th>상태:</th>
                <td>${student.status}</td>
            </tr>
        </table>
    </c:if>
    
    <c:if test="${student == null}">
        <p>학생 정보를 가져오지 못했습니다.</p>
    </c:if>
    
    <a href="#" onclick="loadServletData('/HakSaGwanLee/student/edit?currentStudentId=${student.stuNo}')">수정</a>
    <a href="#" onclick="loadServletData('/HakSaGwanLee/student/list')">학생 목록으로 돌아가기</a>
</body>
</html>
