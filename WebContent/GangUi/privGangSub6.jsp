<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <table>
            <tr>
            	<th>주차-차시</th>
                <th>과제번호</th>
                <th>과제명</th>
                <th>제출방법</th>
                <th>제출기한</th>
                <th>공개여부</th>
                <th>제출인원</th>
                <th>평가인원</th>
                <th>제출여부</th>
            </tr>
            <tr>
                <td class="profile_name"> 주차</td>
                <td>과제번호</td>
                <td>과제명</td>
                <td>제출방법</td>
                <td>제출기한</td>
                <td>비공개</td>
                <td>0</td>
                <td>1</td>
                <td><a href="javascript:void(0);" onclick="loadServletData('<%=contextPath%>/ReportBoard/ReportForm.jsp')">미제출</a></td>
            </tr>
        </table>
</body>
</html>