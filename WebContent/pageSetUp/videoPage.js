// 버튼/a태그 에 폼 기능 부여하는 함수 - 주차별 강의
$(document).ready(function() {
    $("button, .video-link").click(function(event) {
        event.preventDefault(); // 기존 링크 동작 방지

        const videoUrl = $(this).data("video-url");
        const popup = window.open('', 'Popup', 'width=800,height=600');
        const form = document.createElement('form');

        form.action = '/HakSaGwanLee/GangUi/subVideo.jsp'; // 서버 측 처리 페이지 경로
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