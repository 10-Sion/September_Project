<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body align="center">
	<%
		String contextPath = request.getContextPath();
		int sub_no = Integer.parseInt(request.getParameter("sub_no"));
	%>
	요청할 서블릿 :
	<%=contextPath%>

	<form id="week" action= '<%=contextPath%>/Lecture/InsertWeek.do?sub_no=<%=sub_no%>')>
		<div class="table">
			<table align="center" rowspan="2">
				<tr>
					<th>주차 입력</th>
					<td><input type="text" name="week"> 
					<input type="hidden" name="sub_no" value="<%=sub_no%>"></td>

				</tr>
				<tr>
					<th>과목명</th>
					<td>과목1</td>
				</tr>
				<tr>
					<th>차시</th>
					<td><select name="class_hour">
							<option selected disabled>강의 차시</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
					</select></td>
				</tr>
				<tr>
					<th>강의 주제</th>
					<td><input type="text" name="week_name"></td>
				</tr>
				<tr>
					<th>대면 형태</th>
					<td><select name="class_type">
							<option value="대면">대면</option>
							<option value="비대면">비대면</option>
					</select></td>
				</tr>
				<tr>
					<th>과제 유무</th>
					<td><select name="assignment">
							<option selected disabled>과제 유무</option>
							<option value="true">유</option>
							<option value="false">무</option>
					</select></td>
				</tr>
				<tr>
					<th>강의 링크</th>
					<td><input type="text" name="lecture_link"></td>
				</tr>

			</table>
		</div>


		<button type="button" onclick="Weekclick()">추가</button>
		<button type="submit">추가 버튼</button>
		<button type="button" onclick="window.close()">취소</button>
	</form>

	<script type="text/javascript">
    function Weekclick() {
        // Form 데이터 직렬화
        //.serialize(): 선택한 폼 요소를 직렬화하는 jQuery 메서드입니다. 
        //              직렬화는 폼의 입력 필드 (예: 텍스트 상자, 드롭다운 목록 등)에 입력된 데이터를 URL 형식으로 인코딩하는 과정을 의미합니다. 
        // week_number=1&week_name=Introduction&class_type=%EB%8C%80%EB%A9%B4  
        //위 URL 형식으로 인코딩 해서 만들어 줍니다. 재우야~ 
        var formData = $("#week").serialize();

        $.ajax({
            type: "POST",
            url: "<%=contextPath%>/Lecture/InsertWeek.do",
				data : formData,
				success : function(response) {
					// 서버로부터 응답을 받았을 때
					console.log("데이터 전송 성공!");
                  //  opener.document.name.value = 
					// 현재 창 닫기             
					//             1. `window.open('', '_self', '');`:
					//                - `window.open()` 함수는 새 창을 열거나 현재 창을 다시 로드하는데 사용됩니다.
					//                - 첫 번째 인자인 `''`은 열려는 창의 URL을 지정합니다. 여기서는 빈 문자열 `''`을 사용했기 때문에 특정 URL로 이동하지 않고 현재 페이지를 다시 로드하게 됩니다.
					//                - 두 번째 인자인 `'_self'`는 새 창이 아닌 현재 창을 대상으로 한다는 것을 의미합니다. 따라서 현재 창이 다시 로드됩니다.
					//                - 세 번째 인자 `''`는 창의 속성을 설정하는 부분인데, 여기서는 아무런 설정을 하지 않았습니다.

					//                이 코드는 현재 창을 다시 로드하여 현재 페이지를 초기화하는 역할을 합니다. 즉, 폼 데이터를 서버로 보내고 나서 현재 페이지를 리셋합니다.

					//             2. `window.close();`:
					//                - `window.close()` 함수는 현재 열려 있는 브라우저 창을 닫는 역할을 합니다.
					//                - 이 코드를 실행하면 팝업 창이나 현재 브라우저 창이 닫힙니다.

					//             따라서 위의 코드는 다음과 같은 순서로 작동합니다:
					//                1. 사용자가 "추가" 버튼을 클릭하면 `Weekclick()` 함수가 실행됩니다.
					//                2. `Weekclick()` 함수 내에서 `$("#week").submit();` 코드가 실행되어 폼 데이터가 서버로 전송됩니다.
					//                3. 전송이 완료되면 `window.open('', '_self', '');` 코드가 실행되어 현재 페이지를 다시 로드합니다. 이렇게 하면 현재 페이지가 초기화됩니다.
					//                4. 마지막으로 `window.close();` 코드가 실행되어 팝업 창이나 현재 창이 닫힙니다.

					//             이렇게 함으로써 데이터가 서버로 안전하게 전송되고, 작업이 완료된 후에 창이 닫히게 됩니다.
					 opener.parent.location.reload();
					 window.close();
					
				},
				error : function() {
					// 에러 처리
					console.error("데이터 전송 중 오류 발생");
				}
			});
		}
	</script>
</body>
</html>