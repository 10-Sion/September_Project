<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Detail</title>
</head>
<body>
 
글번호 : ${notice.getNoticeNum()}<br>
제목 : ${notice.getTitle()} <br>
내용 : ${notice.getContent()}<br>
작성자 : ${notice.getWriter()}<br>
작성일 : ${notice.getCreateDate()}<br>
 
<input type="button" value="삭제하기" onclick="location.href='delete.do?noticeNum=${notice.getNoticeNum()}';">
<input type="button" value="수정" onclick="location.href='updateNoticeForm.do?noticeNum=${notice.getNoticeNum()}';">

</body>
</html>
