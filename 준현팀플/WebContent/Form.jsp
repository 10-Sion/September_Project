<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<h1>회원가입</h1>

<p>직업을 선택하세요:</p>
<input type="radio" id="studentRadio" name="occupation" value="학생" required>
<label for="studentRadio">학생</label><br>
<input type="radio" id="staffRadio" name="occupation" value="교직원" required>
<label for="staffRadio">교직원</label><br>
<input type="radio" id="professorRadio" name="occupation" value="교수" required>
<label for="professorRadio">교수</label><br><br>

<div id="studentForm" style="display: none;">
    <!-- 학생용 회원가입 양식 -->
    <label for="stu_name">이름 : </label>
    <input id="stu_name" name="stu_name" type="text" size="20" maxlength="50" autofocus required>
    <br><br>
    <label for="stu_pw">비밀번호 : </label>
    <input id="stu_pw" name="stu_pw" type="text" size="20" maxlength="50" autofocus required>
    <br><br>
    <label for="stu_addr">주소 : </label>
    <input id="stu_addr" name="stu_addr" type="text" size="20" maxlength="100" required>
    <br><br>
    <label for="stu_phone">연락처 : </label>
    <input id="stu_phone" name="stu_phone" type="text" size="20" maxlength="10" required>
    <br><br>
    <label for="stu_email">이메일 : </label>
    <input id="stu_email" name="stu_email" type="text" size="20" maxlength="16" required>
    <br><br>
    <label for="stu_grade">학년 : </label>
    <input id="stu_grade" name="stu_grade" type="text" size="20" maxlength="100" required>
    <br><br>
    <label for="stu_major">전공 : </label>
    <input id="stu_major" name="stu_major" type="text" size="20" maxlength="100" required>
</div>

<div id="staffForm" style="display: none;">
    <!-- 교직원용 회원가입 양식 -->
    <label for="em_name">이름 : </label>
    <input id="em_name" name="em_name" type="text" size="20" maxlength="50" autofocus required>
    <br><br>
    <label for="em_pw">비밀번호 : </label>
    <input id="em_pw" name="em_pw" type="text" size="20" maxlength="50" autofocus required>
    <br><br>
    <label for="em_addr">주소 : </label>
    <input id="em_addr" name="em_addr" type="text" size="20" maxlength="100" required>
    <br><br>
    <label for="em_phone">연락처 : </label>
    <input id="em_phone" name="em_phone" type="text" size="20" maxlength="10" required>
    <br><br>
    <label for="em_email">이메일 : </label>
    <input id="em_email" name="em_email" type="text" size="20" maxlength="16" required>
</div>

<div id="professorForm" style="display: none;">
    <!-- 교수용 회원가입 양식 -->
    <label for="pro_name">이름 : </label>
    <input id="pro_name" name="pro_name" type="text" size="20" maxlength="50" autofocus required>
    <br><br>
    <label for="pro_pw">비밀번호 : </label>
    <input id="pro_pw" name="pro_pw" type="text" size="20" maxlength="50" autofocus required>
    <br><br>
    <label for="pro_addr">주소 : </label>
    <input id="pro_addr" name="pro_addr" type="text" size="20" maxlength="100" required>
    <br><br>
    <label for="pro_phone">연락처 : </label>
    <input id="pro_phone" name="pro_phone" type="text" size="20" maxlength="10" required>
    <br><br>
    <label for="pro_major">전공 : </label>
    <input id="pro_major" name="pro_major" type="text" size="20" maxlength="100" required>
    <label for="pro_email">이메일 : </label>
    <input id="pro_email" name="pro_email" type="text" size="20" maxlength="10" required>
    <br><br>
</div>

<!-- 입력완료 -->
<input type="button" value="입력완료" onclick="submit();">
<input type="reset" value="다시작성">

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

function submit() {
    // 선택된 직업을 가져옵니다.
    var radio = $("input[name='occupation']:checked").val();

    // 각 직업별로 필요한 변수를 정의합니다.
    var name, pw, addr, phone, email, grade, major;

    if (radio == "학생") {
        name = $("#stu_name").val();
        pw = $("#stu_pw").val();
        addr = $("#stu_addr").val();
        phone = $("#stu_phone").val();
        email = $("#stu_email").val();
        grade = $("#stu_grade").val();
        major = $("#stu_major").val();
    } else if (radio == "교직원") {
        name = $("#em_name").val();
        pw = $("#em_pw").val();
        addr = $("#em_addr").val();
        phone = $("#em_phone").val();
        email = $("#em_email").val();
    } else if (radio == "교수") {
        name = $("#pro_name").val();
        pw = $("#pro_pw").val();
        addr = $("#pro_addr").val();
        phone = $("#pro_phone").val();
        email = $("#pro_email").val();
        major = $("#pro_major").val();
    }

    // 데이터 객체를 만듭니다.
    var formData = {
        occupation: radio,
        email: email,
        name: name,
        pw: pw,
        addr: addr,
        phone: phone
    };

    // 선택된 직업에 따라 해당 카테고리에서 필요한 변수를 추가합니다.
    if (radio === "학생") {
    formData.grade = grade;
    formData.major = major;
} else if (radio === "교수") {
    formData.major = major; // 교수인 경우에만 major 설정
   
}

    // AJAX 요청을 통해 데이터를 "FormPro.jsp"로 전송합니다.
    $.ajax({
        url: "FormPro.jsp",
        type: "POST",
        data: formData,
        success: function (data) {
            // 성공한 경우 처리할 내용을 추가하세요.
        	 window.location.href = "login.jsp";
        },
        error: function (error) {
            // 에러 발생 시 처리할 내용을 추가하세요.
        	alert("회원가입이 실패했습니다.");
        }
    });
}

var studentRadio = document.getElementById("studentRadio");
var staffRadio = document.getElementById("staffRadio");
var professorRadio = document.getElementById("professorRadio");

var studentForm = document.getElementById("studentForm");
var staffForm = document.getElementById("staffForm");
var professorForm = document.getElementById("professorForm");

studentRadio.addEventListener("change", function () {
    if (studentRadio.checked) {
        studentForm.style.display = "block";
        staffForm.style.display = "none";
        professorForm.style.display = "none";
    }
});

staffRadio.addEventListener("change", function () {
    if (staffRadio.checked) {
        studentForm.style.display = "none";
        staffForm.style.display = "block";
        professorForm.style.display = "none";
    }
});

professorRadio.addEventListener("change", function () {
    if (professorRadio.checked) {
        studentForm.style.display = "none";
        staffForm.style.display = "none";
        professorForm.style.display = "block";
    }
});

</script>