package jun;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EmployeeDAOImpl implements EmployeeDAO{

	private static final String DB_URL = "jdbc:mysql://localhost:3306/GwanLee";
	private static final String DB_USERNAME = "pid";
	private static final String DB_PASSWORD = "1234";
	
	private Connection connection;
	
	public EmployeeDAOImpl(Connection connection) {
		this.connection = connection;
		
	}
	
	@Override
	public Employee getEmployeeByNo(int no) {
		Employee employee = null;
		String query = "SELECT * FROM Employee WHERE no =?";
		
		try(PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setInt(1, no);
			ResultSet resultSet = statement.executeQuery();
			
			if (resultSet.next()) {
				employee = new Employee();
				
				employee.setNo(resultSet.getInt("no"));
                employee.setPassword(resultSet.getString("pw"));
                employee.setName(resultSet.getString("name"));
                employee.setAddress(resultSet.getString("addr"));
                employee.setPhone(resultSet.getString("phone"));
                employee.setTelephone(resultSet.getString("tel"));
                employee.setEmail(resultSet.getString("email"));

                resultSet.close();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		
		return employee;
	}

	@Override
	public void updateEmployee(Employee employee) {
		String query = "UPDATE Employee SET pw = ?, name = ?, addr = ?, phone = ?, tel = ?, email = ? WHERE no = ?";
		
		try(PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setString(1, employee.getPassword());
			statement.setString(2, employee.getName());
			statement.setString(3, employee.getAddress());
			statement.setString(4, employee.getPhone());
			statement.setString(5, employee.getTelephone());
			statement.setString(6, employee.getEmail());
			statement.setInt(7, employee.getNo());
			
			statement.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
	}

	@Override
	public void deleteEmployee(int no) {
		 String query = "DELETE FROM Employee WHERE no = ?";
		 
		 try(PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setInt(1, no);
			
			statement.executeUpdate();
			 
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		
	}

	public static String getDbUrl() {
		return DB_URL;
	}

	public static String getDbUsername() {
		return DB_USERNAME;
	}

	public static String getDbPassword() {
		return DB_PASSWORD;
	}

}
