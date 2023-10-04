// login.js 파일 내에서는 uniqueId 변수를 직접 사용할 수 있음
var loginButton = document.getElementById("loginButton");
var FormButton = document.getElementById("FormButton");

if (uniqueId != null) {
    // 로그인 상태
    loginButton.style.display = "none"; // 로그인 버튼 숨김
    FormButton.style.display = "none"; // 회원가입 버튼 숨김
} else {
    // 로그아웃 상태
    loginButton.style.display = "block"; // 로그인 버튼 표시
    FormButton.style.display = "block"; // 회원가입 버튼 표시
}





function redirectToMyPage(uniqueId) {
    var redirectURL = "";

    if (uniqueId >= 0 && uniqueId <= 1000) {
        // 교직원의 경우
        redirectURL = "../../Employee/empMain.jsp";
    } else if (uniqueId >= 1001 && uniqueId <= 2000) {
        // 교수의 경우
        redirectURL = "../../Professor/proMain.jsp";
    } else if (uniqueId >= 2001 && uniqueId <= 9999) {
        // 학생의 경우
        redirectURL = "../../Student/stuMain.jsp";
    } else {
        // 그 외의 경우
        redirectURL = "../../LecturePro/index.jsp"; // 혹은 다른 처리를 원하는 페이지로 이동
    }

    window.location.href = redirectURL; // JavaScript를 사용하여 페이지 이동
}
