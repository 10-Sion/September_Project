package JaeWooService;

import java.util.ArrayList;
import java.util.List;

import JaeWooDAO.LectureDAO;
import JaeWooVO.LectureVO;
import JaeWooVO.PlanVO;
import JaeWooVO.WeekVO;

public class LectureService {
	LectureDAO lectureDao;
	
	public LectureService() {
		lectureDao = new LectureDAO();
	}

	public ArrayList getSublist(String keyField,String keyWord){
		return lectureDao.getSublist(keyField, keyWord); 
	}
	
	public ArrayList getSublist(String keyField,String keyWord, int pro_no){
		return lectureDao.getSublist(keyField, keyWord, pro_no); 
	} 

	public LectureVO getSubject(int sub_no) {
		return lectureDao.getSubject(sub_no);
	}

	public PlanVO getPlan(int sub_no) {
		// TODO Auto-generated method stub
		return lectureDao.getPlan(sub_no);
	}

	public void InsertWeek(WeekVO kw) {
		lectureDao.InsertWeek(kw);	
	}

	public List getWeekList(int sub_no) {
		// TODO Auto-generated method stub
		return lectureDao.getWeekList(sub_no);
	}
	
	
}
