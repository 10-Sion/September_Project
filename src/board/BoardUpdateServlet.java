package board;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BoardUpdateServlet")
public class BoardUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BoardDAO boardDAO;

    public void init() {
        boardDAO = new BoardDAO(); // BoardDAO 객체 초기화
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 게시물 수정 폼을 보여줌 (일반적으로 JSP로 구현)
        // 여기에서는 간단하게 "boardUpdate.jsp"로 포워딩하는 예제를 보여줍니다.
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Board-QnA/boardUpdate.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 게시물 수정을 처리하는 코드를 여기에 추가

        // 예시: 폼에서 전달된 수정된 데이터를 얻어옴
        int num = Integer.parseInt(request.getParameter("num"));
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");

        // BoardDAO를 사용하여 데이터베이스 업데이트 수행
        BoardBean boardBean = new BoardBean();
        boardBean.setNum(num);
        boardBean.setSubject(subject);
        boardBean.setContent(content);


        // 수정 결과를 보여줄 JSP로 포워딩
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Board-QnA/boardUpdateResult.jsp");
        dispatcher.forward(request, response);
    }
}
