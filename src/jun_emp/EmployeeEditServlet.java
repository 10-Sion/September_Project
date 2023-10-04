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

        // 폼에서 전달된 currentEmployeeId 파라미터를 가져옴
        String currentEmployeeIdStr = request.getParameter("currentEmployeeId");

        if (currentEmployeeIdStr == null || currentEmployeeIdStr.isEmpty()) {
            // currentEmployeeId가 없는 경우 또는 비어 있는 경우 처리
            request.setAttribute("errorMessage", "직원 정보를 가져오지 못했습니다.");
            request.getRequestDispatcher("/Employee/error.jsp").forward(request, response);
            return;
        }

        try {
            // currentEmployeeId를 정수로 파싱
            int currentEmployeeId = Integer.parseInt(currentEmployeeIdStr);

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

                // 업데이트 성공한 경우, 다시 empMain.jsp로 이동
                response.sendRedirect(request.getContextPath() + "/Employee/empMain.jsp");
            } else {
                // EmployeeService가 초기화되지 않은 경우 처리
                System.err.println("EmployeeService is not initialized.");
            }
        } catch (NumberFormatException e) {
            // currentEmployeeId가 숫자로 변환할 수 없는 경우 처리
            request.setAttribute("errorMessage", "유효하지 않은 직원 번호입니다.");
            request.getRequestDispatcher("/Employee/error.jsp").forward(request, response);
        }
    }
}
