<%@page import="JaeWooVO.WeekVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();

	ArrayList list = (ArrayList) request.getAttribute("weeklist");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body align = "center">
<buttons>
	<button type = "button" onclick= "window.open('InsertWeek.jsp','주차추가','width=500', 'height=700')">주차 추가</button>
	<button type = "button">수정</button>
	<button type = "button">삭제</button>
</buttons>
	<div class = "table">
	<table>
	<tr>
		<td>주차</td>
		<td>차시</td>
		<td>강의 주제</td>
		<td>수업 형태</td>
		<td>과제</td>
		<td>강의 링크</td>
	</tr>
<% 
	if(list.isEmpty()){
%>
			<tr>
				<td colspan="6" align="center">등록된 글이 없습니다.</td>
			</tr>
<%
	}else{
		for(int i = 0; i < list.size(); i++){
			WeekVO kw = (WeekVO)list.get(i);
%>
		<tr>
			<td>주차</td>
			<td>차시</td>
			<td>강의 주제</td>
			<td>수업 형태</td>
			<td>과제</td>
			<td>강의 링크</td>
		</tr>
<%
		}
	} 
%>
	<tr>
		<td></td>
	</tr>
	</table>
	</div>
</body>
</html>