

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.mysql.cj.xdevapi.JsonArray;

import JaeWooDAO.ProDao;


@WebServlet("/join.do")
public class Joindata extends HttpServlet {


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�븳湲�泥섎━
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String dep_name = request.getParameter("dep_val");
		
		ProDao pDao = new ProDao();
		JSONArray array = pDao.getMajor(dep_name); 

		out.print(array);
		// .toString()
	}

}
