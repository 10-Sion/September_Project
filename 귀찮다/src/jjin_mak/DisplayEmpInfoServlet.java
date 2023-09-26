package jjin_mak;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EmployeeDetailServlet", urlPatterns = "/employeeDetail")
public class DisplayEmpInfoServlet extends HttpServlet {
	
    private EmployeeDAO employeeDAO; // EmployeeDAO 변수 선언

    public void init() throws ServletException {
        // 이곳에서 EmployeeDAO 객체를 초기화합니다.
        employeeDAO = new EmployeeDAOImpl();
        
    }
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        int empNo = Integer.parseInt(request.getParameter("empNo"));

        try {
        	
            Employee employee = employeeDAO.getEmployeeByEmpNo(empNo);
            request.setAttribute("employee", employee);
            request.getRequestDispatcher("RealLast/employeeDetail.jsp").forward(request, response);
            
        } catch (SQLException e) {
            // 예외 처리 코드 추가
        }
    }
}
