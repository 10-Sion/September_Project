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
	    // 세션에서 현재 로그인된 사용자의 직원 No. 가져오기
	    HttpSession session = request.getSession();
	    Integer currentEmployeeId = (Integer) session.getAttribute("currentEmployeeId");

	    // 이전 페이지로 이동시키기 위한 URL 설정
	    String previousPage = request.getHeader("Referer");

	    // 범위를 벗어난 경우 처리
	    if (currentEmployeeId == null || currentEmployeeId <= 0 || currentEmployeeId >= 1000) {
	        // 경고 메시지를 설정
	        request.setAttribute("errorMessage", "잘못된 접근입니다.");
	        // 경고 메시지와 함께 이전 페이지로 이동
	        request.getRequestDispatcher(previousPage).forward(request, response);
	        return;
	    }

	    // EmployeeService 직원 정보를 조회.
	    Employee employee = employeeService.getEmployeeById(currentEmployeeId);

	    // 조회된 직원 정보 JSP에 전달.
	    request.setAttribute("employee", employee);

	    // 직원 세부 정보를 표시.
	    request.getRequestDispatcher("/employee_details.jsp").forward(request, response);
	}



}
