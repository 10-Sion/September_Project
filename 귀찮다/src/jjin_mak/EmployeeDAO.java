package jjin_mak;

import java.sql.SQLException;
import java.util.List;

public interface EmployeeDAO {
	
	List<Employee> getAllEmployees() throws SQLException;
	Employee getEmployeeByEmpNo(int empNo) throws SQLException;
}
