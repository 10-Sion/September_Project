<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="Notices.NoticesBean" %>
<%@ page import="Notices.NoticesMgr" %>
<jsp:useBean id="nMgr" class="Notices.NoticesMgr" />
<html>
<head>
    <title>�������� ����</title>
    <link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div align="center">
    <br/><br/>
    <table width="600" cellpadding="3">
        <tr>
            <td bgcolor="#dddddd" height="21" align="center">
                �������� ����
            </td>
        </tr>
    </table>
    <%
        request.setCharacterEncoding("EUC-KR");
        String nowPage = request.getParameter("nowPage");
        int num = Integer.parseInt(request.getParameter("num"));
    %>
    <script type="text/javascript">
        if (confirm("������ �����Ͻðڽ��ϱ�?")) {
            <% nMgr.deleteNotice(num); %>
            alert("���������� �����Ǿ����ϴ�.");
            location.href = "list.jsp?nowPage=<%=nowPage%>";
        } else {
            history.back();
        }
    </script>
</div>
</body>
</html>
