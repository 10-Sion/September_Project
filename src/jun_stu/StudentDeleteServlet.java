package jun_stu;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import jun_emp.DatabaseConfig;

import javax.servlet.ServletException;
import java.io.IOException;

@WebServlet("/student/delete")
public class StudentDeleteServlet extends HttpServlet {
    private StudentService studentService;

    @Override
    public void init() throws ServletException {
        super.init();
        // DatabaseConfig에서 DataSource 가져와서 StudentService 객체 초기화
        DataSource dataSource = DatabaseConfig.getDataSource();
        studentService = new StudentService(dataSource);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 폼에서 학생 번호 값을 가져오기
        int currentStudentId = Integer.parseInt(request.getParameter("currentStudentId"));

        // StudentService를 사용하여 학생 정보 삭제
        if (studentService != null) {
            boolean deleted = studentService.deleteStudent(currentStudentId);

            if (deleted) {
                // 삭제 성공 메시지 설정
                request.setAttribute("successMessage", "학생 정보가 삭제되었습니다.");
                // 성공적으로 삭제되었음을 클라이언트에 응답
                response.getWriter().write("success");
            } else {
                // 삭제 실패 메시지 설정
                request.setAttribute("errorMessage", "학생 정보 삭제 실패.");
                // 삭제 실패함을 클라이언트에 응답
                response.getWriter().write("failure");
            }
        } else {
            // StudentService가 초기화되지 않은 경우 처리
            System.err.println("StudentService is not initialized.");
            // 초기화 오류를 클라이언트에 응답
            response.getWriter().write("failure");
        }
    }
}