<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="Member.*" %>


<%
   String userName = null; // 사용자 이름을 저장할 변수 
   String userRole = null;
   
   HttpSession userSession = request.getSession(false); // 세션이 없으면 새로 생성하지 않음

   if (userSession != null) {
      // 세션이 존재하면 사용자 정보를 가져와서 이름을 설정합니다.
      userRole = (String) userSession.getAttribute("userRole");
      int uniqueId = (int) userSession.getAttribute("uniqueId");

      // 사용자 역할이 교수인 경우만 교수 이름을 가져옵니다.
      if ("교수".equals(userRole)) {
    	  ProfessorDAO professorDAO = new ProfessorDAO();
         userName = professorDAO.getProfessorName(uniqueId);
         
      }
      if ("직원".equals(userRole)) {
    	  EmployeeDAO employeeDAO = new EmployeeDAO();
         userName = employeeDAO.getEmployeeName(uniqueId);
      }
   }
%>


<html>
<head>
    <!-- 공지사항 쓰기 페이지 -->
    <title>공지사항</title>
    <link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../page/main/mainTop.jsp" />
<div align="center">
    <br/><br/>
    <table width="600" cellpadding="3">
        <tr>
            <td bgcolor="84F399" height="25" align="center">글쓰기</td>
        </tr>
    </table>
    <br/>
    <form name="postFrm" method="post" action="noticesPost">
        <table width="600" cellpadding="3" align="center">
            <tr>
                <td align=center>
                    <table align="center">
                        <tr>
                            <td width="10%">작성자</td>
                            <td width="90%">
                                <input name="name" size="10" maxlength="8" value="<%= userName %> <%= userRole %>님" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td>제목</td>
                            <td>
                                <input name="title" size="50" maxlength="100">
                            </td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td><textarea name="content" rows="10" cols="50"></textarea></td>
                        </tr>
                       
                        <tr>
                            <td colspan="2"><hr/></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" value="등록">
                                <input type="reset" value="다시쓰기">
                                <input type="button" value="리스트" onClick="javascript:location.href='/HakSaGwanLee/Notices/list.jsp'">
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