<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice List</title>

</head>
<body>
<table>
   <colgroup>
      <col width="10%">
      <col width="*">
      <col width="15%">
      <col width="15%">
   </colgroup>
   <tr>
      <td>글번호</td>
      <td>제목</td>
      <td>작성자</td>
      <td>작성일</td>
   </tr>
   
   <c:forEach items="${list}" var="notice">
      <tr>
          <td>${notice.getNoticeNum()}</td>
          <td><a href="noticeDetail.do?noticeNum=${notice.getNoticeNum()}">${notice.getTitle()}</a></td>
          <td>${notice.getWriter()}</td>
          <td>${notice.getCreateDate()}</td>
      </tr>
   </c:forEach>
         
</table>
<input type="button" value="글쓰기" onclick="location.href='regNoticeForm.do';">
</body>
</html>
