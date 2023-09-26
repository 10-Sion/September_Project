<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	
	String stu_no = (String)session.getAttribute("stu_no"); 
	System.out.println("학생 정보 세션 값 : " + stu_no);
	
%>
<div align="left">
    <form action="<%=contextPath %>/stu/selStudnet.do" method="post">
        <input type="hidden" name="stu_no" value="<%=stu_no %>">
        <button type="submit">학생정보</button>
    </form>
    <p>
    <form action="<%=contextPath %>/stu/selStudy.do" method="post">
        <input type="hidden" name="study">
        <button type="submit">수강신청</button>
    </form>
    <p>
    <a href="#">성적조회</a>
    <p>
</div>
