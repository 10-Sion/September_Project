package last;

import javax.sql.DataSource;
import com.mysql.cj.jdbc.MysqlDataSource;

public class DatabaseConfig {
    public static final String DB_URL = "jdbc:mysql://localhost:3306/gwanlee?serverTimezone=UTC";
    public static final String DB_USERNAME = "pid";
    public static final String DB_PASSWORD = "1234";

    public static DataSource getDataSource() {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setURL(DB_URL);
        dataSource.setUser(DB_USERNAME);
        dataSource.setPassword(DB_PASSWORD);
        return dataSource;
    }
}

