<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Q&A 게시판 - 질문 목록</title>
    <!-- 부트스트랩 CSS 링크 추가 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">질문 목록</h1>
        <% List<String> questionList = (List<String>) request.getAttribute("questionList"); %>
<ul class="list-group">
    <% if (questionList != null && !questionList.isEmpty()) {
        for (String question : questionList) { %>
        <li class="list-group-item">
            <a href="answer.jsp"><%= question %></a>
        </li>
    <% } } else { %>
        <li class="list-group-item">질문이 없습니다.</li>
    <% } %>
</ul>
        </ul> <!-- 질문 목록을 표시하는 코드 -->
        <ul class="list-group">
            <li class="list-group-item">
                <a href="answer.jsp">질문 제목 1</a>
            </li>
            <li class="list-group-item">
                <a href="answer.jsp">질문 제목 2</a>
            </li>
            <!-- 질문 목록 계속... -->
        </ul>
        
        <h2 class="mt-4">질문 작성</h2>
        <form action="/QnAServlet" method="post">
            <input type="hidden" name="action" value="postQuestion">
            <div class="form-group">
                <textarea class="form-control" name="questionText" rows="4" placeholder="질문을 입력하세요"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">질문 게시</button>
        </form>
    </div>
</body>
</html>