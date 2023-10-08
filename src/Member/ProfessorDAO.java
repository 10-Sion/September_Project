package Member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProfessorDAO {
    // 교수 로그인 체크 메서드
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
           
            // 교수 테이블에서 고유번호와 비밀번호 검색
            String professorSql = "SELECT * FROM Professor WHERE Pro_no = ? AND pw = ?";
            pstmt = conn.prepareStatement(professorSql);
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
        return result;
    }
    
    	// 교수 이름 가져오기 메서드
    	public String getProfessorName(int uniqueId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String name = null; // 교수 이름을 저장할 변수

        try {
            // 데이터베이스 연결 설정
            String url = "jdbc:mysql://localhost:3306/GwanLee?serverTimezone=UTC";
            String i_id = "pid";
            String i_pw = "1234";

            // DB 연결
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, i_id, i_pw);

            // 교수 테이블에서 고유번호로 이름 검색
            String professorSql = "SELECT name FROM Professor WHERE Pro_no = ?";
            pstmt = conn.prepareStatement(professorSql);
            pstmt.setInt(1, uniqueId);

            rs = pstmt.executeQuery();

            // 교수 이름 가져오기
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

        return name; // 교수 이름 반환
    }
}
