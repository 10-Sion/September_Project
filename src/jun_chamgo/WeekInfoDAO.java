package jun_chamgo;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
                    
                    // lectureLink에서 비디오 ID 추출
                    String videoId = extractVideoId(lectureLink);
                    
                    WeekInfo weekInfo = new WeekInfo(weekName, videoId);
                    weekInfoList.add(weekInfo);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return weekInfoList;
    }
    
    // YouTube 링크에서 비디오 ID 추출하는 메서드
    private String extractVideoId(String youtubeUrl) {
        String videoId = null;
        String pattern = "(?<=watch\\?v=|/videos/|embed\\/|youtu.be\\/|\\/v\\/|\\/e\\/|watch\\?v%3D|watch\\?feature=player_embedded&v=|%2Fvideos%2F|embed%2F|youtu.be%2F|%2Fv%2F)[^#\\?\\&\\n]*";

        Pattern compiledPattern = Pattern.compile(pattern);
        Matcher matcher = compiledPattern.matcher(youtubeUrl);

        if (matcher.find()) {
            videoId = matcher.group();
        }

        return videoId;
    }
}
