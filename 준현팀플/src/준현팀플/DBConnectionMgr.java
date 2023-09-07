package 준현팀플;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBConnectionMgr {
    private static DBConnectionMgr instance;
    private Connection connection;

    private DBConnectionMgr() {
        // 데이터베이스 연결 초기화
        String url = "jdbc:mysql://localhost:3306/GwanLee";
        String id = "pid";
        String pw = "1234";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, id, pw);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static DBConnectionMgr getInstance() {
        if (instance == null) {
            instance = new DBConnectionMgr();
        }
        return instance;
    }

    public Connection getConnection() {
        return connection;
    }

    public void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // 추가: 연결을 반환하는 메서드
    public void freeConnection(Connection con, PreparedStatement pstmt) {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}