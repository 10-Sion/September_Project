package last;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import javax.servlet.ServletException;
import java.io.IOException;

@WebServlet("/employee/edit")
public class EmployeeEditServlet extends HttpServlet {
    private EmployeeService employeeService;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            // DatabaseConfig 데이터베이스 연결 정보
            String dbUrl = DatabaseConfig.DB_URL;
            String dbUsername = DatabaseConfig.DB_USERNAME;
            String dbPassword = DatabaseConfig.DB_PASSWORD;

            // DataSource 객체.
            DataSource dataSource = DatabaseConfig.getDataSource();

            // EmployeeService 객체.
            employeeService = new EmployeeService(dataSource);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Failed to initialize EmployeeService", e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	int empNo = Integer.parseInt(request.getParameter("emp_no"));

        // 세션에서 현재 로그인된 사용자의 직원 No.
        HttpSession session = request.getSession();
        int currentEmployeeId = (int) session.getAttribute("currentEmployeeId");

        // 이전 페이지로 이동시키기 위한 URL 설정
        String previousPage = request.getHeader("Referer");

        // 범위를 벗어난 경우 처리
        if (currentEmployeeId <= 0 || currentEmployeeId >= 1000) {
            // 경고 메시지를 설정
            request.setAttribute("errorMessage", "잘못된 접근입니다.");
            // 경고 메시지와 함께 이전 페이지로 이동
            request.getRequestDispatcher(previousPage).forward(request, response);
            return;
        }

        Employee employee = employeeService.getEmployeeById(empNo);
        request.setAttribute("employee", employee);
        request.getRequestDispatcher("/employee_edit.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int empNo = Integer.parseInt(request.getParameter("emp_no"));
        
        String pw = request.getParameter("pw");
        String name = request.getParameter("name");
        String addr = request.getParameter("addr");
        String phone = request.getParameter("phone");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");

        // Employee 객체를 생성하고 필드를 설정.
        Employee updatedEmployee = new Employee(empNo, pw, name, addr, phone, tel, email);

        // EmployeeService 데이터베이스 업데이트.
        employeeService.updateEmployee(updatedEmployee);

        response.sendRedirect("/employee/details?emp_no=" + empNo);
    }
}
