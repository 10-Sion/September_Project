package board;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/BoardController")
public class BoardController extends HttpServlet {

    private BoardDAO boardDAO;

    public void init() {
        boardDAO = new BoardDAO(); // BoardDAO 객체 초기화
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "list"; // 기본적으로 목록을 보여줌
        }

        switch (action) {
            case "list":
                listBoard(request, response);
                break;
            case "view":
                viewBoard(request, response);
                break;
            case "new":
                newBoard(request, response);
                break;
            case "edit":
                editBoard(request, response);
                break;
            case "delete":
                deleteBoard(request, response);
                break;
            default:
                listBoard(request, response);
        }
    }

    private void listBoard(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<BoardBean> boardList = boardDAO.getAllBoards();
        request.setAttribute("boardList", boardList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Board-QnA/boardList.jsp");
        dispatcher.forward(request, response);
    }

    private void viewBoard(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int num = Integer.parseInt(request.getParameter("num"));
        BoardBean board = boardDAO.getBoardByNum(num);
        request.setAttribute("board", board);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Board-QnA/boardView.jsp");
        dispatcher.forward(request, response);
    }

    private void newBoard(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 게시물 작성 폼을 보여줌 (일반적으로 JSP로 구현)
        // 여기에서는 간단하게 "boardWrite.jsp"로 포워딩하는 예제를 보여줍니다.
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Board-QnA/boardWrite.jsp");
        dispatcher.forward(request, response);
    }

    private void editBoard(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int num = Integer.parseInt(request.getParameter("num"));
        BoardBean board = boardDAO.getBoardByNum(num);
        request.setAttribute("board", board);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Board-QnA/boardUpdate.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteBoard(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int num = Integer.parseInt(request.getParameter("num"));
        boardDAO.deleteBoard(num);
        response.sendRedirect("BoardController?action=list");
    }
}