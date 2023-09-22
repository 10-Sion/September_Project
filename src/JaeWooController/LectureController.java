package JaeWooController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JaeWooService.LectureService;



@WebServlet("/Lecture/*")
public class LectureController extends HttpServlet {
	
	LectureService lectureservice;
	
	
	@Override
	public void init() throws ServletException {
		
		lectureservice = new LectureService();
	}
	
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		String action = request.getPathInfo();
		System.out.println("주소 : "+action);
		
		String nextPage = null; 
			
		
		switch(action) {
		
			case "/Main" :
				
				nextPage = "Main.jsp";
				
				break;
				
			case "/LectureList.do" :
				
				request.setAttribute("center", "LectureList.jsp");
		
				nextPage = "/LectureList.jsp";
				
				break;
			
		}
		
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}

	
}
