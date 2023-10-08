<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Another Tests Page</title>
</head>
<body>
    <h1>Another Tests Page</h1>
    <button onclick="goToTestsPageInMain()">Go Back to Tests Page</button>
    
    <script>
        // 메인 페이지의 tests.jsp로 이동
        function goToTestsPageInMain() {
            // 메인 페이지의 tests.jsp로 이동
            window.location.href = "testm.jsp";
        }
    </script>
</body>
</html>
