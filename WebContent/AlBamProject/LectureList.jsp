<%@page import="java.util.ArrayList"%>
<%@page import="JaeWooDAO.LectureDAO"%>
<%@page import="JaeWooVO.LectureVO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath(); 
	
	//페이징 처리 변수
	
	int totalRecord = 0; //board테이블에 저장된 글의 총 개수
	int numPerPage = 10; //한 페이지당 조회해서 보여줄 글 개수
	int pagePerBlock = 3; //한 블럭당 묶여질 페이지 번호 개수 
						 // 1 2 3 < - 한블럭으로 묶음
						 
	int totalPage = 0; //총 페이지수
	int totalBlock = 0; //총 블럭수
	int nowPage = 0; //현재 사용자에게 보여지고 있는 페이지가 위치한 번호 저장
	int nowBlock = 0; //클릭한 페이지 번호가 속한 블럭 위치 번호 저장
	int beginPerPage = 0; //각 페이지마다 보여지는 시작 글번호(맨위의 글번호) 저장
	
	
	 ArrayList list = (ArrayList)request.getAttribute("list");
	 totalRecord = list.size();
	 System.out.print( "조회된 글의 갯수 : " + totalRecord);
	 
	 // 총 페이지 수 구하기
	 // 전체글(26) / 한 페이지에 보여질 글 수(10)) = 2.6 
	 // +1
	 totalPage = totalRecord/numPerPage + 1;
	 
	 // 총 블럭수 
	 // 전체 페이지 수 / 묶여질 페이지 수
	 totalBlock	= totalPage/pagePerBlock + 1;
	
	 // 보여질 시작 글 번호 = 현재 보여질 페이지 번호 * 한페이지당 보여질 글의 갯수
		
			 						
	 beginPerPage = nowPage * numPerPage + 10000;
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.footer{
	margin : 100px;
	margin-bottom: 20px;
    bottom: 20%;
    left: 70%;
	}
	

</style>
<script type="text/javascript">
	function check(){
		if(document.search.keyWord.value == ""){
			alert("검색어를 입력하세요.");
			document.search.keyWord.focus();
			return;		
		}
		document.search.submit();
	}
</script>
</head>
<body>
	<h1 align="center">강의실(전체 강의리스트)</h1>
	<form action="<%=contextPath%>/Lecture/LectureList.do" name = "search" method="post">
		<table border=0 width = 527 align = center cellpadding=4 cellspacing =0>
			<td align = center valign=bottom>
				<select name = "keyField" size="1">
					<option value = "pro_name">교수 명</option>
					<option value = "sub_name">과목 명 </option>						
				</select>
				<input type = "text" size ="16" name = "keyWord">
				<input type = "button" value = "찾기" onClick="check()">
				<input type = "hidden" name="page" value = "0">
			</td> 
		</table>
	</form>
	<div align="center">
	
	<table border="2" width="80%" height="50px" class = "Sub_top">
		<tr>
			<th>과목코드</th>
			<th>학년</th>
			<th>과목명</th>
			<th>교수명</th>
			<th>전공</th>
			<th>강의 장소</th>
			<th>학점</th>
			<th>수업계획서</th>
		</tr>	
<%
	if(list.isEmpty()){
%>
		<tr>
			<td colspan="8" align= "center">등록된 글이 없습니다.</td>
		</tr>
<%
	}else{
		
  		 for(int i = 0; i < list.size(); i++){
	 	  
  			if(i == totalRecord){
  				break;
  			}
  			LectureVO lv = (LectureVO)list.get(i);
		  
  %>
   	 <tr>	
   	 		<th><%=lv.getSub_no()%></th>
   	 		<th><%=lv.getGrade()%></th>
			<th><a href = "<%=contextPath%>/Lecture/LectureList.do?sub_no=<%=lv.getSub_no()%>" ><%=lv.getSub_name()%></a></th> 
			<th><%=lv.getPro_name()%></th>
			<th><%=lv.getMajor()%></th>
			<th><%=lv.getPlace()%></th>
			<th><%=lv.getCredit()%></th>
			<th><a href = "<%=contextPath%>/Lecture/LecturePlan.do?sub_no=<%=lv.getSub_no()%>" >수업 계획</a></th> 	
	</tr>

<%
   }//for 끝
}//else 끝
%>
	</table>
	</div>
</body>
<footer>
	<div class = "footer" align = "center">
		<a href="InsertSubject.jsp">강의 등록</a>
		<a href="ProfessorIndex.jsp">메인 화면</a>
	</div>
</footer>

</html>