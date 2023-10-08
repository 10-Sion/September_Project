package Member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//StudentDAO.java
public class StudentDAO {
 // 학생 로그인 체크 메서드
 public boolean checkLogin(int uniqueId, String userPassword) {
     Connection conn = null;
     PreparedStatement pstmt = null;
     ResultSet rs = null;
     boolean result = false;

     try {
         // 데이터베이스 연결 설정
         String url = "jdbc:mysql://localhost:3306/GwanLee?serverTimezone=UTC";
         String i_id = "pid";
         String i_pw = "1234";

         // DB 연결
         Class.forName("com.mysql.cj.jdbc.Driver");
         conn = DriverManager.getConnection(url, i_id, i_pw);

         // 학생 테이블에서 고유번호와 비밀번호 검색
         String studentSql = "SELECT * FROM Student WHERE stu_no = ? AND pw = ?";
         pstmt = conn.prepareStatement(studentSql);
         pstmt.setInt(1, uniqueId);
         pstmt.setString(2, userPassword);

         rs = pstmt.executeQuery();

         // 로그인 성공 여부 확인
         result = rs.next();
         
     } catch (Exception e) {
         e.printStackTrace();
     } finally {
         // DB 연결 해제
         if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
         if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
         if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
     }
  
     return result; // 학생 로그인 성공 여부 반환
 }
 

	    // 학생 이름 가져오기 메서드
	    public String getStudentName(int uniqueId) {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        String name = null; // 학생 이름을 저장할 변수

	        try {
	            // 데이터베이스 연결 설정
	            String url = "jdbc:mysql://localhost:3306/GwanLee?serverTimezone=UTC";
	            String i_id = "pid";
	            String i_pw = "1234";

	            // DB 연결
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            conn = DriverManager.getConnection(url, i_id, i_pw);

	            // 학생 테이블에서 고유번호로 이름 검색
	            String studentSql = "SELECT name FROM Student WHERE stu_no = ?";
	            pstmt = conn.prepareStatement(studentSql);
	            pstmt.setInt(1, uniqueId);

	            rs = pstmt.executeQuery();

	            // 학생 이름 가져오기
	            if (rs.next()) {
	                name = rs.getString("name");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            // DB 연결 해제
	            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
	            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
	            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
	        }

	        return name; // 학생 이름 반환
	    }
}
