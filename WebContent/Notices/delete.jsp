<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="Notices.NoticesBean" %>
<%@ page import="Notices.NoticesMgr" %>
<jsp:useBean id="nMgr" class="Notices.NoticesMgr" />
<html>
<head>
    <title>공지사항 삭제</title>
    <link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div align="center">
    <br/><br/>
    <table width="600" cellpadding="3">
        <tr>
            <td bgcolor="#dddddd" height="21" align="center">
                공지사항 삭제
            </td>
        </tr>
    </table>
    <%
        request.setCharacterEncoding("EUC-KR");
        String nowPage = request.getParameter("nowPage");
        int num = Integer.parseInt(request.getParameter("num"));
    %>
    <script type="text/javascript">
        if (confirm("정말로 삭제하시겠습니까?")) {
            <% nMgr.deleteNotice(num); %>
            alert("공지사항이 삭제되었습니다.");
            location.href = "list.jsp?nowPage=<%=nowPage%>";
        } else {
            history.back();
        }
    </script>
</div>
</body>
</html>