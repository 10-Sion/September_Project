package jun;

public interface EmployeeDAO {

	// 교직원(본인) 조회
	Employee getEmployeeByNo(int no);
	// 정보 수정
	void updateEmployee(Employee employee);
	// 탈퇴
	void deleteEmployee(int no);
}
