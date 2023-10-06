package Notices;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Notices/noticesUpdate")
public class NoticesUpdateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("EUC-KR");
        response.setContentType("text/html; charset=EUC-KR");

        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();

        NoticesMgr nMgr = new NoticesMgr();
        NoticesBean bean = (NoticesBean) session.getAttribute("bean");
        String nowPage = request.getParameter("nowPage");

        NoticesBean upBean = new NoticesBean();
        upBean.setNum(Integer.parseInt(request.getParameter("num")));
        upBean.setTitle(request.getParameter("title"));
        upBean.setContent(request.getParameter("content"));
      

        nMgr.updateNotice(upBean);
        String url = "read.jsp?nowPage=" + nowPage + "&num=" + upBean.getNum();
        response.sendRedirect(url);
    }
}
