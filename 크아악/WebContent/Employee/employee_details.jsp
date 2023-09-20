<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
       <link rel="stylesheet" href="../pageSetUp/mainStyle.css">
</head>
<body>
    <div class="table">
        <div class="main_content"></div>
	    <h1>Employee 세부 정보 페이지</h1>
	    <p>직원 번호: ${employee.getEmpNo()}</p>
	    <p>비밀번호: ${employee.getPw()}</p>
	    <p>이름: ${employee.getName()}</p>
	    <p>주소: ${employee.getAddr()}</p>
	    <p>전화번호: ${employee.getPhone()}</p>
	    <p>휴대폰번호: ${employee.getTel()}</p>
	    <p>이메일: ${employee.getEmail()}</p>
	    <p>세션 값: ${currentEmployeeId}</p> <!-- 세션 값을 출력 -->
	    <a href="/employee/edit?emp_no=${employee.getEmpNo()}">수정</a>
	    <a href="/employee/delete?emp_no=${employee.getEmpNo()}">삭제</a>
	</div>
</body>
</html>
