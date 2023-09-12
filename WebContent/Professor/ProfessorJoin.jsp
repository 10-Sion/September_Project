<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
 <script type="text/javascript">
   function fun() {
	   
	   $.ajax({
		    url:'<%=request.getContextPath()%>/join.do',
		    dataType:"json",
			type : 'post',
			dataType : 'json', 
			success:function(data){
				 console.log(data);
				 
				var $resultsTable = $('results');
				
				$resultsTable.empty();
		    
		   
	   });
	
  }
 </script>
</head>
<body onload = "fun();">
<form action = "ProfessorJoinPro.jsp" method ="post">
	<div align="center">
	<h1>교수 회원 가입</h1>
	<table>
		<tr>
			<th>이름</th>
			<td><input type = "text" name = "name"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type= "password" name="pw" ></td>
		</tr>
		<tr>
			<th>전공</th>
			<button onclick="fun()">전공 선택</button>
			
		</tr>
		<tr>
			<th>연락처(휴대폰)</th>
			<td><input type = "text" name = "phone"></td>
		</tr>
		<tr>
			<th>연락처(연구실)</th>
			<td><input type = "text" name = "tel"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type = "text" name = "major"></td>
		</tr>	
		<tr>
			<th>이메일</th>
			<td><input type="text" name= "email"></td>
		</tr>
		<tr>
			<th>연구실 위치</th>
			<td><input type="text" name= "labNum"></td>
		</tr>
	</table>
	</div>
	<div id="buttons" align="center">
		<input type="submit" value="회원 가입" class="submit"/>
		<input type="reset" value="등록취소" class="cancel"/><br>
		<br><br><br><br>
		<input type="button" value="이전 페이지" class="cancel" onclick="history.back()"/>
	</div>
</form>
</body>
</html>