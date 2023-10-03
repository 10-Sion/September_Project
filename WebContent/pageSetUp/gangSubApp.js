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

  // Set active item style on page load
  setActiveItemStyle(activeItemVerticalInner);

  $("#accordian").on("click", "li", function(e) {
    $('#accordian ul li').removeClass("active");
    $(this).addClass('active');
    setActiveItemStyle($(this));
  });

  // Add active class to target link on another-page move
  var path = window.location.pathname.split("/").pop();

  if (path == '') {
    path = 'index.html';
  }

  var target = $('#accordian ul li a[href="' + path + '"]').parent();
  target.addClass('active');
});
