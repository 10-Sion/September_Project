package last;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.sql.DataSource;
import javax.servlet.ServletContext;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpSession;

@WebServlet("/employee/list")
public class EmployeeListServlet extends HttpServlet {

    private EmployeeService employeeService;

    @Override
    public void init() throws ServletException {
        super.init();
        // 여기서 EmployeeService를 초기화하는 코드 추가
        ServletContext context = getServletContext();
        DataSource dataSource = (DataSource) context.getAttribute("dataSource");

        if (dataSource != null) {
            employeeService = new EmployeeService();
            employeeService.init(dataSource);
        } else {
            throw new ServletException("DataSource is not initialized.");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 세션에서 현재 로그인된 사용자의 직원 No. 가져오기
        HttpSession session = request.getSession();
        Integer currentEmployeeId = (Integer) session.getAttribute("currentEmployeeId");

        // 범위를 벗어난 경우 처리
        if (currentEmployeeId == null || currentEmployeeId <= 0 || currentEmployeeId >= 1000) {
            // 임시 세션 값으로 5를 설정
            currentEmployeeId = 5;
            session.setAttribute("currentEmployeeId", currentEmployeeId);

            // 경고 메시지를 설정
            request.setAttribute("errorMessage", "잘못된 접근입니다.");

            // 이전 페이지로 이동시키기 위한 URL 설정
            String previousPage = request.getHeader("Referer");
            // 경고 메시지와 함께 이전 페이지로 이동
            request.getRequestDispatcher(previousPage).forward(request, response);
            return;
        }

        // EmployeeService를 사용하여 모든 Employee의 정보를 조회합니다.
        List<Employee> employees = employeeService.getAllEmployees();

        // 조회된 직원 정보를 request에 설정하여 JSP에 전달합니다.
        request.setAttribute("employees", employees);

        // JSP로 포워드하여 직원 목록을 표시합니다.
        request.getRequestDispatcher("/employee/employee_list.jsp").forward(request, response);
    }
}
