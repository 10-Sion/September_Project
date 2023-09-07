package jun;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EmployeeDAOImpl implements EmployeeDAO{

	private static final String DB_URL = "jdbc:mysql://localhost:3306/gwanlee?serverTimezone=UTC";
	private static final String DB_USERNAME = "pid";
	private static final String DB_PASSWORD = "1234";
	
	private Connection connection;
	
	public EmployeeDAOImpl(Connection connection) {
		this.connection = connection;
		 
	}
	
	@Override
	public Employee getEmployeeByNo(int no) {
		Employee employee = null;
		String query = "SELECT * FROM employee WHERE no =?";
		
		try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, no);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                employee = new Employee();

                employee.setNo(resultSet.getInt("no"));
                employee.setPw(resultSet.getString("pw"));
                employee.setName(resultSet.getString("name"));
                employee.setAddr(resultSet.getString("addr"));
                employee.setPhone(resultSet.getString("phone"));
                employee.setTel(resultSet.getString("tel"));
                employee.setEmail(resultSet.getString("email"));

                resultSet.close();
            }

        } catch (SQLException e) {
            e.printStackTrace();
            
        } finally {
			try {
				if (connection != null) {
					connection.close();
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return employee;
	}

	@Override
	public void updateEmployee(Employee employee) {
		String query = "UPDATE Employee SET pw = ?, name = ?, addr = ?, phone = ?, tel = ?, email = ? WHERE no = ?";
		
		try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, employee.getPw());
            statement.setString(2, employee.getName());
            statement.setString(3, employee.getAddr());
            statement.setString(4, employee.getPhone());
            statement.setString(5, employee.getTel());
            statement.setString(6, employee.getEmail());
            statement.setInt(7, employee.getNo());

            statement.executeUpdate(); // executeUpdate를 사용하여 업데이트 쿼리를 실행

        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
			try {
				if (connection != null) {
					connection.close();
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
			
		} finally {
			try {
				if (connection != null) {
					connection.close();
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
