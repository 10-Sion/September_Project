package real_jjin_mak;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EmployeeModel {
	public Employee getEmployeeById(int empId) {
	    Employee employee = null;
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet resultSet = null;

	    try {
	        // 데이터베이스 연결
	        connection = DriverManager.getConnection(DatabaseConfig.DB_URL, DatabaseConfig.DB_USERNAME, DatabaseConfig.DB_PASSWORD);

	        // SQL 쿼리 작성
	        String sql = "SELECT * FROM employee WHERE emp_no=?";
	        preparedStatement = connection.prepareStatement(sql);
	        preparedStatement.setInt(1, empId);

	        // 쿼리 실행 및 결과 가져오기
	        resultSet = preparedStatement.executeQuery();

	        // 결과를 Employee 객체로 매핑
	        if (resultSet.next()) {
	            employee = new Employee();
	            employee.setEmpNo(resultSet.getInt("emp_no"));
	            employee.setName(resultSet.getString("name"));
	            // 나머지 필드도 가져와서 설정
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // 리소스 해제
	        try {
	            if (resultSet != null) resultSet.close();
	            if (preparedStatement != null) preparedStatement.close();
	            if (connection != null) connection.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return employee; // null이 아닌 경우에만 반환
	}

}
