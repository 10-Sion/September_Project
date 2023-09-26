package last;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import java.io.IOException;

@WebServlet("/employee/info")
public class EmployeeInfoServlet extends HttpServlet {

    private EmployeeService employeeService;

    @Override
    public void init() throws ServletException {
        super.init();
        // 여기서 EmployeeService를 초기화하는 코드 추가
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 세션에서 현재 로그인된 사용자의 직원 No.
        HttpSession session = request.getSession();
        int currentEmployeeId = (int) session.getAttribute("currentEmployeeId");

        // EmployeeService 직원 정보 조회.
        Employee employee = employeeService.getEmployeeById(currentEmployeeId);

        // request에 설정하여 JSP에 전달합니다.
        request.setAttribute("employee", employee);

        // JSP로 포워드하여 직원 정보를 표시합니다.
        request.getRequestDispatcher("/employee_info.jsp").forward(request, response);
    }
}
