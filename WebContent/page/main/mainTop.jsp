<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Integer uniqueId = (Integer) session.getAttribute("uniqueId");
String userRole = (String) session.getAttribute("userRole");
String username = (String) session.getAttribute("username");

String mainGang = "/HakSaGwanLee/GangUi/gangMain.jsp";

if(userRole == "교수"){
	
	mainGang = "/HakSaGwanLee/Professor/proMainGang.jsp";
	
}else if(userRole == "학생"){
	
	mainGang = "/HakSaGwanLee/Student/stuMainGang.jsp";
	
}else if(userRole == "직원"){
	
	mainGang = "/HakSaGwanLee/Employee/empMainGang.jsp";
}
%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/HakSaGwanLee/page/main/css/mainTop.css">
</head>
<body>
    <header>
        <div class="navigation">
            <div class="logo">
                <a href="/HakSaGwanLee/page/main/MainPage.jsp"><img src="/HakSaGwanLee/page/main/image/Hogwarts-Crest.png" alt="로고 이미지"></a>
                <h1>교학대학교</h1>
            </div>
            <a href="<%=mainGang%>" class="menuItem">학사관리시스템</a>
            <a href="/HakSaGwanLee/QnA/list.jsp" class="menuItem">QnA</a>
            <a href="/HakSaGwanLee/Notices/list.jsp" class="menuItem">공지사항</a>

            <!-- 로그인 상태에 따라 다르게 표시 -->
            <div class="user-links">
                <%
                if (uniqueId != null) {
                %>
                <p><%=username%>님이 로그인 중
                    <a href="/HakSaGwanLee/LoginServlet" id="logoutButton" class="small-link">로그아웃</a>
                </p>
                <%
                    // "직원"으로 로그인한 경우에만 회원가입 버튼 표시
                    if ("직원".equals(userRole)) {
                %>
                <a href="/HakSaGwanLee/page/main/Form.jsp" id="FormButton" class="small-link">회원 추가</a>
                <%
                    }
                %>
                <%
                } else {
                %>
                <!-- <a href="login.jsp" id="loginButton" class="small-link">로그인</a> -->
                <a href="#" onclick="openLoginPopup()">로그인</a>
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
	            xhr.open("POST", "/HakSaGwanLee/LoginServlet", true);
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
