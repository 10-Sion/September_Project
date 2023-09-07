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

String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
	 Class.forName("com.mysql.jdbc.Driver");

    String url = "jdbc:mysql://localhost:3306/GwanLee";
	   String id = "pid";
	   String pw = "1234";

    conn = DriverManager.getConnection(url, id, pw);
    pstmt = conn.prepareStatement("SELECT user_id, user_pw, name FROM users WHERE user_id = ?");
    pstmt.setString(1, user_id);
    rs = pstmt.executeQuery();

    if (rs.next()) {
        String dbUserId = rs.getString("user_id");
        String dbUserPw = rs.getString("user_pw");

        if (user_id.equals(dbUserId) && user_pw.equals(dbUserPw)) {
            // 로그인 성공
            session.setAttribute("user_id", rs.getString("user_id"));
            // 로그인 성공 후 메인 페이지로 리디렉션
            response.sendRedirect(request.getContextPath() + "/September_Project/main.jsp");
        } else {
            // 로그인 실패
            // 사용자에게 로그인 실패 메시지를 보여줄 수 있습니다.
        	
        }
        
}} catch (ClassNotFoundException e) {
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