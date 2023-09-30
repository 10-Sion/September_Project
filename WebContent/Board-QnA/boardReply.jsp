<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<!-- 답글달기  -->

    <meta charset="UTF-8">
    <title>게시물 상세 보기</title>
</head>
<body>
    <h1>게시물 상세 내용</h1>

    <c:forEach var="board" items="${boardReply}">
        <p>글번호: ${board.num}</p>
        <p>작성자: ${board.name}</p>
        <p>제목: ${board.subject}</p>
        <p>내용: ${board.content}</p>
        <!-- 답글 입력 폼 -->
        <form action="<%=request.getContextPath()%>/Board/BoardReplyPro.board" method="post">
            <input type="hidden" name="parent_id" value="${board.num}"> <!-- 부모 게시물의 ID를 숨겨진 필드로 전달 -->
            <table>
                <tr>
                    <td>작성자</td>
                    <td><input type="text" name="name" required></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td><textarea name="content" rows="5" cols="40" required></textarea></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="답글 작성">
                    </td>
                </tr>
            </table>
        </form>
    </c:forEach>

    <br>
    <a href="BoardListServlet">목록으로 돌아가기</a>
</body>
</html>
