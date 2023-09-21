package last;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import java.io.IOException;

@WebServlet("/employee/indivDetail")
public class EmployeeDetailsServlet extends HttpServlet {

    private EmployeeService employeeService;

    @Override
    public void init() throws ServletException {
        super.init();
        // 여기서 EmployeeService를 초기화합니다.
        ServletContext context = getServletContext();
        DataSource dataSource = DatabaseConfig.getDataSource();

        if (dataSource != null) {
            employeeService = new EmployeeService(dataSource);
            
        } else {
            // DataSource가 null인 경우 처리
            throw new ServletException("DataSource is not initialized.");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 세션에서 현재 로그인된 사용자의 직원 No. 가져오기
        HttpSession session = request.getSession();
        Integer currentEmployeeId = (Integer) session.getAttribute("currentEmployeeId");

        // 범위를 벗어난 경우 처리
        if (currentEmployeeId == null || currentEmployeeId <= 0 || currentEmployeeId >= 1000) {
            // 경고 메시지를 설정
            request.setAttribute("errorMessage", "잘못된 접근입니다.");
            // 경고 메시지와 함께 error.jsp로 이동
            request.getRequestDispatcher("/Employee/error.jsp").forward(request, response);
            return;
        }

        // EmployeeService 직원 정보를 조회.
        if (employeeService != null) {
            Employee employee = employeeService.getEmployeeById(currentEmployeeId);

            if (employee != null) {
                // 조회된 직원 정보를 request에 설정
                request.setAttribute("employee", employee);
                
                // 직원 세부 정보를 표시하는 JSP 페이지로 이동
                request.getRequestDispatcher("/Employee/employee_details.jsp").forward(request, response);
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
