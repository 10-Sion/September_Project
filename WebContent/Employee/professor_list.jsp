<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
    <h1>교수 목록</h1>
    
    <c:if test="${not empty professors}">
        <table>
            <tr>
                <th>교수 번호</th>
                <th>이름</th>
                <th>전화번호</th>
                <th>이메일</th>
                <th>세부정보</th>
                
            </tr>
            <c:forEach items="${professors}" var="professor">
                <tr>
                    <td>${professor.proNo}</td>
                    <td>${professor.name}</td>
                    <td>${professor.phone}</td>
                    <td>${professor.email}</td>
                    <td>
                        <a href="#" onclick="loadServletData('/HakSaGwanLee/professor/detail?currentProfessorId=${professor.proNo}')">세부 정보</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    
    <c:if test="${empty professors}">
        <p>교수 정보를 가져오지 못했습니다.</p>
    </c:if>
    
    <!-- 교수 정보 수정 및 목록으로 돌아가는 링크 추가 -->
    <a href="#" onclick="loadServletData('/HakSaGwanLee/professor/edit?currentProfessorId=${professor.proNo}')">세부 정보</a>
    <a href="#" onclick="loadServletData('/HakSaGwanLee/professor/list')">교수 목록으로 돌아가기</a>
</body>
</html>
