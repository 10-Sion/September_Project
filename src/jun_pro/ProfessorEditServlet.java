package jun_pro;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import jun_emp.DatabaseConfig;

import javax.servlet.ServletException;
import java.io.IOException;

@WebServlet("/professor/update")
public class ProfessorEditServlet extends HttpServlet {
    private ProfessorService professorService;

    @Override
    public void init() throws ServletException {
        super.init();
        // DatabaseConfig에서 DataSource 가져와서 ProfessorService 객체 초기화
        DataSource dataSource = DatabaseConfig.getDataSource();
        professorService = new ProfessorService(dataSource);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 세션에서 현재 로그인된 사용자의 교수 정보 가져오기
        HttpSession session = request.getSession();
        Integer currentProfessorId = (Integer) session.getAttribute("currentProfessorId");

        if (currentProfessorId == null) {
            // 로그인되지 않은 경우 또는 세션에 교수 정보가 없는 경우 처리
            request.setAttribute("errorMessage", "로그인이 필요합니다.");
            request.getRequestDispatcher("/Professor/error.jsp").forward(request, response);
            return;
        }

        // ProfessorService를 사용하여 교수 정보를 가져오기
        if (professorService != null) {
            Professor currentProfessor = professorService.getProfessorById(currentProfessorId);

            // POST 요청의 경우, 수정할 데이터를 받아옴
            String newPw = request.getParameter("newPw");
            String newName = request.getParameter("newName");
            String newAddr = request.getParameter("newAddr");
            String newPhone = request.getParameter("newPhone");
            String newTel = request.getParameter("newTel");
            String newEmail = request.getParameter("newEmail");

            // 교수 정보 수정
            currentProfessor.setPw(newPw);
            currentProfessor.setName(newName);
            currentProfessor.setAddr(newAddr);
            currentProfessor.setPhone(newPhone);
            currentProfessor.setTel(newTel);
            currentProfessor.setEmail(newEmail);

            // 수정된 데이터를 ProfessorService를 사용하여 업데이트
            professorService.updateProfessor(currentProfessor);

            // 업데이트 성공한 경우 이동
            response.sendRedirect(request.getContextPath() + "/Employee/empMain.jsp");
        } else {
            // ProfessorService가 초기화되지 않은 경우 처리
            System.err.println("ProfessorService is not initialized.");
        }
    }
}
