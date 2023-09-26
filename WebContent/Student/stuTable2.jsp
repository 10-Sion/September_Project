<%@page import="java.util.ArrayList"%>
<%@page import="stuVO.SubVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
	ArrayList subList = (ArrayList)request.getAttribute("subList");
	SubVO subVo = new SubVO();
	ArrayList addSub = new ArrayList();
	addSub.add(0, "1");
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
			<tr align="center">
				<td>과목 번호</td>
				<td>과목 명</td>
				<td>담당교수</td>
				<td>학부</td>
				<td>전공</td>
				<td>강의실</td>
				<td>수강인원</td>
				<td>수강신청</td>
			</tr>
<%
	for(int i = 0; i < subList.size(); i++){
	subVo = (SubVO)subList.get(i);
%>
			<tr align="center">
				<td><%=subVo.getSub_no() %></td>
				<td><%=subVo.getSub_name() %></td>
				<td><%=subVo.getPro_name() %></td>
				<td><%=subVo.getDep_name() %></td>
				<td><%=subVo.getMajor() %></td>
				<td><%=subVo.getPlace() %></td>
				<td><%=subVo.getCapacity() %></td>
				<td>
					<input type="checkbox" name="addSub" value="<%=subVo.getSub_no()%>"/>	
				</td>
			</tr>
<%
	}
%>
    	</table>
    </div>
    <input type="submit" 
    	onclick="loadServletData('<%=contextPath%>/stu/addSubject.do')?addSub=<%=addSub %>;" 
    	value="수강신청하기" />
	<input type="reset" value="다시 선택" />
</body>
</html>