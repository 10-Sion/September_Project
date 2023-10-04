package reportService;

import reportDAO.ReportDAO;
import reportVO.ReportVO;

public class ReportService {
	
	ReportDAO rDao;
	
	public ReportService() {
		rDao = new ReportDAO();
	}
	
	public int addReport(ReportVO rVo) {
		System.out.println("Service 안쪽" + rVo.getContent());
		
		// addReport 할때 과목번호, 학생 이름, 주차 정보를 rVo 에 저장
		
		// 과제 업로드 메소드
		int result = rDao.insertReport(rVo);
		
		
		return result;
			
	}

}
