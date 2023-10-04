<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
    <h1>학생 목록</h1>
    
    <table>
        <tr>
            <th>학번</th>
            <th>이름</th>
            <th>전화번호</th>
            <th>이메일</th>
            <th>조회/수정</th>
            <th>삭제</th>
        </tr>
        <c:forEach items="${students}" var="student">
            <tr>
                <td>${student.stuNo}</td>
                <td>${student.name}</td>
                <td>${student.phone}</td>
                <td>${student.email}</td>
                <td>
                    <a href="#" onclick="loadServletData('<%=request.getContextPath()%>/student/detail?currentStudentId=${student.stuNo}')">세부 정보</a>
                </td>
                <td>
                    <a href="#" onclick="deleteStudent(${student.stuNo})">삭제</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    
    <c:if test="${empty students}">
        <p>학생 정보를 가져오지 못했습니다.</p>
    </c:if>

    <script>
    // 학생 삭제시 알람 함수 
    function deleteStudent(stuNo) {
        if (confirm("정말로 삭제하시겠습니까?")) {
            // 서블릿을 호출하여 학생 삭제
            $.ajax({
                url: '<%=request.getContextPath()%>/student/delete?currentStudentId=' + stuNo, 
                type: 'POST',
                dataType: 'text',
                success: function(response) {
                    if (response === 'success') {
                        alert('학생이 삭제되었습니다.');
                        // 페이지 새로고침 또는 리디렉션을 수행하여 업데이트된 목록을 표시
                        location.reload();
                    } else {
                        alert('학생 삭제 실패.');
                    }
                },
                error: function(xhr, status, error) {
                    console.error(error);
                }
            });
        }
    }
    </script>
</body>
</html>
