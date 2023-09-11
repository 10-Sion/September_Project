package jjin_mak;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ShowProfessorListServlet", urlPatterns = "/ShowProfessorListServlet")
public class ShowProfessorListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String dbUrl;
    private String dbUsername;
    private String dbPassword;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        // 서블릿 초기화 파라미터에서 데이터베이스 연결 정보 가져오기
        ServletContext servletContext = getServletContext();
        dbUrl = servletContext.getInitParameter("dbUrl");
        dbUsername = servletContext.getInitParameter("dbUsername");
        dbPassword = servletContext.getInitParameter("dbPassword");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ServletException("MySQL JDBC 드라이버를 찾을 수 없습니다.", e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Professor> professors = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword)) {
            String query = "SELECT pro_no, name, tel, major FROM professor";
            try (PreparedStatement statement = connection.prepareStatement(query);
                 ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {
                    int proNo = resultSet.getInt("pro_no");
                    String name = resultSet.getString("name");
                    String tel = resultSet.getString("tel");
                    String major = resultSet.getString("major");

                    professors.add(new Professor(proNo, name, tel, major));
                }
            }
        } catch (SQLException e) {
            throw new ServletException("데이터베이스 연결 또는 쿼리 실행 중 오류 발생", e);
        }

        request.setAttribute("professors", professors);
        request.getRequestDispatcher("RealLast/showProfessorList.jsp").forward(request, response);
    }
}
