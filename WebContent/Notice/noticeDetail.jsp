<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 
글번호 : ${board.boardNum }<br>
제목 : ${board.title } <br>
내용 : ${board.content }<br>
작성자 : ${board.writer }<br>
작성일 : ${board.createDate }<br>
 
<input type="button" value="삭제하기" onclick="location.href='delete.do?boardNum=${board.boardNum }';">
<!-- 어떤걸 삭제할건지 보드 번호를 가져가야해서 ?뒤에 문장이나옴. -->
<input type="button" value="수정" onclick="location.href='updateBoardForm.do?boardNum=${board.boardNum }';">
<!-- 상세보기 페이지로 넘어갈때도 글번호 데이터를 넘겨서 가져가야해서 ?뒤에 문장을쓴다. -->
</body>
</html>