<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	            <li><a href="#tab-3" tab-id="3">추천 DOOR</a></li>
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
	                <li><a href="#">공지사항 1</a></li>
	                <li><a href="#">공지사항 2</a></li>
	                <li><a href="#">공지사항 3</a></li>
	                <li><a href="#">공지사항 4</a></li>
	                <li><a href="#">공지사항 5</a></li>
	            </ul>
	        </div>
	        <div class="tab" tab-id="2">
	            <!-- 신규 DOOR 컨텐츠 -->
	            <div class="door-content">
	                <div class="door-item">
	                    <img src="thumbnail1.jpg" alt="Thumbnail 1">
	                    <a href="#">신규 DOOR 1</a>
	                </div>
	                <div class="door-item">
	                    <img src="thumbnail2.jpg" alt="Thumbnail 2">
	                    <a href="#">신규 DOOR 2</a>
	                </div>
	                <div class="door-item">
	                    <img src="thumbnail3.jpg" alt="Thumbnail 3">
	                    <a href="#">신규 DOOR 3</a>
	                </div>
	                <div class="door-item">
	                    <img src="thumbnail4.jpg" alt="Thumbnail 4">
	                    <a href="#">신규 DOOR 4</a>
	                </div>
	                <div class="door-item">
	                    <img src="thumbnail5.jpg" alt="Thumbnail 5">
	                    <a href="#">신규 DOOR 5</a>
	                </div>
	            </div>
	        </div>
	        <div class="tab" tab-id="3">
	            <!-- 추천 DOOR 컨텐츠 -->
	            <div class="door-content">
	                <div class="door-item">
	                    <img src="thumbnail1.jpg" alt="Thumbnail 1">
	                    <a href="#">추천 DOOR 1</a>
	                </div>
	                <div class="door-item">
	                    <img src="thumbnail2.jpg" alt="Thumbnail 2">
	                    <a href="#">추천 DOOR 2</a>
	                </div>
	                <div class="door-item">
	                    <img src="thumbnail3.jpg" alt="Thumbnail 3">
	                    <a href="#">추천 DOOR 3</a>
	                </div>
	                <div class="door-item">
	                    <img src="thumbnail4.jpg" alt="Thumbnail 4">
	                    <a href="#">추천 DOOR 4</a>
	                </div>
	                <div class="door-item">
	                    <img src="thumbnail5.jpg" alt="Thumbnail 5">
	                    <a href="#">추천 DOOR 5</a>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>


	<script src="js/contentAnimate.js"></script>
</body>
</html>
