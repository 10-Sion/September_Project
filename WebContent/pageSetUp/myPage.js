//    페이지 로딩 함수
  function loadPage(pageUrl) {
      $.ajax({
          url: pageUrl,
          type: 'GET',
          dataType: 'html',
          success: function(data) {
              $('.table').html(data);
          },
          error: function(xhr, status, error) {
              console.error(error);
          }
      });
  }
  //    서블릿 데이터 처리 함수
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

$(document).ready(function() {
    // 수정 폼을 보이게 하고 버튼을 숨김
    $(".editBtn").click(function() {
        $('.edit_form').show();
        $('table').hide();
        $('.editBtn').hide();
    });

    // 취소 버튼을 클릭하면 테이블을 보이게 하고 수정 폼을 숨김
    $(".cancelBtn").click(function() {
        $('table').show();
        $('.edit_form').hide();
        $('.editBtn').show();
    });
});
    