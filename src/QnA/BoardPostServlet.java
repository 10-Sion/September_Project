package QnA;

// 게시물 쓰기 처리 서블릿

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/QnA/boardPost")
public class BoardPostServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		BoardMgr bMgr = new BoardMgr();
		response.sendRedirect("list.jsp");
	}
}
