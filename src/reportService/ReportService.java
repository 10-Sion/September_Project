package reportService;

import java.util.ArrayList;

import reportDAO.ReportDAO;
import reportVO.ReportVO;
import reportVO.ReportlistVO;

public class ReportService {
	
	ReportDAO rDao;
	
	public ReportService() {
		rDao = new ReportDAO();
	}
	
	public int addReport(ReportVO rVo) {
		
		// 과제 업로드 시 DB에서 각 정보 조회 저장
		rVo = rDao.selectInfo(rVo);
		
		// 과제 업로드 메소드
		int stu_no = rDao.insertReport(rVo);
		
		return stu_no;	
	}

	// 과제 list 불러오기
	public ArrayList reportInfo(int no) {
		
		ArrayList reportlist = new ArrayList();
		
		reportlist = rDao.selectreport(no);
		
		return reportlist;
	}

	public ArrayList submitlist(String stu_no) {
		
		ArrayList reportlist = new ArrayList();
		
		reportlist = rDao.submitreport(stu_no);
		
		return reportlist;
	}

}
