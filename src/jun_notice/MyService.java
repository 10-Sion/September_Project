package jun_notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class MyService {
    private DatabaseConnection dbConnection;

    public MyService() {
        dbConnection = new DatabaseConnection();
    }

    public List<Notice> getAllNotices() {
        List<Notice> notices = new ArrayList<>();
        String sql = "SELECT * FROM notice";
        
        try (Connection conn = dbConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            
            while (rs.next()) {
                Notice notice = new Notice();
                notice.setNum(rs.getInt("num"));
                notice.setTitle(rs.getString("title"));
                notice.setContent(rs.getString("content"));
                notice.setRegdate(rs.getDate("regdate"));
                notice.setSubNo(rs.getInt("sub_no"));
                notice.setProNo(rs.getInt("pro_no"));
                notices.add(notice);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return notices;
    }

    public void insertNotice(HttpServletRequest request) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = dbConnection.getConnection();
            String sql = "INSERT INTO notice (title, content, regdate, sub_no, pro_no) VALUES (?, ?, NOW(), ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, request.getParameter("title"));
            pstmt.setString(2, request.getParameter("content"));
            pstmt.setInt(3, Integer.parseInt(request.getParameter("sub_no")));
            pstmt.setInt(4, Integer.parseInt(request.getParameter("pro_no")));
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dbConnection.closeConnection(conn, pstmt);
        }
    }

    public Notice getNotice(int num) {
        Notice notice = null;
        String sql = "SELECT * FROM notice WHERE num=?";
        
        try (Connection conn = dbConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, num);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    notice = new Notice();
                    notice.setNum(rs.getInt("num"));
                    notice.setTitle(rs.getString("title"));
                    notice.setContent(rs.getString("content"));
                    notice.setRegdate(rs.getDate("regdate"));
                    notice.setSubNo(rs.getInt("sub_no"));
                    notice.setProNo(rs.getInt("pro_no"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return notice;
    }

    public void updateNotice(Notice bean) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = dbConnection.getConnection();
            String sql = "UPDATE notice SET title=?, content=?, regdate=NOW(), sub_no=?, pro_no=? WHERE num=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, bean.getTitle());
            pstmt.setString(2, bean.getContent());
            pstmt.setInt(3, bean.getSubNo());
            pstmt.setInt(4, bean.getProNo());
            pstmt.setInt(5, bean.getNum());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dbConnection.closeConnection(conn, pstmt);
        }
    }

    public void deleteNotice(int num) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = dbConnection.getConnection();
            String sql = "DELETE FROM notice WHERE num=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dbConnection.closeConnection(conn, pstmt);
        }
    }
}
