<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>영상 선택 페이지</title>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
	    $(document).ready(function() {
	    	
	        $("button").click(function() {
	        	
	            const videoUrl = $(this).data("video-url");
	            const popup = window.open('', 'Popup', 'width=800,height=600');
	            const form = document.createElement('form');
	            
	            form.action = 'gangTube.jsp';
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
</head>
<body>
    <button data-video-url="https://www.youtube.com/embed/qyGjLVQ0Hog?si=3mNq_PrRUCn8Jgd6">영상 1</button>
    <button data-video-url="https://www.youtube.com/embed/NNClHeXzIBA?si=zzHjcIg6B9hb1CCL">영상 2</button>
    <button data-video-url="https://www.youtube.com/embed/ymmGSVUwTDM?si=Jkh5ZGP9eU6XuOBg">영상 3</button>
    <button data-video-url="https://www.youtube.com/embed/P6AgXuh-fxA?si=Z7GiBSqzUd7vd9tL">영상 4</button>
    <button data-video-url="https://www.youtube.com/embed/SSzsqDeS2JI?si=3V1iJWhjZDgoCQeX">영상 5</button>
    <button data-video-url="https://www.youtube.com/embed/yZVTnaudGXk?si=nua46wi8wwRC7PyX">영상 6</button>
    <button data-video-url="https://www.youtube.com/embed/H8LG-GncT94?si=3M97bZK2R2y6xrTu">영상 7</button>
    <button data-video-url="https://www.youtube.com/embed/ec1jW_jBCmI?si=jodOSJtNb-rKL6FS">영상 8</button>

</body>
</html>
