package last;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
