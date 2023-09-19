package last;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class EmployeeService {
    // 데이터베이스 연결 관련 코드
    private Connection dbConnection;
    private DataSource dataSource;
    
    public EmployeeService() {
		
	}

    public EmployeeService(DataSource dataSource) {
        this.dataSource = dataSource;
    }



    // Employee 추가
    public void addEmployee(Employee employee) {
    	
    	String sql = "INSERT INTO employee (emp_no, pw, name, addr, phone, tel, email) VALUES (?, ?, ?, ?, ?, ?, ?)";
        
    	try (PreparedStatement statement = dbConnection.prepareStatement(sql)) {
            statement.setInt(1, employee.getEmpNo());
            statement.setString(2, employee.getPw());
            statement.setString(3, employee.getName());
            statement.setString(4, employee.getAddr());
            statement.setString(5, employee.getPhone());
            statement.setString(6, employee.getTel());
            statement.setString(7, employee.getEmail());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            
        }
    }

 // Employee 조회 by ID
    public Employee getEmployeeById(int empNo) {
        if (dataSource == null) {
            // dataSource가 null인 경우 처리
            System.err.println("DataSource is not initialized.");
            return null;
        }
        
        try (Connection dbConnection = dataSource.getConnection()) {
            String sql = "SELECT * FROM employee WHERE emp_no = ?";
        
            try (PreparedStatement statement = dbConnection.prepareStatement(sql)) {
                statement.setInt(1, empNo);
                ResultSet resultSet = statement.executeQuery();
                
                if (resultSet.next()) {
                    return createEmployeeFromResultSet(resultSet);
                }
                
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return null;
    }




    // 모든 Employee 조회
    public List<Employee> getAllEmployees() {
        List<Employee> employees = new ArrayList<>();
        
        String sql = "SELECT * FROM employee";
        
        try (PreparedStatement statement = dbConnection.prepareStatement(sql)) {
            ResultSet resultSet = statement.executeQuery();
            
            while (resultSet.next()) {
                employees.add(createEmployeeFromResultSet(resultSet));
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
            
        }
        return employees;
    }

    // Employee 정보 업데이트
    public void updateEmployee(Employee employee) {
        String sql = "UPDATE employee SET pw = ?, name = ?, addr = ?, phone = ?, tel = ?, email = ? WHERE emp_no = ?";
        
        try (PreparedStatement statement = dbConnection.prepareStatement(sql)) {
            statement.setString(1, employee.getPw());
            statement.setString(2, employee.getName());
            statement.setString(3, employee.getAddr());
            statement.setString(4, employee.getPhone());
            statement.setString(5, employee.getTel());
            statement.setString(6, employee.getEmail());
            statement.setInt(7, employee.getEmpNo());

            statement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



    // Employee 삭제
    public void deleteEmployee(int empNo) {
    	
    	String sql = "DELETE FROM employee WHERE emp_no = ?";
    	
        try (PreparedStatement statement = dbConnection.prepareStatement(sql)) {
            statement.setInt(1, empNo);
            statement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
            
        }
    }
    
    
    // ResultSet에서 Employee 객체 생성
    private Employee createEmployeeFromResultSet(ResultSet resultSet) throws SQLException {
        // ResultSet에서 각 column에 해당하는 데이터를 추출.
        int empNo = resultSet.getInt("emp_no");  // 직원 번호
        String pw = resultSet.getString("pw");    // 비밀번호
        String name = resultSet.getString("name"); // 이름
        String addr = resultSet.getString("addr"); // 주소
        String phone = resultSet.getString("phone"); // 전화번호
        String tel = resultSet.getString("tel");    // 휴대폰번호
        String email = resultSet.getString("email"); // 이메일

        // 추출한 데이터를 사용하여 Employee 객체를 생성하고 반환
        return new Employee(empNo, pw, name, addr, phone, tel, email);
    }

	public void updateEmployee(int empNo, String pw, String name, String addr, String phone, String tel, String email) {
	}

	
	//	테스트
	public static void main(String[] args) {
	    // 데이터베이스 연결 테스트를 위한 메인 메서드
	    DataSource dataSource = DatabaseConfig.getDataSource();
	    EmployeeService employeeService = new EmployeeService(dataSource);

	    // 데이터베이스 연결 테스트
	    testDatabaseConnection(employeeService);

	    // emp_no가 3인 직원 정보 가져오기
	    Employee employee = employeeService.getEmployeeById(3);
	    if (employee != null) {
	        System.out.println("직원 정보:");
	        System.out.println("직원 번호: " + employee.getEmpNo());
	        System.out.println("비밀번호: " + employee.getPw());
	        System.out.println("이름: " + employee.getName());
	        System.out.println("주소: " + employee.getAddr());
	        System.out.println("전화번호: " + employee.getPhone());
	        System.out.println("휴대폰번호: " + employee.getTel());
	        System.out.println("이메일: " + employee.getEmail());
	    } else {
	        System.out.println("직원 정보를 가져오지 못했습니다.");
	    }
	}



	private static void testDatabaseConnection(EmployeeService employeeService) {
	    // 데이터베이스 연결 테스트 메서드
	    Connection dbConnection = employeeService.dbConnection;
	    if (dbConnection != null) {
	        System.out.println("데이터베이스 연결 성공");
	        // 여기에서 연결을 닫지 않도록 수정
	    } else {
	        System.out.println("데이터베이스 연결 실패");
	    }
	}

}
