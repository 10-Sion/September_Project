<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="common.css">

    <meta charset="UTF-8">
    <title>게시물 수정</title>
</head>
<body>
    <h1>게시물 수정</h1>
    
    <form action="BoardController?action=edit" method="post">
        <input type="hidden" name="num" value="${board.num}">
        <table>
            <tr>
                <td>작성자</td>
                <td>${board.name}</td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input type="text" name="subject" value="${board.subject}" required></td>
            </tr>
            <tr>
                <td>내용</td>
                <td><textarea name="content" rows="5" cols="40" required>${board.content}</textarea></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="수정">
                    <input type="reset" value="취소">
                </td>
            </tr>
        </table>
    </form>
    
    <br>
    <a href="BoardController?action=list">목록으로 돌아가기</a>
</body>
</html>