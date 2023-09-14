package last;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import java.io.IOException;

@WebServlet("/employee/details")
public class EmployeeDetailsServlet extends HttpServlet {

 private EmployeeService employeeService;

 @Override
 public void init() throws ServletException {
     super.init();
     // 여기서 EmployeeService를 초기화합니다.
     ServletContext context = getServletContext();
     DataSource dataSource = (DataSource) context.getAttribute("dataSource"); // 데이터 소스를 얻어오는 방법에 따라 코드를 수정하세요.
     employeeService = new EmployeeService(dataSource);
 }

 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     // 세션에서 현재 로그인된 사용자의 직원 No.
     HttpSession session = request.getSession();
     // 세션에 임시 값 저장.
     session.setAttribute("currentEmployeeId", 123);

     int currentEmployeeId = (int) session.getAttribute("currentEmployeeId");
     // EmployeeService 직원 정보를 조회.
     Employee employee = employeeService.getEmployeeById(currentEmployeeId);

     // 조회된 직원 정보 JSP에 전달.
     request.setAttribute("employee", employee);

     // 직원 세부 정보를 표시.
     request.getRequestDispatcher("/employee_details.jsp").forward(request, response);
 }
}
