// 페이지 동적 처리
function loadPage(pageUrl) {
    const tableDiv = document.getElementsByClassName('table');

    tableDiv.innerHTML = '<jsp:include page="' + pageUrl + '" />';
}