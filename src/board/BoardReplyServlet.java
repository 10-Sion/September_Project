package board;

import java.io.IOException;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/BoardReplyServlet")
public class BoardReplyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BoardService boardService;

    public void init() throws ServletException {
        try {
            // 컨텍스트 및 데이터 소스 초기화
            Context initCtx = new InitialContext();
            Context ctx = (Context) initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource) ctx.lookup("jdbc/gwanlee"); // 데이터 소스 초기화

            // BoardDAO 객체 초기화
            BoardDAO boardDAO = new BoardDAO(ds); // BoardDAO 생성자에 데이터 소스 전달
        } catch (Exception e) {
            System.out.println("BoardListServlet의 init() 메소드에서 초기화 오류: " + e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doHandle(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doHandle(request, response);
    }
    
    protected void doHandle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	

        // 게시물 답글 화면으로 포워딩
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Board-QnA/boardReply.jsp");
        dispatcher.forward(request, response);
    	
        // 요청 파라미터 받아오기
        String parentID = request.getParameter("parentID");
        String name = request.getParameter("name");
        String content = request.getParameter("content");

        // 답글 작성 시간 생성
        Timestamp regdate = new Timestamp(System.currentTimeMillis());

        // BoardBean 객체 생성 및 데이터 설정
        BoardBean boardBean = new BoardBean();
        boardBean.setparentID(parentID); // 부모 게시물 ID 설정
        boardBean.setName(name);
        boardBean.setContent(content);
        boardBean.setRegdate(regdate);

        // BoardService를 사용하여 답글 추가
        boardService.replyBoard(boardBean);
	
        
        // 답글 작성 완료 후 상세 게시물 페이지로 리다이렉트
        response.sendRedirect(request.getContextPath() + "/Board/BoardView.board?num=" + parentID);
    }
}
