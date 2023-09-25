<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
   <link rel="stylesheet" type="text/css" href="common.css">

    <meta charset="UTF-8">
    <title>게시물 목록</title>

</head>
<body>
    <h1>게시판 목록</h1>

    <table border="1">
        <tr>
            <th>글번호</th>
            <th>작성자</th>
            <th>제목</th>
            <th>작성일</th>
            
        </tr>
        
        <c:forEach var="board" items="${boardList}">
            <tr>
            
                <td>${board.num}</td>
                <td>${board.name}</td>
                <td>${board.subject}</td>
                <td>${board.regdate}</td>
              
            </tr>
        </c:forEach>
    </table>

    <br>
    <a href="BoardController?action=new">새 글 쓰기</a>
</body>
</html>