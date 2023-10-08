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

	<form id="week" action= '<%=contextPath%>/Lecture/InsertWeek.do?sub_no=<%=sub_no%>'>
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
		<button type="submit">추가</button>
		<button type="button" onclick="window.close()">취소</button>
	</form>
</body>
</html>