package jun_notice;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Notices.NoticesMgr;

@WebServlet("/Notices/noticesWrite")
public class NoticesWriteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        request.setCharacterEncoding("UTF-8");
        
        NoticesMgr noticesMgr = new NoticesMgr();
        noticesMgr.insertNotice(request);
        
        response.sendRedirect("list.jsp");
    }
}
