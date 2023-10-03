package jun_emp;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/employee/delete")
public class EmpListDeleteServlet extends HttpServlet {
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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 직원 번호를 파라미터에서 가져오기
        int empNo = Integer.parseInt(request.getParameter("currentEmployeeId"));

        // EmployeeService를 이용하여 직원 정보 삭제
        if (employeeService != null) {
            boolean deleted = employeeService.deleteEmployee(empNo);

            if (deleted) {
                // 삭제 성공 메시지 설정
                request.setAttribute("successMessage", "직원 정보가 삭제되었습니다.");
                // 성공적으로 삭제되었음을 클라이언트에 응답
                response.getWriter().write("success");
            } else {
                // 삭제 실패 메시지 설정
                request.setAttribute("errorMessage", "직원 정보 삭제 실패.");
                // 삭제 실패함을 클라이언트에 응답
                response.getWriter().write("failure");
            }
        } else {
            // EmployeeService가 초기화되지 않은 경우 처리
            System.err.println("EmployeeService is not initialized.");
            // 초기화 오류를 클라이언트에 응답
            response.getWriter().write("failure");
        }
    }

}
