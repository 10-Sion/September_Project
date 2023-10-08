package jun_notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Notices/noticesList")
public class NoticesListServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        MyService myService = new MyService();
        
        List<Notice> noticesList = myService.getAllNotices();
        
        request.setAttribute("noticesList", noticesList);
        request.getRequestDispatcher("/Notice/Not_list.jsp").forward(request, response);
        
        System.out.println(request.getContextPath());
    }
}
