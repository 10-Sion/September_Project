package last;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/employee/detail")
public class EmpListDetailsServlet extends HttpServlet {

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
        // URL 파라미터에서 empNo 가져오기
        int empNo = Integer.parseInt(request.getParameter("empNo"));

        // EmployeeService 직원 정보를 조회.
        if (employeeService != null) {
            Employee employee = employeeService.getEmployeeById(empNo);

            if (employee != null) {
                // 조회된 직원 정보를 request에 설정
                request.setAttribute("employee", employee);

                // 직원 세부 정보를 표시하는 JSP 페이지로 이동
                request.getRequestDispatcher("/Employee/empList_detail.jsp").forward(request, response);
            } else {
                // 직원 정보를 가져오지 못한 경우
                request.setAttribute("errorMessage", "직원 정보를 가져오지 못했습니다.");
                request.getRequestDispatcher("/Employee/error.jsp").forward(request, response);
            }
        } else {
            // EmployeeService가 초기화되지 않은 경우 처리
            System.err.println("EmployeeService is not initialized.");
            // 오류 메시지를 표시하고 다른 처리를 하지 않습니다.
        }
    }
}
