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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import JaeWooDAO.ProDao;
import JaeWooService.LectureService;
import JaeWooVO.LectureVO;
import JaeWooVO.PlanVO;
import JaeWooVO.ProIntroVO;
import JaeWooVO.WeekVO;



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
				
				nextPage = "/GangUi/PublicSubIndex.jsp";
			
				
				
			}else if(action.equals("/LecturePlan.do")) {
				
				int sub_no = Integer.parseInt(request.getParameter("sub_no"));
				
				LectureVO Lv = lectureservice.getSubject(sub_no);
				PlanVO Pv = lectureservice.getPlan(sub_no);
						
				request.setAttribute("plan", Pv);		
				request.setAttribute("lv", Lv);
				request.setAttribute("center", "/LecturePro/SubjectPlan.jsp");
				
				nextPage = "/LecturePro/MainLecture.jsp";
				
			}else if(action.equals("/ProLectureList.do")){
				
				int pro_no = Integer.parseInt(request.getParameter("pro_no"));
				String nowPage = request.getParameter("nowPage");
				String nowBlock = request.getParameter("nowBlock");
				
				if(request.getParameter("keyWord") != null){
					keyField = request.getParameter("keyField");
					keyWord = request.getParameter("keyWord");
				}
				List Subject = lectureservice.getSublist(keyField, keyWord, pro_no );
				
				request.setAttribute("keyField", keyField);
				request.setAttribute("keyWord", keyWord);
				request.setAttribute("list", Subject);
				request.setAttribute("center", "LectureList.jsp");
				request.setAttribute("nowPage", nowPage);
				request.setAttribute("nowBlock", nowBlock);
				
				nextPage = "/Professor/SubIndex.jsp";
			
				
				
			}else if(action.equals("/ProLecturePlan.do")) {
				
				int sub_no = Integer.parseInt(request.getParameter("sub_no"));
				
				LectureVO Lv = lectureservice.getSubject(sub_no);
				PlanVO Pv = lectureservice.getPlan(sub_no);
						
				request.setAttribute("plan", Pv);		
				request.setAttribute("lv", Lv);
				
				nextPage = "/Professor/SubjectPlan.jsp";
				
				
			}else if(action.equals("/ProLectureDetail.do")) {
				
				int sub_no = Integer.parseInt( request.getParameter("sub_no") );
				
				List weeklist = lectureservice.getWeekList(sub_no);
				
				request.setAttribute("weeklist", weeklist);
				
				
				nextPage = "/Professor/SubjectWeek.jsp?sub_no=" + sub_no;			
				
			    
			}else if(action.equals("/InsertWeek.do")) {
				
				System.out.println("서블릿 연결 성공");
				WeekVO kw = new WeekVO();
				int sub_no = Integer.parseInt( request.getParameter("sub_no") );				
				int week = Integer.parseInt( request.getParameter("week") );	
				int class_hour =Integer.parseInt( request.getParameter("class_hour") );
				Boolean assignment = Boolean.parseBoolean(request.getParameter("assignment"));
				
				kw.setWeek(week);
				kw.setSub_no(sub_no);
				kw.setClass_hour(class_hour);
				kw.setWeek_name(request.getParameter("week_name"));
				kw.setClass_type(request.getParameter("class_type"));
				kw.setAssignment(assignment);
				kw.setLecture_link(request.getParameter("lecture_link"));
				
				lectureservice.InsertWeek(kw);
				
				List weeklist = lectureservice.getWeekList(sub_no);
				
				request.setAttribute("weeklist", weeklist);
				
				
				nextPage = "/Professor/proMain.jsp";		
				response.sendRedirect("/HakSaGwanLee/Professor/proMain.jsp");
				return;
				
			}else if(action.equals("/InsertSubject.do")) {
				
				
				LectureVO lv = new LectureVO();
				
				
				int pro_no = Integer.parseInt(request.getParameter("pro_no"));
				int credit = Integer.parseInt(request.getParameter("credit"));
				int grade = Integer.parseInt(request.getParameter("grade"));
				
				lv.setComp_sort(request.getParameter("comp_sort"));
				lv.setSub_name(request.getParameter("sub_name"));
				lv.setPeriod(request.getParameter("period"));
				lv.setEdu_goal(request.getParameter("edu_goal"));
				lv.setPlace(request.getParameter("place"));
				lv.setTextbook(request.getParameter("textbook"));
				lv.setPro_name(request.getParameter("pro_name"));
				lv.setPro_email(request.getParameter("pro_email"));
				lv.setMajor(request.getParameter("major"));
				lv.setPro_no(pro_no);
				lv.setCredit(credit);
				lv.setGrade(grade);
				 
				lectureservice.InsertSubject(lv);
				

					
				nextPage = "/Professor/proMain.jsp";		
				response.sendRedirect("/HakSaGwanLee/Professor/proMain.jsp");
				return;
				
			}else if(action.equals("/InsertPlan.do")) {
				
				PlanVO pv = new PlanVO();
				
				int sub_no = Integer.parseInt(request.getParameter("sub_no"));
				int mid_exam = Integer.parseInt(request.getParameter("mid_exam"));
				int final_exam = Integer.parseInt(request.getParameter("final_exam"));
				int quiz = Integer.parseInt(request.getParameter("quiz"));
				int task = Integer.parseInt(request.getParameter("task"));
				int attendance = Integer.parseInt(request.getParameter("attendance"));
				int jilmun = Integer.parseInt(request.getParameter("jilmun"));
				int toron = Integer.parseInt(request.getParameter("toron"));
				
				
				pv.setSub_no(sub_no);
				pv.setMid_exam(mid_exam);
				pv.setFinal_exam(final_exam);
				pv.setQuiz(quiz);
				pv.setTask(task);
				pv.setAttendance(attendance);
				pv.setJilmun(jilmun);
				pv.setToron(toron);
				
				lectureservice.InsertPlan(pv);
				
				nextPage = "/Professor/proMain.jsp";		
				response.sendRedirect("/HakSaGwanLee/Professor/proMain.jsp");
				return;
				
			}else if(action.equals("/PlanIndex.do")){
				
				int pro_no = Integer.parseInt(request.getParameter("pro_no"));
				String nowPage = request.getParameter("nowPage");
				String nowBlock = request.getParameter("nowBlock");
				
				if(request.getParameter("keyWord") != null){
					keyField = request.getParameter("keyField");
					keyWord = request.getParameter("keyWord");
				}
				List Subject = lectureservice.getSublist(keyField, keyWord, pro_no );
				
				request.setAttribute("keyField", keyField);
				request.setAttribute("keyWord", keyWord);
				request.setAttribute("list", Subject);
				request.setAttribute("center", "LectureList.jsp");
				request.setAttribute("nowPage", nowPage);
				request.setAttribute("nowBlock", nowBlock);
				
				out.print( "alert('입력 되었습니다.')");
				
				nextPage = "/Professor/PlanIndex.jsp";
				
			}else if(action.equals("/ViewPlan.do")) {
				
				int sub_no = Integer.parseInt(request.getParameter("sub_no"));
				
				LectureVO Lv = lectureservice.getSubject(sub_no);
				PlanVO Pv = lectureservice.getPlan(sub_no);
						
				request.setAttribute("plan", Pv);		
				request.setAttribute("lv", Lv);
				
				nextPage = "/Professor/InsertPlan.jsp";
				
				
			}else if(action.equals("/InsertProIntro.do")) {
				
				ProIntroVO piv = new ProIntroVO();
				
				int pro_no = Integer.parseInt(request.getParameter("pro_no"));
				
				piv.setPro_no(pro_no);
				piv.setBlog(request.getParameter("blog"));
				piv.setFacebook(request.getParameter("facebook"));
				piv.setHomepage(request.getParameter("homepage"));
				piv.setIntroduce(request.getParameter("Introduce"));
				
				lectureservice.InsertProIntro(pro_no, piv);
				
			
				
				nextPage = "/Professor/proMyPage.jsp";
				
				response.sendRedirect("/HakSaGwanLee/Professor/proMyPage.jsp");
				return;
				
				
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
