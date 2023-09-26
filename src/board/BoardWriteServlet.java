package board;

// 게시물 작성 화면

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/BoardWriteServlet")
public class BoardWriteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

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
    	
    	 
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Board-QnA/boardWrite.jsp");
        dispatcher.forward(request, response);
        
    	
        // 사용자가 입력한 데이터 받아오기
        String name = request.getParameter("name");
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
        
        
        String id = request.getParameter("id"); // 사용자 아이디, 예: "admin"
        // 사용자가 입력한 비밀번호 설정
        String passwd = request.getParameter("passwd"); // 사용자가 입력한 비밀번호 받아오기
        
        // 콘솔에 값을 출력
        System.out.println("name: " + name);
        System.out.println("subject: " + subject);
        System.out.println("content: " + content);
        
        

        // BoardBean 객체 생성 및 정보 설정
        BoardBean boardBean = new BoardBean();
        boardBean.setName(name);
        boardBean.setId(id);
        boardBean.setPasswd(passwd); // 사용자가 입력한 비밀번호 설정	
        boardBean.setSubject(subject);
        boardBean.setContent(content);
        boardBean.setIp(request.getRemoteAddr()); // 사용자 IP 주소 설정

        // BoardDAO 객체 생성
        BoardDAO boardDAO = new BoardDAO();

        // insertBoard 메서드 호출하여 게시물 추가
        boardDAO.insertBoard(boardBean);
       
        
        
    }
}
