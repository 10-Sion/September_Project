<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Notice</title>
</head>
<body>
<form action="updateNotice.do" method="post">
<input type="hidden" name="noticeNum" value="${notice.getNoticeNum() }">
<table>
    <tr>
        <td>제목</td>
        <td><input type="text" name="title" value="${notice.getTitle() }"></td>
    </tr>
    <tr>
        <td>작성자</td>
        <td><input type="text" name="writer" value="${notice.getWriter() }"></td>
    </tr>
    <tr>
        <td>작성일</td>
        <td><input type="text" name="createDate" value="${notice.getCreateDate() }" readonly></td>
    </tr>
    <tr>
        <td>내용</td>
        <td><textarea rows="5" cols="50">${notice.getContent() }</textarea></td>
    </tr>
</table>
<input type="submit" value="글수정">
</form>
</body>
</html>
