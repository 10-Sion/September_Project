package jun_stu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.sql.DataSource;

public class StudentService {
    private DataSource dataSource;

    public StudentService(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public List<Student> getAllStudents() {
        if (dataSource == null) {
            // dataSource가 null인 경우 처리
            System.err.println("DataSource is not initialized.");
            return Collections.emptyList(); // 빈 리스트 반환 또는 예외 처리 방법 선택
        }

        List<Student> students = new ArrayList<>();
        String sql = "SELECT * FROM student";

        try (Connection dbConnection = dataSource.getConnection();
             PreparedStatement statement = dbConnection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                students.add(createStudentFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return students;
    }

    // Student 조회 by ID
    public Student getStudentById(int stuNo) {
        if (dataSource == null) {
            // dataSource가 null인 경우 처리
            System.err.println("DataSource is not initialized.");
            return null;
        }

        String sql = "SELECT * FROM student WHERE stu_no = ?";
        
        try (Connection dbConnection = dataSource.getConnection();
             PreparedStatement statement = dbConnection.prepareStatement(sql)) {
            statement.setInt(1, stuNo);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                return createStudentFromResultSet(resultSet);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return null;
    }

    private Student createStudentFromResultSet(ResultSet resultSet) throws SQLException {
        int stuNo = resultSet.getInt("stu_no");
        String name = resultSet.getString("name");
        String phone = resultSet.getString("phone");
        String email = resultSet.getString("email");
        String pw = resultSet.getString("pw");
        String addr = resultSet.getString("addr");
        String tel = resultSet.getString("tel");
        String dep_name = resultSet.getString("dep_name");
        String major = resultSet.getString("major");
        int grade = resultSet.getInt("grade");
        int status = resultSet.getInt("status");

        return new Student(stuNo, name, phone, email, pw, addr, tel, dep_name, major, grade, status);
    }

}
