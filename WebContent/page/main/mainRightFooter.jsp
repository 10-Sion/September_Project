<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Notices.NoticesMgr"%>
<%@page import="Notices.NoticesBean"%>

<%@page import="java.util.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@page import="Notices.DBConnectionMgr" %>

<%@ page import="jun_chamgo.DatabaseConfig" %>
<%@ page import="jun_chamgo.SubjectInfoDAO" %>

<%
// DataSource 생성
DataSource dataSource = DatabaseConfig.getDataSource();

// WeekInfoDAO 객체 생성
jun_chamgo.WeekInfoDAO weekInfoDAO = new jun_chamgo.WeekInfoDAO(dataSource);

// WeekInfo 데이터 가져오기
List<jun_chamgo.WeekInfo> recentWeekInfo = weekInfoDAO.getRecentWeekInfo(4);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="css/bottom.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<div class="tabs">
	    <div class="tabs-header">
	        <ul>
	            <li class="active"><a href="#tab-1" tab-id="1">공지사항</a></li>
	            <li><a href="#tab-2" tab-id="2">신규 DOOR</a></li>
	            <li><a href="#tab-3" tab-id="3">신설 강의</a></li>
	        </ul>
	        <!-- 버튼  -->
	        <nav class="tabs-nav">
	            <i id="prev" class="material-icons" ripple ripple-color="#FFF">&#xE314;</i>
	            <i id="next" class="material-icons" ripple ripple-color="#FFF">&#xE315;</i>
	        </nav>
	    </div>
	
	    <div class="tabs-content">
	        <div class="tab active" tab-id="1">
	            <!-- 공지사항 컨텐츠 -->
				<ul>
				    <% 
				    NoticesMgr noticesMgr = new NoticesMgr();
				    Vector<NoticesBean> noticeList = noticesMgr.getsimple(0, 5); // 처음 5개 공지사항 번호와 제목 가져오기
				    for (NoticesBean notice : noticeList) {
				    %>
				    <li><a href="/HakSaGwanLee/Notices/read.jsp?num=<%=notice.getNum()%>"><%= notice.getTitle() %></a></li>
				    <%
				    }
				    %>
				</ul>
				<a  href="../../Notices/list.jsp">자세히 보기</a>

	        </div>
	        
	        <div class="tab" tab-id="2">
	            <!-- 신규 DOOR 컨텐츠 -->
	            <div class="door-content">
	                <%
	                for (jun_chamgo.WeekInfo weekInfo : recentWeekInfo) {
	                    String weekName = weekInfo.getWeekName();
	                    String lectureLink = weekInfo.getLectureLink();
	                %>
	                <div class="door-item">
	                    <img src="thumbnail1.jpg" alt="Thumbnail 1">
	                    <a href="#" class="video-link" data-video-url="<%= lectureLink %>"><%= weekName %></a>
	                </div>
	                <%
	                }
	                %>
	            </div>
	        </div>

	        <div class="tab" tab-id="3">
			    <!-- 신설 강의 컨텐츠 -->
			    <div class="door-content">
			        <%
			        jun_chamgo.SubjectInfoDAO subjectInfoDAO = new jun_chamgo.SubjectInfoDAO(dataSource); // 객체 생성 방식 변경
			        List<String> recentSubjectNames = subjectInfoDAO.getRecentSubjectNames(4); // sub_name 4개 가져옴
			        
			        for (String subName : recentSubjectNames) {
			        %>
			        <div class="door-item">
			            <img src="thumbnail1.jpg" alt="Thumbnail 1">
			            <a href="#"><%= subName %></a> <!-- sub_name 값을 표시 -->
			        </div>
			        <%
			        }
			        %>
			    </div>
			</div>


	        </div>
	    </div>
	</div>


	<script src="js/contentAnimate.js"></script>
	<script src="../../pageSetUp/videoPage.js"></script>
</body>
</html>