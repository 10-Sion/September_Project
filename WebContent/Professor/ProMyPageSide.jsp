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
                <li onclick="loadPage('MyInfoProfessor.jsp')" class="active">
                    <a href="javascript:void(0);">
                    <i class="far fa-address-book">
                    </i>나의 정보</a>
                </li>
                <li>
                    <a href="../GangUi/gangMain.jsp">
                    <i class="far fa-copy">
                    </i>학사관리시스템 메인</a>
                </li>

            </ul>
        </div>
        