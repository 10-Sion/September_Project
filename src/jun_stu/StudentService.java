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
    
 // 학생 정보 수정
    public boolean updateStudent(Student student) {
        if (dataSource == null) {
            // dataSource가 null인 경우 처리
            System.err.println("DataSource is not initialized.");
            return false;
        }

        String sql = "UPDATE student SET pw = ?, name = ?, addr = ?, phone = ?, tel = ?, email = ?, dep_name = ?, major = ? WHERE stu_no = ?";

        try (Connection dbConnection = dataSource.getConnection();
             PreparedStatement statement = dbConnection.prepareStatement(sql)) {
            statement.setString(1, student.getPw());
            statement.setString(2, student.getName());
            statement.setString(3, student.getAddr());
            statement.setString(4, student.getPhone());
            statement.setString(5, student.getTel());
            statement.setString(6, student.getEmail());
            statement.setString(7, student.getDep_name());
            statement.setString(8, student.getMajor());
            statement.setInt(9, student.getStuNo());

            int rowCount = statement.executeUpdate();

            // 업데이트된 행의 수를 확인하여 성공 여부를 반환
            return rowCount > 0;
        } catch (SQLException e) {
            // 오류 발생 시 RuntimeException으로 예외 던지기
            throw new RuntimeException(e);
        }
    }


    // 학생 정보 삭제
    public boolean deleteStudent(int stuNo) {
        if (dataSource == null) {
            // dataSource가 null인 경우 처리
            System.err.println("DataSource is not initialized.");
            return false;
        }

        String sql = "DELETE FROM student WHERE stu_no = ?";

        try (Connection dbConnection = dataSource.getConnection();
             PreparedStatement statement = dbConnection.prepareStatement(sql)) {
            statement.setInt(1, stuNo);
            int rowsAffected = statement.executeUpdate();

            // 삭제된 행의 수(rowsAffected)를 확인
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false; // 예외 발생 시 삭제 실패로 처리
        }
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
