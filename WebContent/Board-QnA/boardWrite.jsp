<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
   <link rel="stylesheet" type="text/css" href="common.css">
    <meta charset="UTF-8">
    <title>게시물 작성</title>
</head>
<body>
    <h1>Q & A 작성</h1>
    
    
    <form action="<%=request.getContextPath()%>/Board/BoardWritePro.board" method="post">
        <table>
            <tr>
                <td>작성자</td>
                <td><input type="text" name="name" required></td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input type="text" name="subject" required></td>
            </tr>
            <tr>
                <td>내용</td>
                <td><textarea name="content" rows="5" cols="40" required></textarea></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="작성">
                    <input type="reset" value="취소">
                </td>
            </tr>
        </table>
    </form>
    
    <br>
    <a href="BoardController?action=list">목록으로 돌아가기</a>
</body>
</html>