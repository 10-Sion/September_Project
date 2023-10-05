<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="Member.ProfessorDAO" %>

<%! String userName = null; // ����� �̸��� ������ ���� %>

<%
   HttpSession userSession = request.getSession(false); // ������ ������ ���� �������� ����

   if (userSession != null) {
      // ������ �����ϸ� ����� ������ �����ͼ� �̸��� �����մϴ�.
      String userRole = (String) userSession.getAttribute("userRole");
      int uniqueId = (int) userSession.getAttribute("uniqueId");

      // ����� ������ ������ ��츸 ���� �̸��� �����ɴϴ�.
      if ("����".equals(userRole)) {
    	  ProfessorDAO professorDAO = new ProfessorDAO();
         userName = professorDAO.getProfessorName(uniqueId);
      }
   }
%>

<html>
<head>
    <!-- �������� ���� ������ -->
    <title>��������</title>
    <link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div align="center">
    <br/><br/>
    <table width="600" cellpadding="3">
        <tr>
            <td bgcolor="84F399" height="25" align="center">�۾���</td>
        </tr>
    </table>
    <br/>
    <form name="postFrm" method="post" action="noticesPost" enctype="multipart/form-data">
        <table width="600" cellpadding="3" align="center">
            <tr>
                <td align=center>
                    <table align="center">
                        <tr>
                            <td width="10%">�ۼ���</td>
                            <td width="90%">
                                <input name="name" size="10" maxlength="8" value="<%= userName %> ������" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td>����</td>
                            <td>
                                <input name="title" size="50" maxlength="100">
                            </td>
                        </tr>
                        <tr>
                            <td>����</td>
                            <td><textarea name="content" rows="10" cols="50"></textarea></td>
                        </tr>
                       
                        <tr>
                            <td colspan="2"><hr/></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" value="���">
                                <input type="reset" value="�ٽþ���">
                                <input type="button" value="����Ʈ" onClick="javascript:location.href='list.jsp'">
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
