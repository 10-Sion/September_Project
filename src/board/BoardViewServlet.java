package board;

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
        // 게시물 상세 정보를 가져오기 위해 요청 파라미터에서 게시물 번호(num)를 추출합니다.
        int num = Integer.parseInt(request.getParameter("num"));

        // BoardDAO의 getBoard 메서드를 사용하여 게시물 상세 정보를 가져옵니다.
        BoardBean boardBean = boardDAO.getBoard(num);

        // 게시물 정보를 request 속성에 설정하여 JSP에서 사용할 수 있도록 합니다.
        request.setAttribute("board", boardBean);

        // 게시물 상세 정보를 보여줄 JSP로 포워딩합니다.
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Board-QnA/boardView.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
