<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
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
            <tr>
                <th>상태:</th>
                <td>${professor.status}</td>
            </tr>
        </table>
    </c:if>
    
    <c:if test="${professor == null}">
        <p>교수 정보를 가져오지 못했습니다.</p>
    </c:if>
    
    <a href="#" onclick="loadServletData('/HakSaGwanLee/professor/edit?currentProfessorId=${professor.proNo}')">수정</a>
    <a href="/HakSaGwanLee/professor/delete?proNo=${professor.proNo}">삭제</a>
    <a href="#" onclick="loadServletData('/HakSaGwanLee/professor/list')">교수 목록으로 돌아가기</a>
</body>
</html>
