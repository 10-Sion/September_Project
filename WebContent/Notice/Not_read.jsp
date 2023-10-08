<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>공지사항 상세 내용</title>
</head>
<body>
    <h1>공지사항 상세 내용</h1>
    <table>
        <tr>
            <th>번호</th>
            <td>${notice.num}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td>${notice.title}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${notice.content}</td>
        </tr>
        <tr>
            <th>작성일</th>
            <td>${notice.regdate}</td>
        </tr>
    </table>
    <a href="Not_list.jsp">목록으로 돌아가기</a>
</body>
</html>
