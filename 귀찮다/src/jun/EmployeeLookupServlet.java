package jun;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EmployeeLookUp")
public class EmployeeLookupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private EmployeeDAO employeeDAO;

    public EmployeeLookupServlet() {

    }

    @Override
    public void init() throws ServletException {
        super.init();
        
        // 데이터베이스 연결 및 EmployeeDAO 객체 초기화
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                EmployeeDAOImpl.getDbUrl(),
                EmployeeDAOImpl.getDbUsername(),
                EmployeeDAOImpl.getDbPassword()
            );
            employeeDAO = new EmployeeDAOImpl(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            // 요청 파라미터에서 교직원 번호를 읽어옴
            int employeeNo = Integer.parseInt(request.getParameter("employeeNo"));

            // EmployeeDAO를 사용하여 교직원 정보를 조회
            Employee employee = employeeDAO.getEmployeeByNo(employeeNo);

            if (employee != null) {
                // 조회한 교직원 정보를 request 객체에 저장
                request.setAttribute("employeeLookup", employee);

                // JSP 페이지로 포워딩
                RequestDispatcher dispatcher = request.getRequestDispatcher("/EmployeeLookUp.jsp");
                dispatcher.forward(request, response);
            } else {
                // 교직원이 없을 경우 처리
                request.setAttribute("errorMessage", "Employee not found");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
                dispatcher.forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid employee number");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
