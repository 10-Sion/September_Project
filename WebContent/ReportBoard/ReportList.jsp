<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="../js/load.js"></script>
<%-- <%@ include file="../js/load.jsp" %> --%>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
	String non = "";
	String check = "";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="table">
        <table>
            <tr>
                <th>주차-차시</th>
                <th>과제유형</th>
                <th>과제제목</th>
                <th>제출방법</th>
                <th>제출기한</th>
                <th>공개여부</th>
                <th>제출인원</th>
                <th>평가인원</th>
                <th>제출여부</th>
            </tr>
            <tr>
                <td><%=non %>1-1</td>
                <td><%=non %>개인과제</td>
                <td><a href="javascript:void(0);" onclick="loadPage('<%=contextPath%>/ReportBoard/ReportForm.jsp')">창업 아이디어</a></td>
                <td><%=non %>온라인</td>
                <td><%=non %>22-09-15~22-10-15</td>
                <td><%=non %>공개</td>
                <td><%=non %>1</td>
                <td><%=non %>0/8</td>
                <td><%=check %></td>
                
            </tr>
        </table>
    </div>
</body>
</html>