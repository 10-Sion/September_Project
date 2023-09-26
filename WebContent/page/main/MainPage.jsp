<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Main Page</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
	<link href="css/bottom.css" rel="stylesheet">
  </head>
  <body>
  
	<%
	String contextPath = request.getContextPath();
	//LoginServlet에서  세션에 로그인한 사람의 고유번호를 아래 줄과 같이 저장 했었습니다.
    //session.setAttribute("uniqueId", uniqueId);
	
	// 세션에서 uniqueId 값을 가져옴
    Integer uniqueId = (Integer) session.getAttribute("uniqueId");
	
	out.println("uniqueId: " + uniqueId); // uniqueId 값을 출력
	
    if (uniqueId != null) {
    %>
    
    	<button type = "button" > 로그 아웃</button>
    
    <%
	    // 여기서 userId를 사용하여 필요한 작업 수행 가능
	} else {
	    // 세션 없거나 사용자 정보가 없는 경우의 처리
	    // 예: 로그인하지 않은 사용자 처리
	}
	%>
	
<script>
function redirectToMyPage(uniqueId) {
    var redirectURL = "";

    if (uniqueId >= 0 && uniqueId <= 1000) {
        // 교직원의 경우
        redirectURL = "../../Employee/empMain.jsp";
    } else if (uniqueId >= 1001 && uniqueId <= 2000) {
        // 교수의 경우
        redirectURL = "../../Professor/proMain.jsp";
    } else if (uniqueId >= 2001 && uniqueId <= 9999) {
        // 학생의 경우
        redirectURL = "../../Student/stuMain.jsp";
    } else {
        // 그 외의 경우
        redirectURL = "../../LecturePro/index.jsp"; // 혹은 다른 처리를 원하는 페이지로 이동
    }

    window.location.href = redirectURL; // JavaScript를 사용하여 페이지 이동
}
</script>
  
<header>


<div class="navigation">
		<a href="#" class="menuItem">DOOR</a>
		<a href="#" class="menuItem">강의실</a>
		<a href="#" class="menuItem">공지사항</a>
		<!-- uniqueId를 사용하여 My page로 이동하는 함수 호출 -->
        <a href="#" class="menuItem" onclick="redirectToMyPage('<%= uniqueId %>')">마이페이지</a>
</div>

</header>





    <div class="container-fluid" _msthidden="18">
	<div class="row" _msthidden="18">
		<div class="col-md-12" _msthidden="18">
			
			<br>
			
			<div class="carousel slide" id="carousel-280553" _msthidden="11">
				<ol class="carousel-indicators">
					<li data-slide-to="0" data-target="#carousel-280553" class="active">
					</li>
					<li data-slide-to="1" data-target="#carousel-280553">
					</li>
					<li data-slide-to="2" data-target="#carousel-280553">
					</li>
				</ol>
				<div class="carousel-inner" _msthidden="9">
					<div class="carousel-item active" _msthidden="3">
						<img class="d-block w-100" alt="캐러셀 부트스트랩 퍼스트" src="image/ryan-jacobson-cXUOQWdRV4I-unsplash.jpg" _msthidden="A" _mstalt="87807538" _msthash="490">
						<div class="carousel-caption" _msthidden="2">
							<h4 _msttexthash="63536889" _msthidden="1" _msthash="491">
								첫 번째 썸네일 레이블
							</h4>
							<p _msttexthash="13761176" _msthidden="1" _msthash="492">
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="carousel-item" _msthidden="3">
						<img class="d-block w-100" alt="캐러셀 부트스트랩 두 번째" src="image/priscilla-du-preez-ggeZ9oyI-PE-unsplash.jpg" _msthidden="A" _mstalt="85431086" _msthash="493">
						<div class="carousel-caption" _msthidden="2">
							<h4 _msttexthash="62969504" _msthidden="1" _msthash="494">
								두 번째 썸네일 레이블
							</h4>
							<p _msttexthash="13761176" _msthidden="1" _msthash="495">
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="carousel-item" _msthidden="3">
						<img class="d-block w-100" alt="캐러셀 부트스트랩 서드" src="image/dom-fou-YRMWVcdyhmI-unsplash.jpg" _msthidden="A" _mstalt="74234810" _msthash="496">
						<div class="carousel-caption" _msthidden="2">
							<h4 _msttexthash="63270168" _msthidden="1" _msthash="497">
								세 번째 썸네일 레이블
							</h4>
							<p _msttexthash="13761176" _msthidden="1" _msthash="498">
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
				</div> <a class="carousel-control-prev" href="#carousel-280553" data-slide="prev" _msthidden="1"><span class="carousel-control-prev-icon"></span> <span class="sr-only" _msttexthash="15942420" _msthidden="1" _msthash="499">이전의</span></a> <a class="carousel-control-next" href="#carousel-280553" data-slide="next" _msthidden="1"><span class="carousel-control-next-icon"></span> <span class="sr-only" _msttexthash="9473516" _msthidden="1" _msthash="500">다음</span></a>
			</div>
			
		</div>
	</div>
</div>


<!-- 하단 화면 -->





<footer>
<address>
<strong>Twitter, Inc.</strong><br /> 795 Folsom Ave, Suite 600 San Francisco, CA 94107 P: (123) 456-7890
</address>

</footer>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
  </body>
</html>