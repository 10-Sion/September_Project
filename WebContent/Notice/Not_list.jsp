<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>공지사항 목록</title>
</head>
<body>
    <h1>공지사항 목록</h1>
    <table border="1">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성일</th>
        </tr>
        <c:forEach items="${noticesList}" var="notice">
            <tr>
                <td>${notice.num}</td>
                <td><a href="Notices/noticesRead?num=${notice.num}">${notice.title}</a></td>
                <td>${notice.regdate}</td>
            </tr>
        </c:forEach>
    </table>
    <a href="Notices/noticesWriteForm.jsp">글쓰기</a>
</body>
</html>
