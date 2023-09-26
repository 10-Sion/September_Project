<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- JSTL태그의 core라이브러리 관련 태그들을 사용하기 위해 import --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- 센터 중앙 화면 공간은 상위 메뉴를 클릭할때 마다 계속 변화되어 나타나야 하기 때문에
	request내장객체 영역으로 부터 중앙 화면 공간의 View주소를 얻어와 변수에 저장 해야 합니다.
 --%>
<%-- <c:set var="center" value="${param.center}"/> --%>
<c:set var="center" value="${requestScope.center}"/>
<c:out value="${center}" />
<%
	System.out.println("메인 세션 값 : " + session.getAttribute("stu_no"));
%>
 
<%-- 처음으로 CarMain.jsp 메인화면을 요청 했을때... 중앙화면은 Center.jsp로 보이게 설정하자 --%>
 
<c:if test="${center == null}">
	<c:set var="center" value="../student/index.jsp"/>
</c:if>

<!DOCTYPE html>
<html>
<head>
<link href="../s_css/stu.css" rel="stylesheet">
<meta charset="UTF-8">
<title>학생 메인화면</title>
</head>
<body>
	<div class="wrapper">
		<header>
			<jsp:include page="/s/s_Top.jsp"></jsp:include>
		</header>
	</div>
	
	<div class="container">
		<div class="nav">
			<jsp:include page="/s/s_Sidebar.jsp"></jsp:include>
		</div>
		<div class="content">
			<jsp:include page="${center }"></jsp:include>
		</div>
	</div>
</body>
</html>
