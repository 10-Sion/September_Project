import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Member.EmployeeDAO;
import Member.ProfessorDAO;
import Member.StudentDAO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	// LoginServlet.java
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // 사용자로부터 입력 받은 데이터 가져오기
	    int uniqueId = Integer.parseInt(request.getParameter("no")); // 사용자 고유번호
	    String userPassword = request.getParameter("pw"); // 사용자 비밀번호

	    // 각 DAO 클래스를 사용하여 로그인 체크
	    StudentDAO studentDAO = new StudentDAO();
	    EmployeeDAO employeeDAO = new EmployeeDAO();
	    ProfessorDAO professorDAO = new ProfessorDAO();

	    // 학생, 직원, 교수 로그인 여부 확인
	    boolean studentLogin = studentDAO.checkLogin(uniqueId, userPassword);
	    boolean employeeLogin = employeeDAO.checkLogin(uniqueId, userPassword);
	    boolean professorLogin = professorDAO.checkLogin(uniqueId, userPassword);

	    String userRole = null; // 사용자 역할을 저장할 변수
	    String userName = null; // 사용자 이름을 저장할 변수

	    if (studentLogin) {
	        // 학생으로 로그인한 경우
	        userRole = "학생";
	        // 데이터베이스에서 사용자 이름 가져오기
	        userName = studentDAO.getStudentName(uniqueId);
	    } else if (employeeLogin) {
	        // 직원으로 로그인한 경우
	        userRole = "직원";
	        // 데이터베이스에서 사용자 이름 가져오기
	        userName = employeeDAO.getEmployeeName(uniqueId);
	    } else if (professorLogin) {
	        // 교수로 로그인한 경우
	        userRole = "교수";
	        // 데이터베이스에서 교수 이름 가져오기
	        userName = professorDAO.getProfessorName(uniqueId);
	    }

	    // 로그인 결과를 부모 창으로 전달
	    response.setContentType("text/plain");
	    if (userRole != null) {
	        // 로그인 성공
	        HttpSession session = request.getSession(true);
	        session.setAttribute("uniqueId", uniqueId);
	        session.setAttribute("userRole", userRole);
	        session.setAttribute("username", userName);
	        // 성공 메시지 전송
	        response.getWriter().write("success");
	    } else {
	        // 로그인 실패
	        // 실패 메시지 전송
	        response.getWriter().write("failed");
	    }
	}


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 로그아웃 처리
        HttpSession session = request.getSession(false); // 세션이 없으면 새로 생성하지 않음
        if (session != null) {
            session.invalidate(); // 세션 무효화
        }

        // 로그아웃 후 메인 페이지로 리다이렉트
        response.sendRedirect("/HakSaGwanLee/page/main/MainPage.jsp");
    }
}
