package jun_notice;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Notices.NoticesBean;
import Notices.NoticesMgr;

@WebServlet("/Notices/noticesUpdate")
public class NoticesUpdateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        NoticesMgr noticesMgr = new NoticesMgr();
        NoticesBean bean = new NoticesBean();
        // bean 설정 (수정할 내용)
        noticesMgr.updateNotice(bean);
        response.sendRedirect("read.jsp?num=" + bean.getNum());
    }
}
