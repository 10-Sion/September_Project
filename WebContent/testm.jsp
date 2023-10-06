<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
</head>
<body>
    <h1>Main Page</h1>
    <button onclick="loadAjaxPage('tests.jsp')">Load AJAX Page (tests.jsp)</button>
    <div id="ajaxContent"></div>
    
    <script>
        // 현재 로드된 AJAX 페이지의 URL 저장 변수
        var currentPageUrl = "";

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
                        callback(pageUrl); // 현재 페이지의 URL을 콜백 함수에 전달
                    }
                }
            };
            xhr.send();
        }

        // 메인 페이지 로딩 함수
        function loadMainPage() {
            // 페이지 로딩 시 수행할 작업 구현
            console.log("메인 페이지 로딩 중");
        }

        // AJAX 페이지 로딩 완료 시 호출되는 콜백 함수
        function onAjaxPageLoaded(pageUrl) {
            console.log("AJAX 페이지 로딩 완료");
            // AJAX 페이지에서 작업을 완료한 후 메인 페이지의 작업을 시작
            if (pageUrl === currentPageUrl) {
                loadMainPage();
            }
        }
    </script>
</body>
</html>
