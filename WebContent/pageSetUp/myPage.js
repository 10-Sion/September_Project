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

function showEditForm() {
        // 수정 폼을 보이게 하고 버튼을 숨김
        document.querySelector('.edit_form').style.display = 'block';
		document.querySelector('table').style.display = 'none';
        document.querySelector('.editBtn').style.display = 'none';
    }

    function cancelEditForm() {
        // 테이블 보이게 하고 수정 폼을 숨김
        document.querySelector('table').style.display = 'table';
        document.querySelector('.edit_form').style.display = 'none';
        // 수정 버튼 다시 보이게 함
        document.querySelector('.editBtn').style.display = 'block';
    }