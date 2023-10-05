<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="Member.StudentDAO" %>



<%! String userName = null; // 사용자 이름을 저장할 변수 %>

<%
   HttpSession userSession = request.getSession(false); // 세션이 없으면 새로 생성하지 않음

   if (userSession != null) {
      // 세션이 존재하면 사용자 정보를 가져와서 이름을 설정합니다.
      String userRole = (String) userSession.getAttribute("userRole");
      int uniqueId = (int) userSession.getAttribute("uniqueId");

      // 사용자 역할이 학생인 경우만 학생 이름을 가져옵니다.
      if ("학생".equals(userRole)) {
         StudentDAO studentDAO = new StudentDAO();
         userName = studentDAO.getStudentName(uniqueId);
      }
   }
%>

<html>
<head>
<!-- 게시물 쓰기 페이지 -->
<title>Q & A</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div align="center">
<br/><br/>
<table width="600" cellpadding="3">
	<tr>
		<td bgcolor="84F399" height="25" align="center">글쓰기</td>
	</tr>
</table>
<br/>
<form name="postFrm" method="post" action="boardPost" enctype="multipart/form-data">
<table width="600" cellpadding="3" align="center">
	<tr>
		<td align=center>
		<table align="center">
			<tr>
				<td width="10%">작 성 자</td>
				<td width="90%">
				<input name="name" size="10" maxlength="8" value="<%= userName %>" readonly></td>
			</tr>
			<tr>
				<td>제 목</td>
				<td>
				<input name="subject" size="50" maxlength="30"></td>
			</tr>
			<tr>
				<td>내 용</td>
				<td><textarea name="content" rows="10" cols="50"></textarea></td>
			</tr>
			<!-- <tr>
				<td>비밀 번호</td>
				<td><input type="password" name="pass" size="15" maxlength="15"></td>
			</tr> -->
			<tr>
			 <tr>
     			<td>파일찾기</td> 
     			<td><input type="file" name="filename" size="50" maxlength="50"></td>
    		</tr>
 			<tr>
 				<td>내용타입</td>
 				<td> HTML<input type=radio name="contentType" value="HTTP" >&nbsp;&nbsp;&nbsp;
  			 	TEXT<input type=radio name="contentType" value="TEXT" checked>
  			 	</td>
 			</tr>
			<tr>
				<td colspan="2"><hr/></td>
			</tr>
			<tr>
				<td colspan="2">
					 <input type="submit" value="등록">
					 <input type="reset" value="다시쓰기">
					 <input type="button" value="리스트" onClick="javascript:location.href='list.jsp'">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
</form>
</div>
</body>
</html>