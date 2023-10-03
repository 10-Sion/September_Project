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
	
    <div class="total_container">
    	<div class="top">
    		<jsp:include page="../page/main/mainTop.jsp" />
    	</div>
    
        <!-- 왼쪽 사이드바 (공용 강의실 링크 포함) -->
        <div class="left_sidebar">
            <jsp:include page="publicGangSide.jsp" />
        </div>

        <!-- 메인 콘텐츠 영역 (전체 강의 목록 표시) -->
        <div class="main_content">

			<table class="container">
				<thead>
					<tr>
						<th><h1>Sites</h1></th>
						<th><h1>Views</h1></th>
						<th><h1>Clicks</h1></th>
						<th><h1>Average</h1></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Google</td>
						<td>9518</td>
						<td>6369</td>
						<td>01:32:50</td>
					</tr>
					<tr>
						<td>Twitter</td>
						<td>7326</td>
						<td>10437</td>
						<td>00:51:22</td>
					</tr>
					<tr>
						<td>Amazon</td>
						<td>4162</td>
						<td>5327</td>
						<td>00:24:34</td>
					</tr>
			    <tr>
						<td>LinkedIn</td>
						<td>3654</td>
						<td>2961</td>
						<td>00:12:10</td>
					</tr>
			    <tr>
						<td>CodePen</td>
						<td>2002</td>
						<td>4135</td>
						<td>00:46:19</td>
					</tr>
			    <tr>
						<td>GitHub</td>
						<td>4623</td>
						<td>3486</td>
						<td>00:31:52</td>
					</tr>
				</tbody>
			</table>
        </div>
    </div>
    
    <script src="../pageSetUp/gangSubApp.js"></script>
</body>
</html>
