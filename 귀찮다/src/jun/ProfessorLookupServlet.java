package jun;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ProfessorLookup")
public class ProfessorLookupServlet extends HttpServlet {
    private ProfessorDAO professorDAO;

    @Override
    public void init() throws ServletException {
        super.init();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                ProfessorDAOImpl.getDbUrl(),
                ProfessorDAOImpl.getDbUsername(),
                ProfessorDAOImpl.getDbPassword()
            );
            professorDAO = new ProfessorDAOImpl(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            List<Professor> professorList = professorDAO.getProfessors();

            if (professorList != null) {
                request.setAttribute("professorList", professorList);

                RequestDispatcher dispatcher = request.getRequestDispatcher("/ProfessorList.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Professors not found");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error occurred: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
