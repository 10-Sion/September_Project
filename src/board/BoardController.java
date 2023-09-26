package board;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

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
	
	 public void init(ServletConfig config) throws ServletException {		
		    try {
		        // 컨텍스트 및 데이터 소스 초기화
		        Context initCtx = new InitialContext();
		        Context ctx = (Context) initCtx.lookup("java:comp/env");
		        DataSource ds = (DataSource) ctx.lookup("jdbc/gwanlee"); // 데이터 소스 초기화

		        boardService = new BoardService(ds); // BoardDAO 생성자에 데이터 소스 전달
		    } catch (Exception e) {
		        System.out.println("BoardController의 init() 메소드에서 초기화 오류: " + e);
		    }
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

    	    // 요청 주소에서 액션 부분만 추출
    	    String action = request.getPathInfo();
    	    System.out.println("action:" + action);

    	    String nextPage = ""; // VIEW 주소 저장 용도 또는 서블릿 요청 주소 저장 용도

    	    // 2단계 요청 주소-> /BoardWrite.board 요청 주소는 글 내용 입력하는 화면 (Board-QnA 폴더에 저장된 boardWrite.jsp) 요청 주소를 받았을 때 처리
    	    if (action.equals("/BoardWrite.board")) {
    	        nextPage = "/Board-QnA/boardWrite.jsp";
    	    }
    	    // /BoardWritePro.board 2단계 요청 주소는 입력한 새글 내용들을 DB의 테이블에 INSERT 요청 주소를 받았을 때
    	    else if (action.equals("/BoardWritePro.board")) {
    	        // 요청한 값 얻기
    	        String name = request.getParameter("name");
    	        String subject = request.getParameter("subject");
    	        String content = request.getParameter("content");

    	        // BoardBean 객체 생성 및 데이터 설정
    	        BoardBean boardBean = new BoardBean();
    	        boardBean.setName(name);
    	        boardBean.setSubject(subject);
    	        boardBean.setContent(content);

    	        // BoardService의 메서드 호출하여 데이터 추가
    	        boardService.addArticle(boardBean);

    	        int result = 1; // 추가에 성공한 것으로 가정

    	        if (result > 0) {
    	            // 추가에 성공한 경우
    	            // 새로 추가된 글의 번호를 가져오려면 추가 로직을 수정해야 합니다.
    	            // 여기서는 추가에 성공한 것만을 고려하여 result가 양수일 경우로 처리합니다.

    	            // 다음 화면에 새로 추가된 글의 번호를 전달하기 위해 request에 설정
    	            int newArticleNo = 0; // 새로 추가된 글의 번호를 설정하세요.
    	            request.setAttribute("newArticleNo", newArticleNo);

    	            nextPage = "/Board-QnA/boardWritePro.jsp";
    	        } else {
    	            // 추가에 실패한 경우
    	            nextPage = "/Board-QnA/boardWriteFail.jsp";
    	        }
    	    }
    	    // 2단계 요청 주소-> /BoardList.board 요청 주소는 게시판 목록을 가져오는 주소
    	    else if (action.equals("/BoardList.board")) {
    	        // 게시물 목록을 가져오는 메서드 호출
    	        List<BoardBean> boardList = boardService.listArticles();

    	        // 가져온 게시물 목록을 request 속성에 설정
    	        request.setAttribute("boardList", boardList);

    	        nextPage = "/Board-QnA/boardList.jsp";
    	    }

    	    // 다음 페이지로 이동
    	    RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
    	    dispatcher.forward(request, response);
    	}
}
