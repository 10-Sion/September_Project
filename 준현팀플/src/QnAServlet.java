import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Member.QuestionDAO;

@WebServlet("/QnAServlet")
public class QnAServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 데이터베이스로부터 질문 목록을 가져오기 위해 QuestionDAO 객체 생성
        QuestionDAO questionDAO = new QuestionDAO();
        List<String> questionList = questionDAO.fetchQuestions(); // 데이터베이스에서 질문 목록을 가져오는 메서드 호출

        // 질문 목록을 request 속성에 설정하여 JSP 페이지로 전달
        request.setAttribute("questionList", questionList);

        // JSP 페이지로 포워딩
        request.getRequestDispatcher("/Q&A/question.jsp").forward(request, response);
    }


    private List<String> fetchQuestions() {
        List<String> questionList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 데이터베이스 연결 설정
            QuestionDAO questionDAO = new QuestionDAO();

            // SQL 쿼리 작성 및 실행...
            String query = "SELECT question_text FROM Questions";
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();

            // 결과를 questionList에 추가
            while (rs.next()) {
                String questionText = rs.getString("question_text");
                questionList.add(questionText);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 연결 및 리소스 해제
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return questionList;
    }
} 