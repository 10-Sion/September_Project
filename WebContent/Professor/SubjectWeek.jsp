<%@page import="JaeWooVO.WeekVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
	int sub_no = Integer.parseInt(request.getParameter("sub_no"));
 	ArrayList list = (ArrayList) request.getAttribute("weeklist"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
// function ads() {
	
//     $.ajax(
//     	{
<%--         url: '<%=contextPath%>/Lecture/ProLectureDetail.do?sub_no=<%=sub_no%>', --%>
//         type: 'post',
//         dataType: 'json',
//         success: function(data) {
        	
//          console.log("제이슨 연결");	
//       	 console.log(data.weeklist);
      	 
//      	var jsonObject = JSON.parse(data);
// 		var array = jsonObject.weeklist;
//         },
//         error: function(xhr, status, error) {
//             console.error(error);
//             console.log("제이슨 연결");	
//         }
//     });


    
    
    function refreshList() {
        $.ajax({
            url: "<%=contextPath%>/Lecture/ProLectureDetail.do?sub_no=<%=sub_no%>",
            type: "POST",
            dataType: "json",
            success: function(data) {
                // data 변수에 서버에서 받은 JSON 데이터가 담김
                // TODO: data 변수의 값을 가지고 원하는 방식으로 화면 업데이트 처리

                 console.log("제이슨 연결");	
                 console.log(data);
                // 예제) 가져온 게시글 목록 출력
                
                }
            }
        });
    }

    $(document).ready(function() {
        // 초기 로딩 시 목록 가져오기
        refreshList();

        // 일정 시간마다 자동 갱신
        setInterval(refreshList, 5000); // 5초마다 갱신 (1000ms = 1초)
    });

</script>
</head>
<body align = "center" onload="set();">
<buttons>
 <button type = "button" onclick= "window.open('<%=contextPath%>/Professor/InsertWeek.jsp?sub_no=<%=sub_no%>','주차추가','width=500 height=400')">주차 추가</button>
 <button type = "button" onclick= "loadPage('<%=contextPath%>/Professor/InsertWeek.jsp?sub_no=<%=sub_no%>')">주차 추가2</button>
	<button type = "button">수정</button>
	<button type = "button">삭제</button>
</buttons>
	<div class = "table">
	<table>
	<tr  onclick = "ads();">
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
	}
 else{
		for(int i = 0; i < list.size(); i++){
			WeekVO kw = (WeekVO)list.get(i);
%>
		<tr>
			<td><%=kw.getWeek()%></td>
			<td><%=kw.getClass_hour()%></td>
			<td><%=kw.getWeek_name()%></td>
			<td><%=kw.getClass_type()%></td>
			<td><%if( kw.isAssignment() == true){%>유<%}	else{%>무<%}%></td>			
			<td><button data-video-url="<%=kw.getLecture_link()%>">강의 시청</button></td>
		</tr>
<%
		}
	} 
%>
	</table>
	</div>
	
	<script>
		// 버튼에 폼 기능 부여하는 함수
		$(document).ready(function() {
	    	
	        $("button").click(function() {
	        	
	            const videoUrl = $(this).data("video-url");
	            const popup = window.open('', 'Popup', 'width=800,height=600');
	            const form = document.createElement('form');
	            
	            form.action = 'subVideo.jsp';
	            form.method = 'post';
	            form.target = 'Popup';
	
	            const input = document.createElement('input');
	            
	            input.type = 'hidden';
	            input.name = 'videoUrl';
	            input.value = videoUrl;
	
	            const button = document.createElement('input');
	            
	            button.type = 'submit';
	            button.value = '강의 시청';
	
	            form.appendChild(input);
	            form.appendChild(button);
	
	            popup.document.body.appendChild(form);
	            form.submit();
	        });
	    });
	</script>
</body>
</html>