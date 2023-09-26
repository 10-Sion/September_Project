package jun_emp;

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
        
    	System.out.println("sadasd");
    	
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
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        // 수정할 직원 정보를 입력받아 객체 생성
        String pw = request.getParameter("pw");
        String name = request.getParameter("name");
        String addr = request.getParameter("addr");
        String phone = request.getParameter("phone");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");

        // 입력받은 정보로 Employee 객체 생성
        Employee updatedEmployee = new Employee(currentEmployeeId, pw, name, addr, phone, tel, email);

        // EmployeeService를 이용하여 직원 정보 업데이트
        if (employeeService != null) {
            employeeService.updateEmployee(updatedEmployee);

            // 세션에 업데이트된 직원 정보 저장
            session.setAttribute("currentEmployee", updatedEmployee);

            // 업데이트 성공 메시지 설정
            request.setAttribute("successMessage", "직원 정보가 업데이트되었습니다.");
        } else {
            // EmployeeService가 초기화되지 않은 경우 처리
            System.err.println("EmployeeService is not initialized.");
        }

        // 세부 정보 페이지로 리다이렉트
        response.sendRedirect("/Employee/employee/indivDetail");
    }
}
