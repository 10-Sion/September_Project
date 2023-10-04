package jun_notice;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Notices.NoticesBean;
import Notices.NoticesMgr;

@WebServlet("/Notices/noticesRead")
public class NoticesReadServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        int num = Integer.parseInt(request.getParameter("num"));
        
        NoticesMgr noticesMgr = new NoticesMgr();
        NoticesBean notice = noticesMgr.getNotice(num);
        
        request.setAttribute("notice", notice);
        request.getRequestDispatcher("/read.jsp").forward(request, response);
    }
}
