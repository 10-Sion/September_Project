
<%@page import="JaeWooVO.DepBean"%>
<%@page import="JaeWooDAO.ProDao"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	ProDao pDao = new ProDao();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
   function addSel(select) {
	   
	   
	   
	   
	   
	   $.ajax({
		    url:'<%=request.getContextPath()%>/join.do',
			type : 'post',
			data : {dep_val : select.value },
			dataType : 'json',
			success:function(data){
				
				console.log(data);
				//Json 배열 
				/* [ {maj_name : 전공1} ,
					 {maj_name : 전공2} ,
					 {maj_name : 전공3} ,
					]
				*/
				
				if(data != null){
				 $('#mj_sel').empty();
				
				for(var j = 0; j< data.length; j++){
				 $('#mj_sel').append("<option value = '"+ data[j].major + "'>" + data[j].major +"</option>");
				}
				}
			}
	   });
	  }
 </script>
</head>
<body>
	<!--  onload = "fun();" -->
	<form action="ProfessorJoinPro.jsp" method="post">
		<div align="center">
			<h1>교수 회원 가입</h1>
			<table>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pw"></td>
				</tr>
				<tr>
					<th>전공 선택</th>
					<td>
						<div>
							<select name = "dep_name" onchange = "addSel(this);">
								<option selected>학부</option>
<%
				List list = pDao.getDep();
						for(int i = 0; i < list.size(); i++){
							DepBean depB = (DepBean)list.get(i);
%>
						<option value = "<%=depB.getDep_name()%>" id ="dep_val" name ="dep_val" ><%=depB.getDep_name()%></option>
<%
						}
%>								
						</select>
						</div>
						<div>
							<select name = "major" id = "mj_sel" >
							<option selected>전공</option>	
							</select>
						</div>						
					</td>

				</tr>
				<tr>
					<th>연락처(휴대폰)</th>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<th>연락처(연구실)</th>
					<td><input type="text" name="tel"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="major"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email"></td>
				</tr>
				<tr>
					<th>연구실 위치</th>
					<td><input type="text" name="labNum"></td>
				</tr>
			</table>
		</div>
		<div id="buttons" align="center">
			<input type="submit" value="회원 가입" class="submit" /> <input
				type="reset" value="등록취소" class="cancel" /><br> <br> <br>
			<br> <br> <input type="button" value="이전 페이지"
				class="cancel" onclick="history.back()" />
		</div>
	</form>
</body>
</html>