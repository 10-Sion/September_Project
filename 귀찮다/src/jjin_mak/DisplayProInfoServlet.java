package jjin_mak;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DisplayProInfoServlet")
public class DisplayProInfoServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // pro_no 매개변수 가져오기
        int proNo = Integer.parseInt(request.getParameter("pro_no"));

        // 교수 정보를 저장할 객체
        Professor professor = null;

        // 데이터베이스 연결 및 교수 정보 검색
        try (Connection connection = DriverManager.getConnection(DatabaseConfig.DB_URL, DatabaseConfig.DB_USERNAME,
                DatabaseConfig.DB_PASSWORD)) {
        	
            String query = "SELECT pro_no, pw, name, addr, tel, phone, major, email, labNum FROM professor WHERE pro_no = ?";
            
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, proNo);
                
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        // 교수 정보를 객체에 저장
                        int proNoResult = resultSet.getInt("pro_no");
                        String pw = resultSet.getString("pw");
                        String name = resultSet.getString("name");
                        String addr = resultSet.getString("addr");
                        String tel = resultSet.getString("tel");
                        String phone = resultSet.getString("phone");
                        String major = resultSet.getString("major");
                        String email = resultSet.getString("email");
                        String labNum = resultSet.getString("labNum");

                        professor = new Professor(proNoResult, pw, name, addr, tel, phone, major, email, labNum);
                        
                    }
                }
            }
        } catch (SQLException e) {
            throw new ServletException("데이터베이스 연결 또는 쿼리 실행 중 오류 발생", e);
        }

        // 검색된 교수 정보를 request 객체에 설정
        request.setAttribute("professorInfo", professor);

        // displayProInfo.jsp로 포워딩
        request.getRequestDispatcher("/RealLast/displayProInfo.jsp").forward(request, response);
    }
}
