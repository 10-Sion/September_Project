<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>공지사항 작성</title>
</head>
<body>
    <h1>공지사항 작성</h1>
    <form action="Notices/noticesWrite" method="post">
        제목: <input type="text" name="title"><br>
        내용: <textarea name="content" rows="5" cols="40"></textarea><br>
        <input type="submit" value="작성">
    </form>
</body>
</html>
