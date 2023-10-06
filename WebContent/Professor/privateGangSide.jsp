<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%
	String contextPath = request.getContextPath();
	Integer pro_no = (Integer)session.getAttribute("uniqueId");
%>
<div id="accordian">
            <ul class="show-dropdown main-navbar">
            
                <div class="selector-active">
                	<div class="top"></div>
                	<div class="bottom"></div>
                </div>
                <br>
                <li onclick="loadPage('<%=contextPath%>/Lecture/ProLectureList.do?pro_no=<%=pro_no%>')">
                    <a href="javascript:void(0);">
                    <i class="fas fa-tachometer-alt">
                    </i>강의실</a>
                </li>
                <li onclick="loadPage('MyInfoProfessor.jsp')">
                    <a href="javascript:void(0);">
                    <i class="far fa-address-book">
                    </i>나의 정보</a>
                </li>
                <li onclick="loadPage('InsertSubject.jsp')">
                    <a href="javascript:void(0);">
                    <i class="far fa-clone">
                    </i>수업추가</a>
                </li>
                <li  class="active">
                    <a href="../GangUi/gangMain.jsp">
                    <i class="far fa-copy">
                    </i>학사관리시스템 메인</a>
                </li>

            </ul>
        </div>
        