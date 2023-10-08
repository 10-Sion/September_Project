<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>공지사항 수정</title>
</head>
<body>
    <h1>공지사항 수정</h1>
    <form action="Notices/noticesUpdate" method="post">
        <input type="hidden" name="num" value="${notice.num}">
        제목: <input type="text" name="title" value="${notice.title}"><br>
        내용: <textarea name="content" rows="5" cols="40">${notice.content}</textarea><br>
        <input type="submit" value="수정">
    </form>
</body>
</html>
