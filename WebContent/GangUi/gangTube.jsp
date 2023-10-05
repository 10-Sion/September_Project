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
            <iframe id="video-frame" width="100%" height="100%" frameborder="0" 
                    allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
                    allowfullscreen>
            </iframe>
        </div>
    </div>
    
    <script>
        // URL 파라미터에서 videoUrl 값을 가져와 설정
        const urlParams = new URLSearchParams(window.location.search);
        const videoUrl = urlParams.get('videoUrl');
        if (videoUrl) {
            const decodedUrl = decodeURIComponent(videoUrl);
            console.log(decodeUrl);
            // iframe의 src에 설정
            document.getElementById('video-frame').src = decodedUrl;
        }
    </script>
</body>
</html>
