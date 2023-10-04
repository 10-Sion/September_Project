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

@WebServlet("/student/update")
public class StudentEditServlet extends HttpServlet {
    private StudentService studentService;

    @Override
    public void init() throws ServletException {
        super.init();
        // DatabaseConfig에서 DataSource 가져와서 StudentService 객체 초기화
        DataSource dataSource = DatabaseConfig.getDataSource();
        studentService = new StudentService(dataSource);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 폼에서 currentStudentId를 가져옴
        int currentStudentId = Integer.parseInt(request.getParameter("currentStudentId"));

        // StudentService를 사용하여 학생 정보를 가져오기
        if (studentService != null) {
            Student currentStudent = studentService.getStudentById(currentStudentId);

            // POST 요청의 경우, 수정할 데이터를 받아옴
            String newPw = request.getParameter("newPw");
            String newName = request.getParameter("newName");
            String newAddr = request.getParameter("newAddr");
            String newPhone = request.getParameter("newPhone");
            String newTel = request.getParameter("newTel");
            String newEmail = request.getParameter("newEmail");
            String newDepName = request.getParameter("newDepName");
            String newMajor = request.getParameter("newMajor");

            // 학생 정보 수정
            currentStudent.setPw(newPw);
            currentStudent.setName(newName);
            currentStudent.setAddr(newAddr);
            currentStudent.setPhone(newPhone);
            currentStudent.setTel(newTel);
            currentStudent.setEmail(newEmail);
            currentStudent.setDep_name(newDepName);
            currentStudent.setMajor(newMajor);

            // 수정된 데이터를 StudentService를 사용하여 업데이트
            studentService.updateStudent(currentStudent);

            // 업데이트 성공한 경우 이동
            response.sendRedirect(request.getContextPath() + "/Employee/empMain.jsp");
        } else {
            // StudentService가 초기화되지 않은 경우 처리
            System.err.println("StudentService is not initialized.");
        }
    }
}
