package stuService;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import stuDAO.StuDAO;
import stuVO.StuVO; 

public class StuService {

	// stuDAO ��ü�� ������ �������� ����
	StuDAO studao;
	
	public StuService() {
		studao = new StuDAO();
	}
	
	public int serviceStudentCheck(HttpServletRequest request) {
		String stu_no = request.getParameter("stu_no");
		String stu_pw = request.getParameter("stu_pw");
		
		// check = 1 ���̵� ����
		HttpSession session = request.getSession();
		session.setAttribute("stu_no", stu_no);
		
		return studao.userCheck(stu_no, stu_pw);
	}

	public String serviceStudentLogin() {
		// �α����� �ϱ� ���� ���̵� �Է��� �߾�ȭ���û
		return "../student/s_login.jsp";
	}

	public void serviceStudentLogOut(HttpServletRequest request) {
		// ������ �����ߴ� session �޸� ���
		HttpSession session_ = request.getSession();
		session_.invalidate(); // ������ ����� ���̵� �� ����
	}


}
