<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="../pageSetUp/gangTube.css"> 
    <meta charset="UTF-8">
    <title>강의실</title>
</head>
<body>
    <h1>Responsive Video</h1>
    <div class="video">
        <div class="video-container">
            <%
                // JSP에서 videoUrl 값을 받아옴
                String videoUrl = request.getParameter("videoUrl");
                if (videoUrl != null) {
                    // URL 스키마 검증 (HTTP 또는 HTTPS만 허용)
                    if (videoUrl.matches("^https?://.*$")) {
                        
                        if (videoUrl.contains("www.youtube.com")) {
            %>

            <iframe id="video-frame" width="100%" height="100%" frameborder="0" 
                    allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
                    allowfullscreen src="<%= videoUrl %>">
            </iframe>
            <%
                        } else {
                            out.println("잘못된 YouTube URL입니다.");
                        }
                    } else {
                        out.println("잘못된 URL 형식입니다.");
                    }
                }
            %>
        </div>
    </div>
</body>
</html>
