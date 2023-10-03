package jun_emp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/employee/update")
public class EmployeeEditServlet extends HttpServlet {
    private EmployeeService employeeService;

    @Override
    public void init() throws ServletException {
        super.init();
        // EmployeeService 객체를 생성 및 초기화
        employeeService = new EmployeeService();
        employeeService.init(DatabaseConfig.getDataSource());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	
    	// 세션에서 현재 로그인된 사용자의 직원 정보 가져오기
        HttpSession session = request.getSession();
        Integer currentEmployeeId = (Integer) session.getAttribute("currentEmployeeId");
        
        if (currentEmployeeId == null) {
            // 로그인되지 않은 경우 또는 세션에 직원 정보가 없는 경우 처리
            request.setAttribute("errorMessage", "로그인이 필요합니다.");
            request.getRequestDispatcher("/Employee/error.jsp").forward(request, response);
            return;
        }

        // EmployeeService를 사용하여 직원 정보를 가져오기
        if (employeeService != null) {
            Employee currentEmployee = employeeService.getEmployeeById(currentEmployeeId);
            
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
            employeeService.updateEmployee(currentEmployee);

            // 업데이트 성공한 경우, 다시 세부 정보 페이지로 이동
            response.sendRedirect(request.getContextPath() + "/employee/indivDetail");
        } else {
            // EmployeeService가 초기화되지 않은 경우 처리
            System.err.println("EmployeeService is not initialized.");
        }
    }

}
