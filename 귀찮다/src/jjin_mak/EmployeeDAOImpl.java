package jjin_mak;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAOImpl implements EmployeeDAO{

	@Override
	public List<Employee> getAllEmployees() throws SQLException {
		
	    List<Employee> employees = new ArrayList<>();
	    Connection connection = null;
	    PreparedStatement statement = null;
	    ResultSet resultSet = null;

	    try {
	        // 데이터베이스 연결
	        connection = DriverManager.getConnection(DatabaseConfig.DB_URL, DatabaseConfig.DB_USERNAME, DatabaseConfig.DB_PASSWORD);
	        
	        // SQL 쿼리 작성
	        String query = "SELECT emp_no, name, phone, email FROM employee";
	        
	        // PreparedStatement 생성
	        statement = connection.prepareStatement(query);
	        
	        // 쿼리 실행 및 결과 얻기
	        resultSet = statement.executeQuery();

	        // 결과 처리
	        while (resultSet.next()) {
	            int empNo = resultSet.getInt("emp_no");
	            String name = resultSet.getString("name");
	            String phone = resultSet.getString("phone");
	            String email = resultSet.getString("email");

	            Employee employee = new Employee();
	            employee.setEmpNo(empNo);
	            employee.setName(name);
	            employee.setPhone(phone);
	            employee.setEmail(email);

	            employees.add(employee);
	            
	        }
	    } finally {
	        // 리소스 닫기
	        if (resultSet != null) {
	            resultSet.close();
	        }
	        if (statement != null) {
	            statement.close();
	        }
	        if (connection != null) {
	            connection.close();
	        }
	    }

	    return employees;
	}


	@Override
	public Employee getEmployeeByEmpNo(int empNo) throws SQLException {
		
	    Employee employee = null;
	    Connection connection = null;
	    PreparedStatement statement = null;
	    ResultSet resultSet = null;

	    try {
	        // 데이터베이스 연결
	        connection = DriverManager.getConnection(DatabaseConfig.DB_URL, DatabaseConfig.DB_USERNAME, DatabaseConfig.DB_PASSWORD);
	        
	        // SQL 쿼리 작성
	        String query = "SELECT emp_no, pw, name, addr, phone, tel, email FROM employee WHERE emp_no = ?";
	        
	        // PreparedStatement 생성
	        statement = connection.prepareStatement(query);
	        statement.setInt(1, empNo); // 직원 번호 파라미터 설정
	        
	        // 쿼리 실행 및 결과 얻기
	        resultSet = statement.executeQuery();

	        // 결과 처리
	        if (resultSet.next()) {
	        	
	            int empNumber = resultSet.getInt("emp_no");
	            String name = resultSet.getString("name");
	            String addr = resultSet.getString("addr");
	            String phone = resultSet.getString("phone");
	            String tel = resultSet.getString("tel");
	            String email = resultSet.getString("email");

	            employee = new Employee();
	            employee.setEmpNo(empNumber);
	            employee.setName(name);
	            employee.setAddr(addr);
	            employee.setPhone(phone);
	            employee.setTel(tel);
	            employee.setEmail(email);
	        }
	    } finally {
	        // 리소스 닫기
	        if (resultSet != null) {
	            resultSet.close();
	        }
	        if (statement != null) {
	            statement.close();
	        }
	        if (connection != null) {
	            connection.close();
	        }
	    }

	    return employee;
	}


	
}
