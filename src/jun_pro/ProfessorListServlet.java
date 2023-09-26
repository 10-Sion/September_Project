// ProfessorListServlet.java
package jun_pro;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import jun_emp.DatabaseConfig;

@WebServlet("/professor/list")
public class ProfessorListServlet extends HttpServlet {

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
        // 모든 Professor의 정보를 조회
        List<Professor> professors = professorService.getAllProfessors();

        request.setAttribute("professors", professors);

        // JSP로 포워드하여 교수 목록을 표시합니다.
        request.getRequestDispatcher("/Employee/professor_list.jsp").forward(request, response);
    }
}
