<%@page import="JaeWooVO.DepBean"%>
<%@page import="JaeWooVO.ProBean"%>
<%@page import="JaeWooDAO.ProDao"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//	int pro_no = Integer.parseInt( request.getParameter("no")) ;
	//	String P_name = request.getParameter("name");
	int pro_no = (Integer)session.getAttribute("uniqueId");
	//	String p_name = (String)session.getAttribute("pro_no");

	ProDao pdao = new ProDao();
	ProBean pb = pdao.getProInfo(pro_no);
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
	<form action="modProfessorPro.jsp" method="post">
		<div align="center" class="table" border ="1">
			<h1 align = "left">교수 정보</h1>
			<table border ="1">
				<tr>
					<input type="hidden" name="no" value="<%=pb.getNo()%>">
					<th>이름</th>
					<td><input type="text" name="name" value="<%=pb.getName()%>"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pw" value="<%=pb.getPw()%>"></td>
				</tr>
				<tr>
					<th>학부</th>
					<td>
						<div>
							<select name="dep_name" onchange="addSel(this);">
								<option value="<%=pb.getDep_name()%>" selected><%=pb.getDep_name()%></option>
								<%
									List list = pdao.getDep();
									for (int i = 0; i < list.size(); i++) {
										DepBean depB = (DepBean)list.get(i);
										String Dep_name = depB.getDep_name();
								%>
								<option value = <%=depB.getDep_name()%> id ="dep_val" name ="dep_val" >
									<%=depB.getDep_name()%>
								</option>
<%
								}
%>
							</select>
						</div><br>
					</td>
				</tr>		
					<th>전공</th>
					<div>
						<td>
							<select name="major" id="mj_sel">
								<option value="<%=pb.getMajor()%>" selected><%=pb.getMajor()%></option>
							</select>
						</td>
					</div>
				<tr>
					<th>연락처(휴대폰)</th>
					<td><input type="text" name="phone" value="<%=pb.getPhone()%>"></td>
				</tr>
				<tr>
					<th>연락처(연구실)</th>
					<td><input type="text" name="tel" value="<%=pb.getTel()%>"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="addr" value="<%=pb.getAddr()%>"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" value="<%=pb.getEmail()%>"></td>
				</tr>
				<tr>
					<th>연구실 위치</th>
					<td><input type="text" name="labNum"
						value="<%=pb.getLabNum()%>"></td>
				</tr>
			</table>
		</div>
		<div id="buttons" align="center">
			<input type="submit" value="수정하기" class="submit" /> 
			<input type="reset" value="수정취소" class="cancel" />
			<br>
			<button type = "button" onclick ="location.href='DelProfessorPro.jsp?no=<%=pb.getNo()%>'"> 탈퇴  </button>
		</div>
			
	</form>
</body>
</html>