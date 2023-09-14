package last;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;
import java.util.List;

@WebServlet("/employee/list")
public class EmployeeListServlet extends HttpServlet {

    private EmployeeService employeeService;

    @Override
    public void init() throws ServletException {
        super.init();
        // 여기서 EmployeeService를 초기화하는 코드 추가
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // EmployeeService를 사용하여 모든 Employee의 정보를 조회합니다.
        List<Employee> employees = employeeService.getAllEmployees();

        
        // 조회된 직원 정보를 request에 설정하여 JSP에 전달합니다.
        request.setAttribute("employees", employees);

        // JSP로 포워드하여 직원 목록을 표시합니다.
        request.getRequestDispatcher("/employee_list.jsp").forward(request, response);
    }
}
