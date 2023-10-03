<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
    <link rel="stylesheet" href="../pageSetUp/gangMainStyle.css"> 
    <title>강의 메인</title>
</head>
<body>
    <section class="hero-section">
        <div class="card-grid">
            <a class="card" href="publicGangMain.jsp">
                <div class="card__background" style="background-image: url(../pageSetUp/img/강의실1.jpg)"></div>
                <div class="card__content">
                    <p class="card__category">강의</p>
                    <h3 class="card__heading">공통 강의실 페이지</h3>
                </div>
            </a>
            <a class="card" href="privateGangMain.jsp">
                <div class="card__background" style="background-image: url(../pageSetUp/img/강의실2.jpg)"></div>
                <div class="card__content">
                    <p class="card__category">강의</p>
                    <h3 class="card__heading">개인 강의실 페이지</h3>
                </div>
            </a>
            <a class="card" href="../Employee/empMain.jsp">
                <div class="card__background" style="background-image: url(../pageSetUp/img/마이페이지.jpg)"></div>
                <div class="card__content">
                    <p class="card__category">개인</p>
                    <h3 class="card__heading">마이 페이지</h3>
                </div>
            </a>
            <a class="card" href="../page/main/MainPage.jsp">
                <div class="card__background" style="background-image: url(../pageSetUp/img/돌아가기.jpg)"></div>
                <div class="card__content">
                    <p class="card__category">돌아가기</p>
                    <h3 class="card__heading">메인 페이지로</h3>
                </div>
            </a>
        </div>
    </section>
</body>
</html>
