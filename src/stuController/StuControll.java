package stuController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import stuService.StuService;
import stuVO.StuVO;
import stuDAO.StuDAO;

@WebServlet("/stu/*")
public class StuControll extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	StuService stuService;
	StuVO stuVo;
	StuDAO stuDao;
	
	public void init () {
		stuService = new StuService();
		stuDao = new StuDAO(); // stuDao 객체 초기화
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
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String action = request.getPathInfo();
		
		System.out.println("요청 받은 주소 : " + action);
		
		
		// 조건에 따라서 포워딩 또는 보여줄 VIEW 주소 경로를 저장할 변수
		String nextPage = null;
		// 요청한 중앙화면 뷰 주소를 저장할 변수 
		String center = null;
		
		switch (action) {
			case "/login.do":
				center = stuService.serviceStudentLogin();
				// System.out.println(center);
				// 중앙화면 주소 바인딩
				request.setAttribute("center", center);
				// 전체 메인화면 주소 저장
				nextPage = "/student/Main.jsp";
				break;
				
			case "/loginPro.do":
				int check = stuService.serviceStudentCheck(request);
				
				if(check == 0) {	// 아이디 맞고 비번틀림
					out.println("<script>");
					out.println("window.alert('비밀번호 틀림');");
					out.println("history.go(-1);");
					out.println("</script>");
					return;
				}else if(check == -1){	// 아이디 틀림
					out.println("<script>");
					out.println("window.alert('아이디 틀림');");
					out.println("history.go(-1);");
					out.println("</script>");
					return;
				}
				nextPage = "/student/Main.jsp";
				break;

			case "/logOut.do":
				stuService.serviceStudentLogOut(request);
				// 전체 메인화면 주소 저장
				nextPage = "/student/Main.jsp";	
				break;
			
			case "/selStudnet.do":
				// s_Sidebar.jsp 로 부터 받은 session 값을 int 형태로 저장
				int stu_no = Integer.parseInt(request.getParameter("stu_no")) ;
				//System.out.println("셀렉트.do " + stu_no);	// 값 넘어옴 
				
				// stu_no 값을 이용해 DB 에 저장된 학생 한명의 정보를 조회하기위해
				// stuDAO 객체의 studnetInfo(int stu_no) 호출 시 학생 번호전달
				// 조회한 학생 정보를 StuVO 객체에 저장해서 반환
				StuVO stuVO = stuDao.studentInfo(stu_no);
				
				request.setAttribute("stuVO", stuVO);
				//equest.setAttribute("center", "s_StuInfo.jsp");
				
				// -- nextPage 변수에 내가 원하는 jsp 경로를 넣어준다 -- //
				// 전체 메인화면 주소 저장
				nextPage = "/stuStuInfo.jsp";
				
				break;
				
			case "/selSubject.do":
				
				String stu_no_1 = request.getParameter("stu_no");
				ArrayList subList = new ArrayList();
				
				subList = stuDao.subList(stu_no_1);
				
				request.setAttribute("subList", subList);
				
				nextPage = "stuTable2.jsp";
				
				break;
			
			case "/addSubject.do":
				
				System.out.println(request.getParameter("sub_no"));
				System.out.println(request.getParameter("stu_no"));
				// 과목번호 넘어옴
				String sub_no1 = request.getParameter("sub_no");
				String sNo = request.getParameter("stu_no");
				stuDao.addSub(sub_no1, sNo);
				
				nextPage = "stuSubject.jsp";
				
				break;
				
			case "/stu_Info.do":
				// System.out.println(request.getParameter("stu_no"));
				String stu_no2 = request.getParameter("stu_no");
				 
				ArrayList stuSub = stuDao.selectSub(stu_no2);
				
				request.setAttribute("stuSub", stuSub);
				
				nextPage = "stuSubject.jsp";
				
				break;
				
			case "/delSubject.do":
				System.out.println(request.getParameter("stu_no"));
				System.out.println(request.getParameter("sub_no"));
				
				String sub_no_2 = request.getParameter("sub_no");
				String sNo_2 = request.getParameter("stu_no");
				
				stuDao.delSubject(sub_no_2, sNo_2);
				
				nextPage = "stuSubject.jsp";
				
				break;
				
		default:
			break;
		}
		
		System.out.println("반환되는 주소 : " + nextPage);
		// 포워딩 (디스패처 방식)
		//equestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		//dispatcher.forward(request, response);
		request.getRequestDispatcher("/Student/" + nextPage).forward(request, response);
	}
}
