package jun_chamgo;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class WeekInfoDAO {
    private DataSource dataSource;

    public WeekInfoDAO(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public List<WeekInfo> getRecentWeekInfo(int limit) {
        List<WeekInfo> weekInfoList = new ArrayList<>();

        try (Connection connection = dataSource.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(
                     "SELECT week_name, lecture_link FROM WeekInfo ORDER BY sub_no DESC LIMIT ?")) {
            pstmt.setInt(1, limit);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    String weekName = rs.getString("week_name");
                    String lectureLink = rs.getString("lecture_link");
                    WeekInfo weekInfo = new WeekInfo(weekName, lectureLink);
                    weekInfoList.add(weekInfo);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return weekInfoList;
    }
}
