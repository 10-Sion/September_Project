<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과</title>
<script>
    function redirectToMain() {
        window.location.href = "main/stu_main.html"; // 로그인 성공 시 이동할 페이지 URL을 설정
    }
</script>
</head>
<body>
<%
    // 데이터베이스 연결 설정
    String url = "jdbc:mysql://localhost:3306/GwanLee";
    String i_id = "pid";
    String i_pw = "1234";
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // DB 연결
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, i_id, i_pw);

        // 사용자로부터 입력받은 고유번호와 비밀번호
        String uniqueId = request.getParameter("no");
        String userPassword = request.getParameter("pw");

        // 학생 테이블에서 고유번호와 비밀번호 검색
        String studentSql = "SELECT * FROM Student WHERE stu_no = ? AND pw = ?";
        pstmt = conn.prepareStatement(studentSql);
        pstmt.setInt(1, Integer.parseInt(uniqueId));
        pstmt.setString(2, userPassword);

        ResultSet studentRs = pstmt.executeQuery(); // 학생 결과

        // 직원 테이블에서 고유번호와 비밀번호 검색
        String employeeSql = "SELECT * FROM Employee WHERE emp_no = ? AND pw = ?";
        pstmt = conn.prepareStatement(employeeSql);
        pstmt.setInt(1, Integer.parseInt(uniqueId));
        pstmt.setString(2, userPassword);

        ResultSet employeeRs = pstmt.executeQuery(); // 직원 결과

        // 교수 테이블에서 고유번호와 비밀번호 검색
        String professorSql = "SELECT * FROM Professor WHERE Pro_no = ? AND pw = ?";
        pstmt = conn.prepareStatement(professorSql);
        pstmt.setInt(1, Integer.parseInt(uniqueId));
        pstmt.setString(2, userPassword);

        ResultSet professorRs = pstmt.executeQuery(); // 교수 결과

        // 로그인 성공 여부 확인
        if (studentRs.next() || employeeRs.next() || professorRs.next()) {
    %>
    
    <script>
        redirectToMain(); // 로그인 성공 시 메인 페이지로 이동
    </script>

    <%
    } else {
        // 개인 정보를 찾을 수 없거나 고유번호와 비밀번호가 일치하지 않는 경우에 대한 처리
    %>

    <h1>로그인 실패</h1>
    <p>입력한 고유번호 또는 비밀번호가 올바르지 않습니다.</p>

    <%
    }
  } catch (Exception e) {
      e.printStackTrace();
  } finally {
      // DB 연결 해제
      if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
      if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
      if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
  }
%>

</body>
</html>