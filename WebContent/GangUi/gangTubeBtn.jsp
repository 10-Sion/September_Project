<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>영상 선택 페이지</title>
</head>
<body>
    <!-- 버튼 클릭 시 영상 페이지로 이동 -->
    <button onclick="loadVideo('https://www.youtube.com/embed/eitDnP0_83k?controls=0')">영상 1</button>
    <button onclick="loadVideo('https://youtu.be/iVX4uGfGXck?si=RErNbyC2aTZuIUgi')">영상 2</button>

    <script>
	    function loadVideo(videoUrl) {
	        // videoUrl을 encodeURIComponent로 인코딩
	        const encodedUrl = encodeURIComponent(videoUrl);
	        console.log(encodedUrl);
	        // JSP 페이지로 이동
	        window.location.href = `gangTube.jsp?videoUrl=${encodedUrl}`;
	    }
</script>

</body>
</html>
