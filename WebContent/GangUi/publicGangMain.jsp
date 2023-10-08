<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../pageSetUp/gangSubStyle.css">
    <link rel="stylesheet" href="../pageSetUp/mainTopStyle.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <title>공용 강의실 메인 페이지</title>
</head>
<body>
	
    <div class="container">

    
        <!-- 왼쪽 사이드바 -->
        <div class="left_sidebar">
            <jsp:include page="publicGangSide.jsp" />
        </div>

        <!-- 메인 콘텐츠 영역 (개인 강의실 내용) -->
        <div class="main_content">
            
            
            <div class="base_content">
                <div id="arlina">
                  <div id="header">
                    <h1>Univ News</h1></br>
                    <p>AAAA BBBB CCCC</div>
                  <div id="menu"></div>
                  <div id="content">
                <div class='ticker-wrap' data-domain='www.halosehat.xyz'>
                <div id='ticker'>
                </div>
                </div>
                    <div id="main">
                        <div id="box" class="news-box">
                          <!-- 첫 번째 뉴스 -->
                          <h3>첫 번째 뉴스 제목</h3>
                          <p>첫 번째 뉴스 내용...</p>
                        </div>
                        <div id="box" class="news-box">
                          <!-- 두 번째 뉴스 -->
                          <h3>두 번째 뉴스 제목</h3>
                          <p>두 번째 뉴스 내용...</p>
                        </div>
                        <div id="box" class="news-box">
                          <!-- 두 번째 뉴스 -->
                          <h3>두 번째 뉴스 제목</h3>
                          <p>두 번째 뉴스 내용...</p>
                        </div>
                        <div id="box" class="news-box">
                          <!-- 두 번째 뉴스 -->
                          <h3>두 번째 뉴스 제목</h3>
                          <p>두 번째 뉴스 내용...</p>
                        </div>
                        <div id="box" class="news-box">
                          <!-- 두 번째 뉴스 -->
                          <h3>두 번째 뉴스 제목</h3>
                          <p>두 번째 뉴스 내용...</p>
                        </div>
                        <div id="box" class="news-box">
                          <!-- 두 번째 뉴스 -->
                          <h3>두 번째 뉴스 제목</h3>
                          <p>두 번째 뉴스 내용...</p>
                        </div>

                      </div>
                      <div id="side">
                        <div id="sidecontent2" class="cf">
                          <span>Widget 1</span>
                        </div>
                        <div id="sidecontent2" class="cf">
                          <span>Widget 2</span>
                        </div>
                        <div id="sidecontent2" class="cf">
                          <span>Widget 3</span>
                        </div>
                        <div id="sidecontent">
                          <span>Widget 4</span>
                        </div>
                      </div>
                    </div>
                    <div id="footer" class="cf"></div>

                  </div>

                
                <div class='back-to-top' id='back-to-top' title='Back to top'><i class='fa fa-chevron-up' /></div>
            </div>
            
              <div class="table">
                <!-- 불러올 페이지 동적 처리함 -->
              </div>
            
            
            
        </div>
    </div>
    
    <script src="../pageSetUp/gangSubApp.js"></script>
    <script src="../pageSetUp/myPage.js"></script>
</body>
</html>
