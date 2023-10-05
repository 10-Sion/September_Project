package jun_notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Notices/noticesDelete")
public class NoticesDeleteServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        int num = Integer.parseInt(request.getParameter("num"));
        
        MyService myService = new MyService();
        myService.deleteNotice(num);
        
        response.sendRedirect("list.jsp");
    }
}

