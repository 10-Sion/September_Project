<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
                <th>조회/수정</th>
                <th>삭제</th>
            </tr>
            <c:forEach items="${professors}" var="professor">
                <tr>
                    <td>${professor.proNo}</td>
                    <td>${professor.name}</td>
                    <td>${professor.phone}</td>
                    <td>${professor.email}</td>
                    <td>
                        <a href="#" onclick="loadServletData('<%=request.getContextPath()%>/professor/detail?currentProfessorId=${professor.proNo}')">세부 정보</a>
                    </td>
                    <td>
                        <a href="#" onclick="deleteProfessor(${professor.proNo})">삭제</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    
    <c:if test="${empty professors}">
        <p>교수 정보를 가져오지 못했습니다.</p>
    </c:if>

    <script>
    // 교수 삭제시 알람 함수 
    function deleteProfessor(proNo) {
        if (confirm("정말로 삭제하시겠습니까?")) {
            // 서블릿을 호출하여 교수 삭제
            $.ajax({
                url: '<%=request.getContextPath()%>/professor/delete?currentProfessorId=' + proNo, 
                type: 'POST',
                dataType: 'text',
                success: function(response) {
                    if (response === 'success') {
                        alert('교수가 삭제되었습니다.');
                        // 페이지 새로고침 또는 리디렉션을 수행하여 업데이트된 목록을 표시
                        location.reload();
                    } else {
                        alert('교수 삭제 실패.');
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
