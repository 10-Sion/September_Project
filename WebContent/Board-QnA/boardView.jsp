<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>


    <meta charset="UTF-8">
    <title>게시물 상세 보기</title>
</head>
<body>
    <h1>게시물 상세 보기</h1>
    
        <form action="<%=request.getContextPath()%>/Board/BoardWritePro.board" method="post">
    <table border="1">
        <tr>
            <th>글번호</th>
            <td>${board.num}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${board.name}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td>${board.subject}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${board.content}</td>
        </tr>
        
        <!-- 수정 결과 메시지 표시 부분 -->
		<tr>
		    <td colspan="2">
		        <% String message = (String)request.getAttribute("message"); %>
		        <% if (message != null && !message.isEmpty()) { %>
		            <div class="message">
		                <%= message %>
		            </div>
		        <% } %>
		    </td>
		</tr>
        
        <tr>
            <th>작성일</th>
            <td>${board.regdate}</td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${board.count}</td>
        </tr>
    </table>
    </form>
    <br>
    <a href="BoardListServlet">목록으로 돌아가기</a>
    <br>
    <a href="BoardUpdateServlet?num=${board.num}">수정</a>
    <br>
    <a href="BoardController?action=delete&num=${board.num}">삭제</a>
</body>
</html>