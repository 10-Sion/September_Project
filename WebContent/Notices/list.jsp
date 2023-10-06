<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="Notices.NoticesBean" %>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="nMgr" class="Notices.NoticesMgr" />

<%
    request.setCharacterEncoding("EUC-KR");

    String keyWord = "", keyField = "";
    Vector<NoticesBean> vlist = null;
    if (request.getParameter("keyWord") != null) {
        keyWord = request.getParameter("keyWord");
        keyField = request.getParameter("keyField");
    }
    if (request.getParameter("reload") != null) {
        if (request.getParameter("reload").equals("true")) {
            keyWord = "";
            keyField = "";
        }
    }

    vlist = nMgr.getNoticesList(0, Integer.MAX_VALUE); // ��� �������� ��������
%>
<html>
<head>
    <title>��������</title>
    <link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div align="center">
    <br/>
    <h2>��������</h2>
    <br/>
    <table align="center" width="600">
        <tr>
            <td>Total : <%= vlist.size() %> Articles</td>
        </tr>
    </table>
    <table align="center" width="600" cellpadding="3">
        <tr>
            <td align="center" colspan="2">
                <%
                    if (vlist.isEmpty()) {
                        out.println("��ϵ� ���������� �����ϴ�.");
                    } else {
                %>
                <table width="100%" cellpadding="2" cellspacing="0">
                    <tr align="center" bgcolor="#D0D0D0" height="120%">
                        <td>��ȣ</td>
                        <td>����</td>
                        <td>��¥</td>
                    </tr>
                    <%
                        for (int i = 0; i < vlist.size(); i++) {
                            NoticesBean bean = vlist.get(i);
                            int num = bean.getNum();
                            String title = bean.getTitle();
                            String regdate = bean.getRegdate();
                    %>
                    <tr>
                        <td align="center"><%= i + 1 %></td>
                        <td>
                            <a href="read.jsp?num=<%= num %>"><%= title %></a>
                        </td>
                        <td align="center"><%= regdate %></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
                <%
                    }
                %>
            </td>
        </tr>
        <tr>
            <td colspan="2"><br /><br /></td>
        </tr>
        <tr>
            <td>
            </td>
            <% 
				    // ����� ���� Ȯ��
				    HttpSession userSession = request.getSession(false);
				    String userRole = (userSession != null && userSession.getAttribute("userRole") != null) ? (String) userSession.getAttribute("userRole") : "";
				%>
            <td align="right">
                <%
				        if (userRole.equals("����")) {
				    %>
				        <a href="post.jsp">[�۾���]</a> 
				    <%
				        }
				    %>
                <a href="../page/main/MainPage.jsp">[����ȭ������]</a> <!-- ����ȭ������ ��ũ �߰� -->
            </td>
        </tr>
    </table>
    <hr width="600"/>
    <form name="searchFrm" method="get" action="list.jsp">
        <table width="600" cellpadding="4" cellspacing="0">
            <tr>
                <td align="center" valign="bottom">
                    <select name="keyField" size="1" >
                        <option value="title">����</option>
                        <option value="content">����</option>
                    </select>
                    <input size="16" name="keyWord">
                    <input type="button"  value="ã��" onClick="javascript:check()">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>