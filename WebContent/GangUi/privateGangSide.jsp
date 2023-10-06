<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%
	String contextPath = request.getContextPath();
%>
<div id="accordian">
            <ul class="show-dropdown main-navbar">
            
                <div class="selector-active">
                	<div class="top"></div>
                	<div class="bottom"></div>
                </div>
                <li onclick="loadPage('privGangSub1.jsp')">
                    <a href="javascript:void(0);">
                    <i class="fas fa-tachometer-alt">
                    </i>강의실</a>
                </li>
                <li onclick="loadPage('privGangSub2.jsp')">
                    <a href="javascript:void(0);">
                    <i class="far fa-address-book">
                    </i>수업 활동</a>
                </li>
                <li onclick="loadPage('privGangSub3.jsp')">
                    <a href="javascript:void(0);">
                    <i class="far fa-clone">
                    </i>강의 관리</a>
                </li>
                <li onclick="loadPage('privGangSub4.jsp')">
                    <a href="javascript:void(0);">
                    <i class="far fa-calendar-alt">
                    </i>공지사항</a>
                </li>
                <li onclick="loadPage('privGangSub5.jsp')">
                    <a href="javascript:void(0);">
                    <i class="far fa-chart-bar">
                    </i>Q&A 게시판</a>
                </li>
                <li onclick="loadServletData('<%=contextPath%>/Report/ReportList.do')">
                    <a href="javascript:void(0);">
                    <i class="far fa-copy">
                    </i>과제 게시판</a>
                </li>
                <li  class="active">
                    <a href="gangMain.jsp">
                    <i class="far fa-copy">
                    </i>학사관리시스템 메인</a>
                </li>

            </ul>
        </div>