package last;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/employee/list")
public class EmployeeListServlet extends HttpServlet {

    private EmployeeService employeeService;

    @Override
    public void init() throws ServletException {
        super.init();
        
        ServletContext context = getServletContext();
        DataSource dataSource = DatabaseConfig.getDataSource();

        if (dataSource != null) {
            employeeService = new EmployeeService(dataSource);
            
        } else {
            throw new ServletException("DataSource is not initialized.");
            
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 모든 Employee의 정보를 조회
        List<Employee> employees = employeeService.getAllEmployees();

        // 각 직원의 emp_no를 콘솔에 출력
        for (Employee employee : employees) {
            int empNo = employee.getEmpNo();
            System.out.println("조회된 직원 번호: " + empNo);
        }
        
        request.setAttribute("employees", employees);

        // JSP로 포워드하여 직원 목록을 표시합니다.
        request.getRequestDispatcher("/Employee/employee_list.jsp").forward(request, response);
    }

}
