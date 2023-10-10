<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%
	String contextPath = request.getContextPath();
	Integer session_no = (Integer)session.getAttribute("uniqueId");
%>
<div id="accordian">
            <ul class="show-dropdown main-navbar">
            	<%-- Student 사이드바 에서 사용하기 위한 거시기 경로 수정 --%>
                <div class="selector-active">
                	<div class="top"></div>
                	<div class="bottom"></div>
                </div>
                <li onclick="loadServletData('<%=contextPath%>/stu/selStudnet.do?stu_no=<%=session_no%>')">
                    <a href="javascript:void(0);">
                    <i class="fas fa-tachometer-alt">
                    </i>학생 정보</a>
                </li>
                <li onclick="loadServletData('<%=contextPath%>/stu/stu_Info.do?stu_no=<%=session_no%>')">
                    <a href="javascript:void(0);">
                    <i class="far fa-address-book">
                    </i>내 강의실</a>
                </li>
<!--                 <li onclick="loadPage('stuTable2.jsp')"> -->
<!--                     <a href="javascript:void(0s);"> -->
<!--                     <i class="far fa-clone"> -->
<!--                     </i>강의 관리</a> -->
<!--                 </li> -->
               
                <li onclick="loadServletData('<%=contextPath%>/Report/ReportList.do')">
                    <a href="javascript:void(0);">
                    <i class="far fa-copy">
                    </i>과제 게시판</a>
                </li>
                <li  class="active">
                    <a href="../Student/stuMainGang.jsp">
                    <i class="far fa-copy">
                    </i>학사관리시스템 메인</a>
                </li>

            </ul>
        </div>