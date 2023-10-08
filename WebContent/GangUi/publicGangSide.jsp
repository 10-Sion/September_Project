<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<% String contextPath = request.getContextPath(); %>
<div id="accordian">
            <ul class="show-dropdown main-navbar">
            
                <div class="selector-active">
                	<div class="top"></div>
                	<div class="bottom"></div>
                </div>
                <li onclick="loadPage('<%=contextPath%>/Lecture/LectureList.do')">
                    <a href="javascript:void(0);">
                    <i class="fas fa-tachometer-alt">
                    </i>강의 목록</a>
                </li>
                <li onclick="loadPage('pubGangSub2.jsp')">
                    <a href="javascript:void(0);">
                    <i class="far fa-address-book">
                    </i>신청한 강의</a>
                </li>
                
                <li onclick="loadPage('../QnA/list.jsp')">
                    <a href="javascript:void(0);">
                    <i class="far fa-chart-bar">
                    </i>Q&A 게시판</a>
                </li>
                <li class="active" >
                    <a href="gangMain.jsp">
                    <i class="far fa-copy">
                    </i>학사관리시스템 메인</a>
                </li>

            </ul>
        </div>
