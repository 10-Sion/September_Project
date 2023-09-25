package board;

// 게시물 상세 화면

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BoardViewServlet")
public class BoardViewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BoardDAO boardDAO;

    public void init() {
        boardDAO = new BoardDAO(); // BoardDAO 객체 초기화
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int num = Integer.parseInt(request.getParameter("num"));
        BoardBean board = boardDAO.getBoardByNum(num);
        request.setAttribute("board", board);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Board-QnA/boardView.jsp");
        dispatcher.forward(request, response);
    }
}