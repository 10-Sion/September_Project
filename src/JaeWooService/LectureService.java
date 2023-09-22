package JaeWooService;

import java.util.ArrayList;
import java.util.List;

import JaeWooDAO.LectureDAO;
import JaeWooVO.LectureVO;
import JaeWooVO.PlanVO;

public class LectureService {
	LectureDAO lectureDao;
	
	public LectureService() {
		lectureDao = new LectureDAO();
	}

	public ArrayList getSublist(){
		return lectureDao.getSublist(); 
	}

	public LectureVO getSubject(int sub_no) {
		return lectureDao.getSubject(sub_no);
	}

	public PlanVO getPlan(int sub_no) {
		// TODO Auto-generated method stub
		return lectureDao.getPlan(sub_no);
	}
	
	
}
