package jun_stu;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import jun_emp.DatabaseConfig;

@WebServlet("/student/detail")
public class StuListDetailsServlet extends HttpServlet {

    private StudentService studentService;

    @Override
    public void init() throws ServletException {
        super.init();
        
        ServletContext context = getServletContext();
        DataSource dataSource = DatabaseConfig.getDataSource();

        if (dataSource != null) {
            studentService = new StudentService(dataSource);
            
        } else {
            throw new ServletException("DataSource is not initialized.");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // URL 파라미터에서 stuNo 가져오기
        int stuNo = Integer.parseInt(request.getParameter("currentStudentId"));

        // StudentService 학생 정보를 조회.
        if (studentService != null) {
            Student student = studentService.getStudentById(stuNo);

            if (student != null) {
                // 조회된 학생 정보를 request에 설정
                request.setAttribute("student", student);

                // 학생 세부 정보를 표시하는 JSP 페이지로 이동
                request.getRequestDispatcher("/Employee/student_detail.jsp").forward(request, response);
            } else {
                // 학생 정보를 가져오지 못한 경우
                request.setAttribute("errorMessage", "학생 정보를 가져오지 못했습니다.");
                request.getRequestDispatcher("/Employee/error.jsp").forward(request, response);
            }
        } else {
            // StudentService가 초기화되지 않은 경우 처리
            System.err.println("StudentService is not initialized.");
        }
    }
}