package jun;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/EmployeeLookupServlet")
public class EmployeeLookupServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//	DB에서 교직원 정보를 조회 후 변수 저장
		List<Employee> employeeLookup = EmployeeDAO.getAll
				request.setAttribute("employeeLookup", EmployeeLookup);
				request.getRequestDispatcher("EmployeeLookUp.jsp").forward(request, response);
	}



}
