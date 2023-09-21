<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>


    <meta charset="UTF-8">
    <title>게시물 목록</title>
    <link rel="stylesheet" type="text/css" href="common.css">
</head>
<body>
    <h1>게시판 목록</h1>
    
    <table border="1">
        <tr>
            <th>글번호</th>
            <th>글쓴이</th>
            <th>제목</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        
        <c:forEach var="board" items="${boardList}">
            <tr>
            
                <td>${board.num}</td>
                <td>${board.name}</td>
                <td><a href="BoardController?action=view&num=${board.num}">${board.subject}</a></td>
                <td>${board.regdate}</td>
                <td>${board.count}</td>
            </tr>
        </c:forEach>
    </table>
    
    <br>
    <a href="BoardController?action=new">새 글 쓰기</a>
</body>
</html>