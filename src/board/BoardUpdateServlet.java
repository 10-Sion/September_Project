package board;

// 게시물 수정 화면

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
        doGet(request, response);
    }
}