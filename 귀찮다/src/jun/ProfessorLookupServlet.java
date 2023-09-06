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


@WebServlet("/ProfessorLookUp")
public class ProfessorLookupServlet extends HttpServlet {

	private ProfessorDAO professorDAO; // ProfessorDAO 객체를 멤버 변수로 선언

    @Override
    public void init() throws ServletException {
        super.init();
        
        // 데이터베이스 연결 및 ProfessorDAO 객체 초기화
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
	         // ProfessorDAO를 사용하여 교수 정보를 조회
	         List<Professor> professors = professorDAO.getProfessors();

	         if (professors != null && !professors.isEmpty()) {
	             // 조회한 교수 정보를 request 객체에 저장
	             request.setAttribute("professorLookup", professors);

	             // JSP 페이지로 포워딩
	             RequestDispatcher dispatcher = request.getRequestDispatcher("/ProfessorLookUp.jsp");
	             dispatcher.forward(request, response);
	         } else {
	             // 교수 정보가 없을 경우 처리
	             request.setAttribute("errorMessage", "No professors found");
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

