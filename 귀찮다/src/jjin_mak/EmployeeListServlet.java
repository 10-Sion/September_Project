package jjin_mak;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EmployeeListServlet", urlPatterns = "/employeeList")
public class EmployeeListServlet extends HttpServlet {
    private EmployeeDAO employeeDAO; // EmployeeDAO 변수 선언

    public void init() throws ServletException {
        // JDBC 드라이버 클래스 로드
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
        } catch (ClassNotFoundException e) {
            // 드라이버 클래스를 찾을 수 없는 경우 처리
            e.printStackTrace(); // 또는 로그에 기록
            throw new ServletException("MySQL JDBC 드라이버를 찾을 수 없습니다.", e);
            
        }

        // 이곳에서 EmployeeDAO 객체 초기화
        employeeDAO = new EmployeeDAOImpl();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        try {
            List<Employee> employees = employeeDAO.getAllEmployees();
            
            // 데이터를 콘솔에 출력
            for (Employee employee : employees) {
                System.out.println("Employee No: " + employee.getEmpNo());
                System.out.println("Name: " + employee.getName());
                System.out.println("Phone: " + employee.getPhone());
                System.out.println("Email: " + employee.getEmail());
                
            }
            
            request.setAttribute("employees", employees);
            request.getRequestDispatcher("RealLast/showEmployeeList.jsp").forward(request, response);
            
        } catch (SQLException e) {
            // SQL 예외 처리
            e.printStackTrace(); // 또는 로그에 기록
            response.getWriter().println("Database error: " + e.getMessage());
            
        } catch (Exception e) {
            // 기타 예외 처리
            e.printStackTrace(); // 또는 로그에 기록
            response.getWriter().println("Unknown error: " + e.getMessage());
            
        }
    }
}
