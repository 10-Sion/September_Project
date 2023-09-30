package board;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

@WebServlet("/BoardListServlet")
public class BoardListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BoardDAO boardDAO; // boardDAO 객체 선언

    public void init() throws ServletException {
        try {
            // 컨텍스트 및 데이터 소스 초기화
            Context initCtx = new InitialContext();
            Context ctx = (Context) initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource) ctx.lookup("jdbc/gwanlee"); // 데이터 소스 초기화

            // BoardDAO 객체 초기화
            boardDAO = new BoardDAO(ds); // BoardDAO 생성자에 데이터 소스 전달
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
    	
        // 게시물 목록을 가져오는 메서드 호출
        Vector<BoardBean> boardVector = boardDAO.getAllBoards();
        
        // 콘솔에 게시물 수 출력
        System.out.println("게시물 수: " + boardVector.size());
        
        // Vector를 List로 변환
        List<Map<String, String>> boardList = new ArrayList<>();
        for (BoardBean board : boardVector) {
            Map<String, String> boardData = new HashMap<>();
            boardData.put("num", String.valueOf(board.getNum())); // 글번호 
            boardData.put("name", board.getName()); // 작성자
            boardData.put("subject", board.getSubject()); // 글 제목
         //   boardData.put("regdate", board.getRegdate().toString()); // regdate를 문자열로 변환
            boardList.add(boardData);
        }

        // 추출한 정보를 request 속성에 설정
        request.setAttribute("boardList", boardList);

 
        
        // 게시물 목록 화면으로 포워딩
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Board-QnA/boardList.jsp");
        dispatcher.forward(request, response);
        
     // boardList를 콘솔로 출력
        System.out.println("boardList: " + boardList);
    }
}
