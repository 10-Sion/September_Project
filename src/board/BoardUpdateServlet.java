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
        // 폼에서 전달된 수정된 데이터를 얻어옴
        int num = Integer.parseInt(request.getParameter("num")); // 게시물 번호
        String subject = request.getParameter("subject"); // 글 제목
        String content = request.getParameter("content"); // 글 내용

        // BoardBean 객체 생성 및 데이터 설정
        BoardBean boardBean = new BoardBean();
        boardBean.setNum(num);
        boardBean.setSubject(subject);
        boardBean.setContent(content);

        // BoardDAO의 updateBoard 메서드를 사용하여 데이터베이스 업데이트 수행
        boardDAO.updateBoard(boardBean);
        
        // 콘솔에 값을 출력
        System.out.println("num: " + num);
        System.out.println("subject: " + subject);
        System.out.println("content: " + content);

    	// 수정 결과 메시지 설정
        request.setAttribute("message", "게시물이 수정되었습니다.");

        // 수정 결과를 보여줄 JSP로 포워딩
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Board-QnA/boardView.jsp");
        dispatcher.forward(request, response);

    }
}
