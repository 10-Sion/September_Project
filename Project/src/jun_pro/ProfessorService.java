package jun_pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.sql.DataSource;

public class ProfessorService {
    private DataSource dataSource;

    public ProfessorService(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public List<Professor> getAllProfessors() {
        if (dataSource == null) {
            // dataSource가 null인 경우 처리
            System.err.println("DataSource is not initialized.");
            return Collections.emptyList(); // 빈 리스트 반환 또는 예외 처리 방법 선택
        }

        List<Professor> professors = new ArrayList<>();
        String sql = "SELECT * FROM professor";

        try (Connection dbConnection = dataSource.getConnection();
             PreparedStatement statement = dbConnection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                professors.add(createProfessorFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return professors;
    }

    public Professor getProfessorById(int proNo) {
        if (dataSource == null) {
            // dataSource가 null인 경우 처리
            System.err.println("DataSource is not initialized.");
            return null;
        }

        String sql = "SELECT * FROM professor WHERE pro_no = ?";
        
        try (Connection dbConnection = dataSource.getConnection();
             PreparedStatement statement = dbConnection.prepareStatement(sql)) {
            statement.setInt(1, proNo);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                return createProfessorFromResultSet(resultSet);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return null;
    }

    private Professor createProfessorFromResultSet(ResultSet resultSet) throws SQLException {
        int proNo = resultSet.getInt("pro_no");
        String pw = resultSet.getString("pw");
        String name = resultSet.getString("name");
        String addr = resultSet.getString("addr");
        String phone = resultSet.getString("phone");
        String tel = resultSet.getString("tel");
        String email = resultSet.getString("email");
        String depName = resultSet.getString("dep_name");
        String major = resultSet.getString("major");
        int labNum = resultSet.getInt("labNum");
        int status = resultSet.getInt("status");

        return new Professor(proNo, pw, name, addr, phone, tel, email, depName, major, labNum, status);
    }
}
