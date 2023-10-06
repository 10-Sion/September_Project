<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>영상 선택 페이지</title>
</head>
<body>
    <!-- 버튼 클릭 시 영상 페이지로 이동 -->
    <form action="gangTube.jsp" method="post">
        <input type="hidden" name="videoUrl" value="https://www.youtube.com/embed/eitDnP0_83k?controls=0">
        <button type="submit">영상 1</button>
    </form>
    <form action="gangTube.jsp" method="post">
        <input type="hidden" name="videoUrl" value="https://www.youtube.com/embed/45ZBl48MlzA?si=WPT2IB-mGfz_oCnA&amp;controls=0">
        <button type="submit">영상 2</button>
    </form>
</body>
</html>
