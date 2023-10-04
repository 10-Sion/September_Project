package jun_notice;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Notices.NoticesBean;
import Notices.NoticesMgr;

@WebServlet("/Notices/noticesList")
public class NoticesListServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        NoticesMgr noticesMgr = new NoticesMgr();
        
        List<NoticesBean> noticesList = noticesMgr.getNoticesList(0, 10); // 범위 설정
        
        request.setAttribute("noticesList", noticesList);
        request.getRequestDispatcher("/list.jsp").forward(request, response);
    }
}
