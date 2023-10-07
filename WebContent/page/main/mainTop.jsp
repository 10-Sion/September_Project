<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/mainTop.css">
</head>
<body>
    <header>
        <div class="navigation">
            <div class="logo">
                <a href="<%=request.getContextPath()%>/page/main/MainPage.jsp"><img src="image/Hogwarts-Crest.png" alt="로고 이미지"></a>
                <h1>교학대학교</h1>
            </div>
            <a href="../../GangUi/gangMain.jsp" class="menuItem">학사관리시스템</a>
            <a href="../../QnA/list.jsp" class="menuItem">강의실</a>
            <a href="../../Notices/list.jsp" class="menuItem">공지사항</a>

            <!-- 로그인 상태에 따라 다르게 표시 -->
            <div class="user-links">
                <%
                Integer uniqueId = (Integer) session.getAttribute("uniqueId");
                String userRole = (String) session.getAttribute("userRole");
                String username = (String) session.getAttribute("username");
                if (uniqueId != null) {
                %>
                <p><%=username%>님이 로그인 중
                    <a href="../../LoginServlet" id="logoutButton" class="small-link">로그아웃</a>
                </p>
                <%
                    // "직원"으로 로그인한 경우에만 회원가입 버튼 표시
                    if ("직원".equals(userRole)) {
                %>
                <a href="Form.jsp" id="FormButton" class="small-link">회원 추가</a>
                <%
                    }
                %>
                <%
                } else {
                %>
                <!-- <a href="login.jsp" id="loginButton" class="small-link">로그인</a> -->
                <a onclick="openLoginPopup()">로그인</a>
                <%
                }
                %>
            </div>
        </div>
    </header>


	<script>
	    // 팝업 창에서 데이터를 받는 함수
	    function receiveLoginData(event) {
	        if (event.data) {
	            var uniqueId = event.data.uniqueId;
	            var userPassword = event.data.userPassword;
	
	            // 받은 데이터를 사용하여 서블릿에 요청
	            var xhr = new XMLHttpRequest();
	            xhr.open("POST", "../../LoginServlet", true);
	            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	            xhr.onreadystatechange = function () {
	                if (xhr.readyState === 4 && xhr.status === 200) {
	                    var loginResult = xhr.responseText;
	                    if (loginResult === "success") {
	                        // 로그인 성공 시 처리
	                        location.reload(); // 예: 새로고침
	                    } else {
	                        // 로그인 실패 시 처리
	                        alert("로그인 실패");
	                    }
	                }
	            };
	            xhr.send("no=" + uniqueId + "&pw=" + userPassword);
	        }
	    }
	
	    // 팝업 창에서 메시지를 받을 때 호출할 함수 등록
	    window.addEventListener("message", receiveLoginData, false);
	</script>


</body>
</html>
