<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
    <!-- 공지사항 쓰기 페이지 -->
    <title>공지사항</title>
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
    <form name="postFrm" method="post" action="noticesPost" enctype="multipart/form-data">
        <table width="600" cellpadding="3" align="center">
            <tr>
                <td align=center>
                    <table align="center">
                        <tr>
                            <td width="10%">작성자</td>
                            <td width="90%">
                                <input name="name" size="10" maxlength="8">
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
