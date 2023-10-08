<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Another AJAX Page</title>
</head>
<body>
    <h1>Another AJAX Page</h1>
    <button onclick="goToMainPage()">Go Back to Main Page</button>
    
    <script>
        // 메인 페이지로 이동
        function goToMainPage() {
            // 메인 페이지에 다시 tests.jsp를 동적으로 로드하는 요청을 보냄
            loadAjaxPage('tests.jsp');
        }
        
        // AJAX 페이지 로딩 함수
        function loadAjaxPage(pageUrl) {
            // AJAX로 페이지를 로드하고 작업 완료 후 메인 페이지에 알리기 위한 콜백 함수 전달
            loadPage(pageUrl, onAjaxPageLoaded);
        }

        // AJAX 페이지 로드 함수
        function loadPage(pageUrl, callback) {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", pageUrl, true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    document.getElementById("ajaxContent").innerHTML = xhr.responseText;
                    if (typeof callback === "function") {
                        callback();
                    }
                }
            };
            xhr.send();
        }
    </script>
</body>
</html>
