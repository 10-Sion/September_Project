package jun_notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	public static final String DB_URL = "jdbc:mysql://localhost:3306/gwanlee?serverTimezone=UTC";
    public static final String DB_USERNAME = "pid";
    public static final String DB_PASSWORD = "1234";

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("org.hsqldb.jdbcDriver");
            connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
            
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            
        }
        return connection;
    }
}