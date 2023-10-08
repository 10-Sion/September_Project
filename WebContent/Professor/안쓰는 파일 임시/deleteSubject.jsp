
<%@page import="JaeWooDAO.SubDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- SubIndex에서 삭제를 요청할시
 	해당 과목의 과목번호를 받아와서 
 --%>
 <% 
 	request.setCharacterEncoding("UTF-8");
	int sub_no = Integer.parseInt(request.getParameter("sub_no")); //이전페이지 세션에 저장되었던 과목번호를 request로 넘겨받은 값
	SubDao subDao = new SubDao();
	int CurSub = (int)session.getAttribute("pro_no"); //현재페이지의 로그인 세션 값
 %>
 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	subDao.delSubject(sub_no);
	response.sendRedirect("SubIndex.jsp");
%>

</body>
</html>