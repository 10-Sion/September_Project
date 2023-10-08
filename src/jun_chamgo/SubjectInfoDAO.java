package jun_chamgo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class SubjectInfoDAO {
    private DataSource dataSource;

    public SubjectInfoDAO(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public List<String> getRecentSubjectNames(int limit) {
        List<String> subjectNames = new ArrayList<>();

        try (Connection connection = dataSource.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(
                     "SELECT sub_name FROM Subject_Info ORDER BY sub_no DESC LIMIT ?")) {
            pstmt.setInt(1, limit);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    String subName = rs.getString("sub_name");
                    subjectNames.add(subName);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return subjectNames;
    }
}
