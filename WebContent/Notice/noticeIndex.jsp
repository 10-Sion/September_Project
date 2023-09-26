<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<title>Insert title here</title>
</head>
<body>

<button onclick="loadServletData('<%= request.getContextPath() %>/regNotice.do');">a</button>

<div class="table">

</div>

<script>
//서블릿 데이터 처리 함수
function loadServletData(servletUrl) {
	    $.ajax({
	        url: servletUrl,
	        type: 'GET',
	        dataType: 'html',
	        success: function(data) {
	            // 서블릿에서 반환된 데이터를 화면에 표시
	            $('.table').html(data);
	        },
	        error: function(xhr, status, error) {
	            console.error(error);
	        }
	    });
	}
</script>
</body>
</html>
