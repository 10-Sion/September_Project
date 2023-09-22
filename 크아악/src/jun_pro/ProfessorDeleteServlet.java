package jun_pro;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/professor/delete")
public class ProfessorDeleteServlet extends HttpServlet {

    private ProfessorService professorService;

    @Override
    public void init() throws ServletException {
        super.init();
        // ProfessorService 초기화 코드
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // URL 파라미터에서 proNo 가져오기
        int proNo = Integer.parseInt(request.getParameter("proNo"));

        // ProfessorService를 사용하여 교수 정보를 삭제
        if (professorService != null) {
            boolean success = professorService.deleteProfessor(proNo);

            if (success) {
                // 삭제 성공 시 교수 목록 페이지로 리다이렉트 또는 메시지 표시
                response.sendRedirect("/HakSaGwanLee/professor/list");
            } else {
                // 삭제 실패 시 에러 메시지 표시
                request.setAttribute("errorMessage", "교수 정보를 삭제하지 못했습니다.");
                request.getRequestDispatcher("/Employee/error.jsp").forward(request, response);
            }
        } else {
            // ProfessorService가 초기화되지 않은 경우 처리
            System.err.println("ProfessorService is not initialized.");
        }
    }
}
