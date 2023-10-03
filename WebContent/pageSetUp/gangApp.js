Vue.config.devtools = true;

// Vue component를 jQuery로 변경
$.fn.card = function () {
  return this.each(function () {
    const $cardWrap = $(this);
    const $card = $cardWrap.find('.card');
    const $cardBg = $cardWrap.find('.card-bg');
    const $cardInfo = $cardWrap.find('.card-info');
    const width = $cardWrap.width();
    const height = $cardWrap.height();
    let mouseX = 0;
    let mouseY = 0;
    let mouseLeaveDelay = null;

    // 마우스 이벤트 처리
    $cardWrap.on('mousemove', handleMouseMove);
    $cardWrap.on('mouseenter', handleMouseEnter);
    $cardWrap.on('mouseleave', handleMouseLeave);

    function handleMouseMove(e) {
      mouseX = e.pageX - $cardWrap.offset().left - width / 2;
      mouseY = e.pageY - $cardWrap.offset().top - height / 2;
      updateCardStyle();
    }

    function handleMouseEnter() {
      clearTimeout(mouseLeaveDelay);
    }

    function handleMouseLeave() {
      mouseLeaveDelay = setTimeout(() => {
        mouseX = 0;
        mouseY = 0;
        updateCardStyle();
      }, 1000);
    }

    function updateCardStyle() {
      const rX = (mouseX / width) * 30;
      const rY = (mouseY / height) * -30;
      const tX = (mouseX / width) * -40;
      const tY = (mouseY / height) * -40;

      $card.css({
        transform: `rotateY(${rX}deg) rotateX(${rY}deg)`
      });

      $cardBg.css({
        transform: `translateX(${tX}px) translateY(${tY}px)`
      });
    }
  });
};

// 컴포넌트 적용
$('.card-wrap').card();
