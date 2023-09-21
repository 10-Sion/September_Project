package jun_emp;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.io.IOException;

@WebServlet("/employee/update")
public class EmployeeEditServlet extends HttpServlet {
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
        // 세션에서 현재 로그인된 사용자의 직원 정보 가져오기
        HttpSession session = request.getSession();
        Employee currentEmployee = (Employee) session.getAttribute("currentEmployee");

        if (currentEmployee == null) {
            // 로그인되지 않은 경우 또는 세션에 직원 정보가 없는 경우 처리
            request.setAttribute("errorMessage", "로그인이 필요합니다.");
            request.getRequestDispatcher("/Employee/error.jsp").forward(request, response);
            return;
        }

        // POST 요청의 경우, 수정할 데이터를 받아옴
        String newPw = request.getParameter("newPw");
        String newName = request.getParameter("newName");
        String newAddr = request.getParameter("newAddr");
        String newPhone = request.getParameter("newPhone");
        String newTel = request.getParameter("newTel");
        String newEmail = request.getParameter("newEmail");

        // 직원 정보 수정
        currentEmployee.setPw(newPw);
        currentEmployee.setName(newName);
        currentEmployee.setAddr(newAddr);
        currentEmployee.setPhone(newPhone);
        currentEmployee.setTel(newTel);
        currentEmployee.setEmail(newEmail);

        // 수정된 데이터를 EmployeeService를 사용하여 업데이트
        if (employeeService != null) {
            employeeService.updateEmployee(currentEmployee);
            // 업데이트 성공한 경우, 다시 세부 정보 페이지로 이동
            response.sendRedirect(request.getContextPath() + "/employee/indivDetail");
        } else {
            // EmployeeService가 초기화되지 않은 경우 처리
            System.err.println("EmployeeService is not initialized.");
            
        }
    }



}
