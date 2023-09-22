package JaeWooController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JaeWooService.LectureService;
import JaeWooVO.LectureVO;
import JaeWooVO.PlanVO;



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
		
		String nextPage = "" ; 
		
		
		if(action != null) {
		
			if(action.equals("/Main")){ 
				
				nextPage = "/AlBamProject/Main.jsp";
				
			}else if(action.equals("/LectureList.do")){
				
				List Subject = lectureservice.getSublist();
				
				request.setAttribute("list", Subject);
				request.setAttribute("center", "LectureList.jsp");
				
				nextPage = "/AlBamProject/Main.jsp";
				
			}else if(action.equals("/LecturePlan.do")) {
				
				int sub_no = Integer.parseInt(request.getParameter("sub_no"));
				
				LectureVO Lv = lectureservice.getSubject(sub_no);
				PlanVO Pv = lectureservice.getPlan(sub_no);
						
				request.setAttribute("plan", Pv);		
				request.setAttribute("lv", Lv);
				request.setAttribute("center", "/AlBamProject/SubjectPlan.jsp");
				
				nextPage = "/AlBamProject/Main.jsp";
				
			}
			
		}
		
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		
			dispatch.forward(request, response);
	}

	
}
