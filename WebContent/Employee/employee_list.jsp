<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
    <h1>교직원 목록</h1>
	<table>
	    <tr>
	        <th>직원 번호</th>
	        <th>이름</th>
	        <th>전화번호</th>
	        <th>이메일</th>
	        <th>조회/수정</th>
	       	<th>삭제</th>
	    </tr>
	    <c:forEach items="${employees}" var="employee">
	        <tr>
	            <td>${employee.empNo}</td>
	            <td>${employee.name}</td>
	            <td>${employee.phone}</td>
	            <td>${employee.email}</td>
	            
	            
                    <c:choose>
                        <c:when test="${sessionScope.currentEmployeeId == employee.empNo}">
                            <!-- 현재 로그인한 사용자의 emp_no와 직원의 emp_no가 일치하는 경우 삭제 버튼을 표시하지 않음 -->
                           	<td>로그인중인 계정</td>
                           	<td></td>
                        </c:when>
                        <c:otherwise>
                            <!-- 일치하지 않는 경우 상세정보, 삭제  표시 -->
                            <td>
			                    <a href="#" onclick="loadServletData('<%=request.getContextPath()%>/employee/detail?currentEmployeeId=${employee.empNo}')">세부 정보</a>
				            </td>
                            <td>
                            <a href="#" onclick="deleteEmployee(${employee.empNo})">삭제</a>
                            </td>
                        </c:otherwise>
                    </c:choose>
			    
	        </tr>
	    </c:forEach>
	</table>
	<script>
	// 교직원 삭제시 알람 함수 
	function deleteEmployee(empNo) {
		        if (confirm("정말로 삭제하시겠습니까?")) {
		            // 서블릿을 호출하여 직원 삭제
		        	$.ajax({
		        	    url: '<%=request.getContextPath()%>/employee/delete?currentEmployeeId=' + empNo, 
		        	    type: 'POST',
		        	    dataType: 'text',
		        	    success: function(response) {
		        	        if (response === 'success') {
		        	            alert('직원이 삭제되었습니다.');
		        	            // 페이지 새로고침 또는 리디렉션을 수행하여 업데이트된 목록을 표시
		        	            location.reload();
		        	        } else {
		        	            alert('직원 삭제 실패.');
		        	        }
		        	    },
		        	    error: function(xhr, status, error) {
		        	        console.error(error);
		        	    }
		        	});

		        }
		    }
	</script>
	<script src="../pageSetUp/myPage.js"></script>

</body>
</html>
