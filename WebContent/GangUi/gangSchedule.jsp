<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../pageSetUp/gangSchedule.css">
</head>
<body>
    <br />
    <div class="cd-schedule loading">
        <div class="timeline">
            <ul>
                <li><span>09:00</span></li>
                <li><span>09:30</span></li>
                <li><span>10:00</span></li>
                <li><span>10:30</span></li>
                <li><span>11:00</span></li>
                <li><span>11:30</span></li>
                <li><span>12:00</span></li>
                <li><span>12:30</span></li>
                <li><span>13:00</span></li>
                <li><span>13:30</span></li>
                <li><span>14:00</span></li>
                <li><span>14:30</span></li>
                <li><span>15:00</span></li>
                <li><span>15:30</span></li>
                <li><span>16:00</span></li>
                <li><span>16:30</span></li>
                <li><span>17:00</span></li>
                <li><span>17:30</span></li>
                <li><span>18:00</span></li>
            </ul>
        </div> <!-- .timeline -->

        <div class="events">
            <ul class="wrap">
                <li class="events-group">
                    <div class="top-info"><span>월요일</span></div>
                    <ul>
                        <li class="single-event" data-start="09:00" data-end="10:30" data-content="event-1" data-event="event-1">
                            <a href="#0">
                                <em class="event-name">강의</em>
                            </a>
                        </li>

                        <li class="single-event" data-start="11:00" data-end="12:30" data-content="event-2" data-event="event-2">
                            <a href="#0">
                                <em class="event-name">회의</em>
                            </a>
                        </li>

                        <li class="single-event" data-start="14:00" data-end="15:15" data-content="event-3" data-event="event-3">
                            <a href="#0">
                                <em class="event-name">워크샵</em>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="events-group">
                    <div class="top-info"><span>화요일</span></div>

                    <ul>
                        <li class="single-event" data-start="09:30" data-end="11:00" data-content="event-4" data-event="event-4">
                            <a href="#0">
                                <em class="event-name">세미나</em>
                            </a>
                        </li>

                        <li class="single-event" data-start="11:30" data-end="13:00" data-content="event-5" data-event="event-5">
                            <a href="#0">
                                <em class="event-name">실험실 업무</em>
                            </a>
                        </li>

                        <li class="single-event" data-start="13:30" data-end="15:00" data-content="event-6" data-event="event-6">
                            <a href="#0">
                                <em class="event-name">토론</em>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="events-group">
                    <div class="top-info"><span>수요일</span></div>

                    <ul>
                        <li class="single-event" data-start="09:00" data-end="10:15" data-content="event-7" data-event="event-7">
                            <a href="#0">
                                <em class="event-name">학술대회</em>
                            </a>
                        </li>

                        <li class="single-event" data-start="10:45" data-end="11:45" data-content="event-8" data-event="event-8">
                            <a href="#0">
                                <em class="event-name">특강</em>
                            </a>
                        </li>

                        <li class="single-event" data-start="12:00" data-end="13:45" data-content="event-9" data-event="event-9">
                            <a href="#0">
                                <em class="event-name">팀 프로젝트</em>
                            </a>
                        </li>

                        <li class="single-event" data-start="13:45" data-end="15:00" data-content="event-10" data-event="event-10">
                            <a href="#0">
                                <em class="event-name">스터디 그룹</em>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="events-group">
                    <div class="top-info"><span>목요일</span></div>

                    <ul>
                        <li class="single-event" data-start="10:00" data-end="11:00" data-content="event-11" data-event="event-11">
                            <a href="#0">
                                <em class="event-name">실험실 미팅</em>
                            </a>
                        </li>

                        <li class="single-event" data-start="11:30" data-end="13:00" data-content="event-12" data-event="event-12">
                            <a href="#0">
                                <em class="event-name">발표</em>
                            </a>
                        </li>

                        <li class="single-event" data-start="13:30" data-end="15:00" data-content="event-13" data-event="event-13">
                            <a href="#0">
                                <em class="event-name">연구 토론</em>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="events-group">
                    <div class="top-info"><span>금요일</span></div>

                    <ul>
                        <li class="single-event" data-start="09:30" data-end="11:00" data-content="event-14" data-event="event-14">
                            <a href="#0">
                                <em class="event-name">회의 전화</em>
                            </a>
                        </li>

                        <li class="single-event" data-start="11:30" data-end="13:00" data-content="event-15" data-event="event-15">
                            <a href="#0">
                                <em class="event-name">회의</em>
                            </a>
                        </li>

                        <li class="single-event" data-start="13:30" data-end="15:00" data-content="event-16" data-event="event-16">
                            <a href="#0">
                                <em class="event-name">세미나</em>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="events-group">
                    <div class="top-info"><span>토요일</span></div>
                    <ul>
                        <!-- 토요일에 대한 학사일정 추가 -->
                    </ul>
                </li>

                <li class="events-group">
                    <div class="top-info"><span>일요일</span></div>
                    <ul>
                        <!-- 일요일에 대한 학사일정 추가 -->
                    </ul>
                </li>
            </ul>
        </div>

        <div class="event-modal">
            <header class="header">
                <div class="content">
                    <span class="event-date"></span>
                    <h3 class="event-name"></h3>
                </div>

                <div class="header-bg"></div>
            </header>

            <div class="body">
                <div class="event-info"></div>
                <div class="body-bg"></div>
            </div>

            <a href="#0" class="close">닫기</a>
        </div>

        <div class="cover-layer"></div>
    </div> <!-- .cd-schedule -->

    <script src="../pageSetUp/gangSchedule.js"></script>
</body>
</html>
