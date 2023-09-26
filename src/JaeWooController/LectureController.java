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
		String keyWord = "";
		String keyField = "";
		
		if(action != null) {
		
			if(action.equals("/Main")){ 
				request.setAttribute("center", "Center.jsp");
				nextPage = "/LecturePro/MainLecture.jsp";
			
				
			}else if(action.equals("/LectureList.do")){
				
			
				
				String nowPage = request.getParameter("nowPage");
				String nowBlock = request.getParameter("nowBlock");
				
				if(request.getParameter("keyWord") != null){
					keyField = request.getParameter("keyField");
					keyWord = request.getParameter("keyWord");
				}
				List Subject = lectureservice.getSublist(keyField, keyWord);
				
				request.setAttribute("keyField", keyField);
				request.setAttribute("keyWord", keyWord);
				request.setAttribute("list", Subject);
				request.setAttribute("center", "LectureList.jsp");
				request.setAttribute("nowPage", nowPage);
				request.setAttribute("nowBlock", nowBlock);
				
				nextPage = "/LecturePro/MainLecture.jsp";
			
				
				
			}else if(action.equals("/LecturePlan.do")) {
				
				int sub_no = Integer.parseInt(request.getParameter("sub_no"));
				
				LectureVO Lv = lectureservice.getSubject(sub_no);
				PlanVO Pv = lectureservice.getPlan(sub_no);
						
				request.setAttribute("plan", Pv);		
				request.setAttribute("lv", Lv);
				request.setAttribute("center", "/LecturePro/SubjectPlan.jsp");
				
				nextPage = "/LecturePro/MainLecture.jsp";
				
			}
			
			
		}
		
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);		
		dispatch.forward(request, response);
		}
//		
//	
//			
//		}catch (Exception e) {
//			System.out.println( "오류 : " + e);
//			e.printStackTrace();
//		}
		
	

	
}
