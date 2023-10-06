<%@ page contentType="text/html; charset=EUC-KR" %>
<%@page import="Notices.NoticesBean"%>
<jsp:useBean id="nMgr" class="Notices.NoticesMgr" />
<%
    request.setCharacterEncoding("EUC-KR");
    int num = Integer.parseInt(request.getParameter("num"));
    NoticesBean bean = nMgr.getNotice(num); // 공지사항 가져오기
    String title = bean.getTitle();
    String regdate = bean.getRegdate();
    String content = bean.getContent();

    int sub_no = bean.getSub_no();
    int pro_no = bean.getPro_no();
    session.setAttribute("bean", bean); // 공지사항을 세션에 저장
%>
<html>
<head>
    <title>공지사항</title>
    <link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<br/><br/>
<table align="center" width="600" cellspacing="3">
    <tr>
        <td bgcolor="#9CA2EE" height="25" align="center">글읽기</td>
    </tr>
    <tr>
        <td colspan="2">
            <table cellpadding="3" cellspacing="0" width="100%">
                <tr>
                    <td align="center" bgcolor="#DDDDDD" width="10%"> 제목 </td>
                    <td bgcolor="#FFFFE8" colspan="3"><%=title%></td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#DDDDDD"> 등록날짜 </td>
                    <td bgcolor="#FFFFE8"><%=regdate%></td>
                </tr>
                <tr>
                    <td colspan="4"><br/><pre><%=content%></pre><br/></td>
                </tr>
         
            </table>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2">
            <hr/>
            [ <a href="#" onclick="loadPage('/HakSaGwanLee/Notices/list.jsp')">리스트</a> |
            <a href="#" onclick="loadPage('/HakSaGwanLee/Notices/update.jsp?num=<%= num %>')">수정</a> |
            <a href="#" onclick="loadPage('/HakSaGwanLee/Notices/delete.jsp?num=<%= num %>')">삭제</a> ]
        </td>
    </tr>
</table>

<form name="listFrm" method="post" action="list.jsp">
</form>
</body>
</html>