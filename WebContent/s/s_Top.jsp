<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
	
	System.out.println("탑 세션 값 : " + session.getAttribute("stu_no"));
	String check = (String)session.getAttribute("stu_no");
%>
<div align="right">
	<%
		if(check == null){
	%>
			<button type="button" onclick="location.href='<%=contextPath %>/stu/login.do'">로그인</button>	
	<%
		} else {
	%>
			<label><%=check %> 로그인 되었음.</label>
			<button type="button" onclick="location.href='<%=contextPath %>/stu/logOut.do'">로그아웃</button>
	<%
		}
	%>
</div>