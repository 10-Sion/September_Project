package jun_notice;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class NoticeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private int noticeNum;
    private List<NoticeDTO> noticeList;

    public NoticeController() {
        super();
        noticeNum = 1;
        noticeList = new ArrayList<>();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doProcess(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doProcess(request, response);
    }

    public void doProcess(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String requestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = requestURI.substring(contextPath.length());
        System.out.println("command = " + command);

        String page = "";
        boolean isRedirect = false;

        if (command.equals("/noticeList.do")) {
            request.setAttribute("list", noticeList);
            page = "noticeList.jsp";
        }

        if (command.equals("/regnoticeForm.do")) {
            page = "notice_write_form.jsp";
        }

        if (command.equals("/regnotice.do")) {
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String writer = request.getParameter("writer");
            String createDate = request.getParameter("createDate");

            NoticeDTO notice = new NoticeDTO(noticeNum, title, content, writer, createDate);
            noticeNum++;

            noticeList.add(notice);

            page = "noticeList.do";
            isRedirect = true;
        }

        if (command.equals("/noticeDetail.do")) {
            int num = Integer.parseInt(request.getParameter("noticeNum"));

            for (NoticeDTO notice : noticeList) {
                if (notice.getNoticeNum() == num) {
                    request.setAttribute("notice", notice);
                }
            }

            page = "noticeDetail.jsp";
        }

        if (command.equals("/delete.do")) {
            int num = Integer.parseInt(request.getParameter("noticeNum"));

            for (int i = 0; i < noticeList.size(); i++) {
                if (noticeList.get(i).getNoticeNum() == num) {
                    noticeList.remove(i);
                }
            }

            page = "noticeList.do";
        }

        if (command.equals("/updateNoticeForm.do")) {
            int num = Integer.parseInt(request.getParameter("noticeNum"));

            for (NoticeDTO notice : noticeList) {
                if (notice.getNoticeNum() == num) {
                    request.setAttribute("notice", notice);
                }
            }

            page = "noticeUpdate.jsp";
        }

        if (command.equals("/updateNotice.do")) {
            String title = request.getParameter("title");
            String writer = request.getParameter("writer");
            String createDate = request.getParameter("createDate");
            String content = request.getParameter("content");
            int num = Integer.parseInt(request.getParameter("noticeNum"));

            for (NoticeDTO notice : noticeList) {
                if (notice.getNoticeNum() == num) {
                    notice.setTitle(title);
                    notice.setWriter(writer);
                    notice.setContent(content);
                    notice.setCreateDate(createDate);
                }
            }

            page = "noticeList.do";
        }

        if (isRedirect) {
            response.sendRedirect(page);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher(page);
            dispatcher.forward(request, response);
        }
    }
}
