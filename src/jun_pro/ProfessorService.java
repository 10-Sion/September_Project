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

    public void init(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    // 교수 리스트 조회
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

    // 교수 세부정보
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
    
    // 교수 정보 업데이트
    public boolean updateProfessor(Professor professor) {
        if (dataSource == null) {
            // dataSource가 null인 경우 처리
            System.err.println("DataSource is not initialized.");
            return false;
        }

        String sql = "UPDATE professor SET pw = ?, name = ?, addr = ?, phone = ?, tel = ?, email = ?, dep_name = ?, major = ?, labNum = ? WHERE pro_no = ?";

        try (Connection dbConnection = dataSource.getConnection();
             PreparedStatement statement = dbConnection.prepareStatement(sql)) {
            statement.setString(1, professor.getPw());
            statement.setString(2, professor.getName());
            statement.setString(3, professor.getAddr());
            statement.setString(4, professor.getPhone());
            statement.setString(5, professor.getTel());
            statement.setString(6, professor.getEmail());
            statement.setString(7, professor.getDepName());
            statement.setString(8, professor.getMajor());
            statement.setInt(9, professor.getLabNum());
            statement.setInt(10, professor.getProNo());

            int rowCount = statement.executeUpdate();

            // 업데이트된 행의 수를 확인하여 성공 여부를 반환
            return rowCount > 0;
        } catch (SQLException e) {
            // 오류 발생 시 RuntimeException으로 예외 던지기
            throw new RuntimeException(e);
        }
    }


    // 교수 삭제
    public boolean deleteProfessor(int proNo) {
        if (dataSource == null) {
            // dataSource가 null인 경우 처리
            System.err.println("DataSource is not initialized.");
            return false;
        }

        String sql = "DELETE FROM professor WHERE pro_no = ?";

        try (Connection dbConnection = dataSource.getConnection();
             PreparedStatement statement = dbConnection.prepareStatement(sql)) {
            statement.setInt(1, proNo);
            int rowCount = statement.executeUpdate();

            // 삭제된 행의 수를 확인하여 성공 여부를 반환
            return rowCount > 0;
        } catch (SQLException e) {
            // 오류 발생 시 RuntimeException으로 예외 던지기
            throw new RuntimeException(e);
        }
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
