<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="test.css">
  <title>Document</title>
</head>

<body>
  <div class="login-form" >
    <form class="form-signin" method="post" action="LoginServlet">       
      <h2 class="form-signin-heading">로그인</h2>
      <input type="text" class="text-field" name="no" placeholder="고유번호" required="" autofocus="" value="<%=request.getParameter("uniqueId")%>" />
      <input type="password" class="text-field" name="pw" placeholder="비밀번호" required=""/>      
      <br><br>
      <button class="submit-btn" type="submit">Login</button>   
    </form>
  </div>
    
</body>

</html>