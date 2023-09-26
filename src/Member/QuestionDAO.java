package Member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuestionDAO {
    private String url = "jdbc:mysql://localhost:3306/GwanLee";
    private String i_id = "pid";
    private String i_pw = "1234";
    
 // 데이터베이스 연결을 설정하는 인스턴스 메서드로 변경
    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, i_id, i_pw);
    }

    public List<String> fetchQuestions() {
        List<String> questionList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        

        try {
            // 데이터베이스 연결 설정
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, i_id, i_pw);

            // SQL 쿼리 작성 및 실행...
            String query = "SELECT question_text FROM Questions";
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();
            
            // 결과를 questionList에 추가
            while (rs.next()) {
                String questionText = rs.getString("question_text");
                questionList.add(questionText);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 연결 및 리소스 해제
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return questionList;
    }
} 