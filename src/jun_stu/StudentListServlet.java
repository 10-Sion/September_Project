package jun_stu;

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

@WebServlet("/student/list")
public class StudentListServlet extends HttpServlet {

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
        // 모든 Student의 정보를 조회
        List<Student> students = studentService.getAllStudents();

        request.setAttribute("students", students);

        // JSP로 포워드하여 학생 목록을 표시합니다.
        request.getRequestDispatcher("/Employee/student_list.jsp").forward(request, response);
    }
}