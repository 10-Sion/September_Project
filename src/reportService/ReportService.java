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
		// addReport 할때 과목번호, 학생 이름, 주차 정보를 rVo 에 저장
		rVo = rDao.selectInfo(rVo);
		
		System.out.println("Service 안쪽 " + rVo.getStu_no());
		System.out.println("Service 안쪽 " + rVo.getStu_name());
		System.out.println("Service 안쪽 " + rVo.getTitle());
		System.out.println("Service 안쪽 " + rVo.getContent());
		System.out.println("Service 안쪽 " + rVo.getWeek());
		
		
		// 과제 업로드 메소드
		int result = rDao.insertReport(rVo);
		
		return result;	
	}

	// 과제 list 불러오기
	public ArrayList reportInfo() {
		
		ArrayList reportlist = new ArrayList();
		
		reportlist = rDao.selectreport();
		
		return reportlist;
	}

}
