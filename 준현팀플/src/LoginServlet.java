
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

       if (studentLogin || employeeLogin || professorLogin) {
 
            // 로그인 성공
            // 로그인 후 작업 (예: 세션 설정)
        	// 세션 생성 또는 기존 세션 가져오기
            HttpSession session = request.getSession(true);
            
            // 세션에 사용자 정보 저장 
            session.setAttribute("uniqueId", uniqueId);

            // 로그인 성공 시 메인 페이지로 리다이렉트
            response.sendRedirect("page/main/MainPage.jsp");
            
        } else {
            // 로그인 실패
            // 실패 처리 (예: 오류 메시지 표시)
            // ...

            // 로그인 실패 메시지 출력
            response.getWriter().write("Login failed");
        }
    }
}