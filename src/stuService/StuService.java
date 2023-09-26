package stuService;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import stuDAO.StuDAO;
import stuVO.StuVO; 

public class StuService {

	// stuDAO 객체를 저장할 참조변수 선언
	StuDAO studao;
	
	public StuService() {
		studao = new StuDAO();
	}
	
	public int serviceStudentCheck(HttpServletRequest request) {
		String stu_no = request.getParameter("stu_no");
		String stu_pw = request.getParameter("stu_pw");
		
		// check = 1 아이디 맞음
		HttpSession session = request.getSession();
		session.setAttribute("stu_no", stu_no);
		
		return studao.userCheck(stu_no, stu_pw);
	}

	public String serviceStudentLogin() {
		// 로그인을 하기 위해 아이디를 입력할 중앙화면요청
		return "../student/s_login.jsp";
	}

	public void serviceStudentLogOut(HttpServletRequest request) {
		// 기존에 생성했던 session 메모리 얻기
		HttpSession session_ = request.getSession();
		session_.invalidate(); // 세선에 저장된 아이디 값 제거
	}


}
