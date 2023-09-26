package jun_notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NoticeDAO {
    private Connection conn;

    public NoticeDAO() {
        conn = DatabaseConnection.getConnection();
    }

    public void addNotice(NoticeDTO notice) {
        String sql = "INSERT INTO notice (title, content, writer, createDate) VALUES (?, ?, ?, ?)";

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, notice.getTitle());
            pstmt.setString(2, notice.getContent());
            pstmt.setString(3, notice.getWriter());
            pstmt.setString(4, notice.getCreateDate());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<NoticeDTO> getAllNotices() {
        List<NoticeDTO> notices = new ArrayList<>();
        String sql = "SELECT * FROM notice";

        try (PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                int noticeNum = rs.getInt("noticeNum");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String writer = rs.getString("writer");
                String createDate = rs.getString("createDate");

                NoticeDTO notice = new NoticeDTO(noticeNum, title, content, writer, createDate);
                notices.add(notice);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return notices;
    }

    

    public void close() {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
