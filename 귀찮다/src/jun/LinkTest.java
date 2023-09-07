package jun;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LinkTest {
    public static void main(String[] args) {
        String dbUrl = "jdbc:mysql://localhost:3306/gwanlee?serverTimezone=UTC";
        String dbUsername = "pid";
        String dbPassword = "1234";

        try {
            // 1. JDBC 드라이버 로딩
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 2. 데이터베이스 연결
            Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

            // 3. SQL 쿼리 작성
            String query = "SELECT * FROM employee";
 
            // 4. SQL 쿼리 실행
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();

            // 5. 결과 처리
            while (resultSet.next()) {
                int employeeId = resultSet.getInt("no");
                String employeePw = resultSet.getString("pw");
                String employeeName = resultSet.getString("name");
                
                System.out.println("Employee ID: " + employeeId);
                System.out.println("PW: " + employeePw);
                System.out.println("Name: " + employeeName);
            }

            // 6. 연결 및 리소스 닫기
            resultSet.close();
            statement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}

