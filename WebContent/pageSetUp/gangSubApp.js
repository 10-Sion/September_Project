jQuery(document).ready(function($) {
  var tabsVerticalInner = $('#accordian');
  var selectorVerticalInner = $('#accordian').find('li').length;
  var activeItemVerticalInner = tabsVerticalInner.find('.active');
  
  function setActiveItemStyle(item) {
    var activeWidthVerticalHeight = item.innerHeight();
    var activeWidthVerticalWidth = item.innerWidth();
    var itemPosVerticalTop = item.position();
    var itemPosVerticalLeft = item.position();

    $(".selector-active").css({
      "top": itemPosVerticalTop.top + "px",
      "left": itemPosVerticalLeft.left + "px",
      "height": activeWidthVerticalHeight + "px",
      "width": activeWidthVerticalWidth + "px"
    });
  }

  // 페이지 로딩시 기본
  setActiveItemStyle(activeItemVerticalInner);

  $("#accordian").on("click", "li", function(e) {
    $('#accordian ul li').removeClass("active");
    $(this).addClass('active');
    setActiveItemStyle($(this));
  });

  
  var path = window.location.pathname.split("/").pop();

  if (path == '') {
    path = 'index.html';
  }

  var target = $('#accordian ul li a[href="' + path + '"]').parent();
  target.addClass('active');
});

$(document).ready(function() {
    // 각 li 요소에 대한 클릭 이벤트 처리
    $("#accordian ul li").click(function() {
        // .base_content를 숨깁니다.
        $(".base_content").hide();
    });
});
