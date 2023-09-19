<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- 필요한 스타일 및 스크립트 추가 -->
</head>
<body>
    <h1>다른 Employee 리스트 페이지</h1>
    <table>
        <tr>
            <th>직원 번호</th>
            <th>이름</th>
            <th>전화번호</th>
            <th>이메일</th>
            <th>조회/수정/삭제</th>
        </tr>
        <c:forEach items="${employees}" var="employee">
            <tr>
                <td>${employee.emp_no}</td>
                <td>${employee.name}</td>
                <td>${employee.phone}</td>
                <td>${employee.email}</td>
                <td>
                    <a href="/employee/details/${employee.emp_no}">세부 정보</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
