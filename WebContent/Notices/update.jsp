<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="Notices.NoticesBean" %>
<jsp:useBean id="nMgr" class="Notices.NoticesMgr" />
<%
    int num = Integer.parseInt(request.getParameter("num"));
    String nowPage = request.getParameter("nowPage");
    NoticesBean bean = (NoticesBean)session.getAttribute("bean");
    String title = bean.getTitle();
    String content = bean.getContent();
%>
<html>
<head>
    <title>�������� ����</title>
    <link href="style.css" rel="stylesheet" type="text/css">
    <script>
        function confirmUpdate() {
            var result = confirm("�����Ͻðڽ��ϱ�?");
            if (result) {
                document.updateFrm.submit();
            }
        }
    </script>
</head>
<body>
<div align="center">
    <br/><br/>
    <table width="600" cellpadding="3">
        <tr>
            <td bgcolor="#FF9018"  height="21" align="center">�����ϱ�</td>
        </tr>
    </table>
    <form name="updateFrm" method="post" action="NoticesUpdate">

        <table width="600" cellpadding="7">
            <tr>
                <td>
                    <table>
                        <tr>
                            <td width="20%">�� ��</td>
                            <td width="80%">
                                <input name="title" size="50" value="<%=title%>" maxlength="100">
                            </td>
                        </tr>
                        <tr>
                            <td>�� ��</td>
                            <td>
                                <textarea name="content" rows="10" cols="50"><%=content%></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" height="5"><hr/></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="button" value="�����ϱ�" onClick="confirmUpdate()">
                                <input type="reset" value="�ٽü���">
                                <input type="button" value="�ڷ�" onClick="history.go(-1)">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <input type="hidden" name="nowPage" value="<%=nowPage %>">
        <input type='hidden' name="num" value="<%=num%>">
    </form>
</div>
</body>
</html>
