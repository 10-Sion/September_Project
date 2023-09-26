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

@WebServlet("/professor/detail")
public class ProListDetailsServlet extends HttpServlet {

    private ProfessorService professorService;

    @Override
    public void init() throws ServletException {
        super.init();
        
        ServletContext context = getServletContext();
        DataSource dataSource = DatabaseConfig.getDataSource();

        if (dataSource != null) {
            professorService = new ProfessorService(dataSource);
            
        } else {
            throw new ServletException("DataSource is not initialized.");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // URL 파라미터에서 proNo 가져오기
        int proNo = Integer.parseInt(request.getParameter("currentProfessorId"));

        // ProfessorService 교수 정보를 조회.
        if (professorService != null) {
            Professor professor = professorService.getProfessorById(proNo);

            if (professor != null) {
                // 조회된 교수 정보를 request에 설정
                request.setAttribute("professor", professor);

                // 교수 세부 정보를 표시하는 JSP 페이지로 이동
                request.getRequestDispatcher("/Employee/proList_detail.jsp").forward(request, response);
            } else {
                // 교수 정보를 가져오지 못한 경우
                request.setAttribute("errorMessage", "교수 정보를 가져오지 못했습니다.");
                request.getRequestDispatcher("/Employee/error.jsp").forward(request, response);
            }
        } else {
            // ProfessorService가 초기화되지 않은 경우 처리
            System.err.println("ProfessorService is not initialized.");
        }
    }
}
