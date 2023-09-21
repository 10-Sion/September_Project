package jun;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProfessorDAOImpl implements ProfessorDAO {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/gwanlee?serverTimezone=UTC";
    private static final String DB_USERNAME = "pid";
    private static final String DB_PASSWORD = "1234";

    private Connection connection;

    public ProfessorDAOImpl(Connection connection) {
        this.connection = connection;
    }

    @Override
    public List<Professor> getProfessors() {
        List<Professor> professors = new ArrayList<>();
        String query = "SELECT * FROM professor";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Professor professor = new Professor();
                professor.setPro_no(resultSet.getInt("pro_no"));
                professor.setPw(resultSet.getString("pw"));
                professor.setName(resultSet.getString("name"));
                professor.setAddr(resultSet.getString("addr"));
                professor.setPhone(resultSet.getString("Phone"));
                professor.setTel(resultSet.getString("tel"));
                professor.setMajor(resultSet.getString("major"));
                professor.setEmail(resultSet.getString("email"));
                professor.setLabNum(resultSet.getInt("labNum"));

                professors.add(professor);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return professors;
    }

    public static String getDbUrl() {
        return DB_URL;
    }

    public static String getDbUsername() {
        return DB_USERNAME;
    }

    public static String getDbPassword() {
        return DB_PASSWORD;
    }
    
    // 특정 no의 교수 정보 조회
    @Override
    public Professor getProfessorByNo(String professorNo) {
        String query = "SELECT * FROM professor WHERE pro_no = ?";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, professorNo);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                Professor professor = new Professor();
                professor.setPro_no(resultSet.getInt("pro_no"));
                professor.setPw(resultSet.getString("pw"));
                professor.setName(resultSet.getString("name"));
                professor.setAddr(resultSet.getString("addr"));
                professor.setPhone(resultSet.getString("Phone"));
                professor.setTel(resultSet.getString("tel"));
                professor.setMajor(resultSet.getString("major"));
                professor.setEmail(resultSet.getString("email"));
                professor.setLabNum(resultSet.getInt("labNum"));

                return professor;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null; // 해당 학번의 교수 정보를 찾지 못한 경우
    }

}
