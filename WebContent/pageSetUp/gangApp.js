$(document).ready(function () {

  // 초기 Border 위치 설정
  var activePos = $('.tabs-header .active').position();

  // 위치 변경 함수
  function changePos() {
    // 위치 업데이트
    activePos = $('.tabs-header .active').position();

    // 위치 및 너비 변경
    $('.border').stop().css({
      left: activePos.left,
      width: $('.tabs-header .active').width()
    });
  }

  changePos();

  // 탭 변경 함수
  function changeTab() {
    var getTabId = $('.tabs-header .active a').attr('tab-id');

    // 활성 탭 상태 제거
    $('.tab').stop().fadeOut(300, function () {
      // 클래스 제거
      $(this).removeClass('active');
    }).hide();

    $('.tab[tab-id=' + getTabId + ']').stop().fadeIn(300, function () {
      // 클래스 추가
      $(this).addClass('active');
    });
  }

  // 탭 클릭 이벤트
  $('.tabs-header a').on('click', function (e) {
    e.preventDefault();

    // 탭 ID
    var tabId = $(this).attr('tab-id');

    // 활성 상태 제거
    $('.tabs-header a').stop().parent().removeClass('active');

    // 활성 상태 추가
    $(this).stop().parent().addClass('active');

    changePos();

    // 현재 아이템 업데이트
    tabCurrentItem = tabItems.filter('.active');

    // 활성 상태 제거
    $('.tab').stop().fadeOut(300, function () {
      // 클래스 제거
      $(this).removeClass('active');
    }).hide();

    // 활성 상태 추가
    $('.tab[tab-id="' + tabId + '"]').stop().fadeIn(300, function () {
      // 클래스 추가
      $(this).addClass('active');
    });
  });

  // 탭 아이템
  var tabItems = $('.tabs-header ul li');

  // 현재 탭 아이템
  var tabCurrentItem = tabItems.filter('.active');

  // 다음 버튼
  $('#next').on('click', function (e) {
    e.preventDefault();

    var nextItem = tabCurrentItem.next();

    tabCurrentItem.removeClass('active');

    if (nextItem.length) {
      tabCurrentItem = nextItem.addClass('active');
    } else {
      tabCurrentItem = tabItems.first().addClass('active');
    }

    changePos();
    changeTab();
  });

  // 이전 버튼
  $('#prev').on('click', function (e) {
    e.preventDefault();

    var prevItem = tabCurrentItem.prev();

    tabCurrentItem.removeClass('active');

    if (prevItem.length) {
      tabCurrentItem = prevItem.addClass('active');
    } else {
      tabCurrentItem = tabItems.last().addClass('active');
    }

    changePos();
    changeTab();
  });

});
