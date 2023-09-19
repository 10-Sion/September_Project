package last;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBtest {
    public static void main(String[] args) {
        String jdbcUrl = "jdbc:mysql://localhost:3306/gwanlee?serverTimezone=UTC";
        String dbUser = "pid";
        String dbPassword = "1234";

        try {
            // JDBC 드라이버 로드
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 데이터베이스 연결
            Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            if (connection != null) {
                System.out.println("데이터베이스 연결 성공!");
                // 여기에서 추가적인 작업을 수행할 수 있습니다.
                connection.close(); // 연결 닫기
            } else {
                System.out.println("데이터베이스 연결 실패.");
            }
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC 드라이버 로드 실패: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("데이터베이스 연결 실패: " + e.getMessage());
        }
    }
}
