package jun_pro;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import jun_emp.DatabaseConfig;

@WebServlet("/professor/delete")
public class ProfessorDeleteServlet extends HttpServlet {
    private ProfessorService professorService;

    @Override
    public void init() throws ServletException {
        super.init();

        ServletContext context = getServletContext();
        DataSource dataSource = DatabaseConfig.getDataSource();

        if (dataSource != null) {
            professorService = new ProfessorService(dataSource);
        } else {
            // DataSource가 null인 경우 처리
            throw new ServletException("DataSource is not initialized.");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 교수 번호를 파라미터에서 가져오기
        int proNo = Integer.parseInt(request.getParameter("currentProfessorId"));

        // ProfessorService를 이용하여 교수 정보 삭제
        if (professorService != null) {
            boolean deleted = professorService.deleteProfessor(proNo);

            if (deleted) {
                // 삭제 성공 메시지 설정
                request.setAttribute("successMessage", "교수 정보가 삭제되었습니다.");
                // 성공적으로 삭제되었음을 클라이언트에 응답
                response.getWriter().write("success");
            } else {
                // 삭제 실패 메시지 설정
                request.setAttribute("errorMessage", "교수 정보 삭제 실패.");
                // 삭제 실패함을 클라이언트에 응답
                response.getWriter().write("failure");
            }
        } else {
            // ProfessorService가 초기화되지 않은 경우 처리
            System.err.println("ProfessorService is not initialized.");
            // 초기화 오류를 클라이언트에 응답
            response.getWriter().write("failure");
        }
    }
}
