<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과</title>
</head>
<body>
<%

String name = request.getParameter("name");
String pw = request.getParameter("pw");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    // 데이터베이스 연결 설정
    String url = "jdbc:mysql://localhost:3306/GwanLee";
    String dbUsername = "pid";
    String dbPassword = "1234";

    conn = DriverManager.getConnection(url, dbUsername, dbPassword);

    // 사용자 이름과 비밀번호를 확인하는 SQL 쿼리
    String query = "SELECT name, pw FROM Student WHERE name = ? AND pw = ?" +
                   "UNION " +
                   "SELECT name, pw FROM Employee WHERE name = ? AND pw = ?" +
                   "UNION " +
                   "SELECT name, pw FROM Professor WHERE name = ? AND pw = ?";
    pstmt = conn.prepareStatement(query);
    pstmt.setString(1, name);
    pstmt.setString(2, pw);
    pstmt.setString(3, name);
    pstmt.setString(4, pw);
    pstmt.setString(5, name);
    pstmt.setString(6, pw);

    rs = pstmt.executeQuery();

    if (rs.next()) {
        String dbUserName = rs.getString("name");
        String dbUserPw = rs.getString("pw");

        if (pw.equals(dbUserPw)) {
            // 로그인 성공
            session.setAttribute("name", dbUserName);
            // 로그인 성공 후 메인 페이지로 리디렉션
            response.sendRedirect(request.getContextPath() + "/main.jsp");
        } else {
            // 로그인 실패
            out.println("비밀번호가 일치하지 않습니다.");
        }
    } else {
        // 로그인 실패
        out.println("사용자 이름 또는 비밀번호가 일치하지 않습니다.");
    }
} catch (ClassNotFoundException e) {
    e.printStackTrace();
} catch (SQLException e) {
    e.printStackTrace();
} finally {
    try {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>

</body>
</html>