package jun;

import java.util.List;

public interface ProfessorDAO {
    List<Professor> getProfessors();
    Professor getProfessorByNo(String professorNo); // 학번을 기반으로 교수 정보 조회
}
 