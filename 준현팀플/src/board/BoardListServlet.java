package board;

// 게시물 목록 화면

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BoardListServlet")
public class BoardListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BoardDAO boardDAO;

    public void init() {
        boardDAO = new BoardDAO(); // BoardDAO 객체 초기화
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<BoardBean> boardList = boardDAO.getAllBoards();
        request.setAttribute("boardList", boardList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Board-QnA/boardList.jsp");
        dispatcher.forward(request, response);
    }
}