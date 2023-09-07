<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>


<h1>회원가입</h1>

<form method="post" action="FormPro.jsp">

  <p>직업을 선택하세요:</p>
	    <input type="radio" id="student" name="occupation" value="학생" required>
	    <label for="student">학생</label><br>
	    <input type="radio" id="staff" name="occupation" value="교직원" required>
	    <label for="staff">교직원</label><br>
	    <input type="radio" id="professor" name="occupation" value="교수" required>
	    <label for="professor">교수</label><br><br>
	     
   <table>
   <tr>
      <td class="label"><label for="user_id">아이디 : </label>
      <td class="content"><input id="user_id" name="user_id" type="text" size="20" 
          maxlength="50"  autofocus required>
          
     <tr>
      <td class="label"><label for="user_pw">비밀번호 : </label>
      <td class="content"><input id="user_pw" name="user_pw" type="text" size="20" 
          maxlength="50"  autofocus required>
   <br><br>
    <tr>
      <td class="label"><label for="name">이름 : </label>
      <td class="content"><input id="inamedt" name="name" type="text" size="20" 
          maxlength="50"  autofocus required>
          
      <tr>
      <td class="label"><label for="address">거주지 : </label>
      <td class="content"><input id="address" name="address" type="text" size="20" 
                 maxlength="100"  required>
     
     <tr>
      <td class="label"><label for="phone">연락처 : </label>
      <td class="content"><input id="phone" name="phone" type="text" size="20" 
                 maxlength="10"  required>
                 
    <tr>
      <td class="label"><label for="email">이메일 : </label>
      <td class="content"><input id="email" name="email" type="text" 
          size="20"  maxlength="16" required>
    
  
    <tr>
      <td class="label2" colspan="2"><input type="submit" value="입력완료">
         <input type="reset" value="다시작성">
  </table>
</form>