<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Q&A 게시판 - 답변</title>
    <!-- 부트스트랩 CSS 링크 추가 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">질문 제목</h1>
        
        <div class="card mb-4">
            <div class="card-body">
                <p class="card-text">질문 내용을 여기에 표시합니다.</p>
            </div>
        </div>
        
        <h2 class="mt-4">답변 작성</h2>
        <form action="/qa-servlet" method="post">
            <input type="hidden" name="action" value="postAnswer">
            <div class="form-group">
                <textarea class="form-control" name="answerText" rows="4" placeholder="답변을 입력하세요"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">답변 게시</button>
        </form>
        
        <h2 class="mt-4">답변 목록</h2>
        <div class="card">
            <div class="card-body">
                <p class="card-text">답변 내용을 여기에 표시합니다.</p>
            </div>
        </div>
    </div>
</body>
</html>