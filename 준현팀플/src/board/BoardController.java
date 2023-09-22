package board;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//   /Board/BoardWrite.board
//   1   /   2   단계 요청 주소  중에서.........	
//  2단계 요청주소->  /BoardWrite.board 요청주소는  글내용 입력하는 화면(Board-QnA폴더에 저장된  boardWrite.jsp)요청주소

//  /Board/BoardWritePro.board
// 1   /   2   단계 요청 주소  중에서.........	
//2단계 요청주소->  /BoardWritePro.board 요청주소는  입력한 새글 내용들을 DB의 테이블에 INSERT요청 주소 

//사장   MVC중에서  C
@WebServlet("/Board/*")
public class BoardController extends HttpServlet {

	 //부장  MVC중에서 M
	 private BoardService boardService;
	
     @Override
	public void init(ServletConfig config) throws ServletException {		
    	 boardService = new BoardService(); // BoardDAO 객체  생성
     }
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	doHandle(request, response);
    }
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	doHandle(request, response);
    }

    protected void doHandle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
    	
    	String action = request.getPathInfo(); // /Board/BoardWrite.board
    										   //   1   /   2   단계 요청 주소  중에서.........	
    										   // 2단계 요청주소->  /BoardWrite.board 요청주소는  글내용 입력하는 화면(Board-QnA폴더에 저장된  boardWrite.jsp)요청주소
    	
										    	//  /Board/BoardWritePro.board
										    	// 1   /   2   단계 요청 주소  중에서.........	
										    	//2단계 요청주소->  /BoardWritePro.board 요청주소는  입력한 새글 내용들을 DB의 테이블에 INSERT요청 주소 
    	
    	System.out.println("action:" + action);

		String nextPage = "";//VIEW주소 저장 용도 또는 서블릿요청주소 저장용도

    	// 2단계 요청주소->  /BoardWrite.board 요청주소는  글내용 입력하는 화면
    	//               (Board-QnA폴더에 저장된  boardWrite.jsp)요청주소를 받았을때 처리 
    	if (action.equals("/BoardWrite.board")) {
    		
			nextPage = "/Board-QnA/boardWrite.jsp";
			
		
		// /BoardWritePro.board 2단계요청주소는  입력한 새글 내용들을 DB의 테이블에 INSERT요청 주소 를 받았으때	
		}else if(action.equals("/BoardWritePro.board")) { 
			//요청한 값얻기
			//boardWrite.jsp페이지에서 입력한 새글 정보 얻기
			String name = request.getParameter("name");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");

		
			//요청한값을  DB의 테이블에 추가 하기 위해 BoardService의 메소드 호출시 매개변수로 요청한값 전달하여  추가명령!
			boardService.
			
			
			//DB의 테이블에 새글정보 추가에 성공하면 보여줄  VIEW경로를 nextPage변수에 저장
			
			
		}
    	
    	
    	 RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
         dispatcher.forward(request, response);

    }
/*
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
    */
}