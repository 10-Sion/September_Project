package reportService;

import reportDAO.ReportDAO;
import reportVO.ReportVO;

public class ReportService {
	
	ReportDAO rDao;
	
	public ReportService() {
		rDao = new ReportDAO();
	}
	
	public void addReport(ReportVO rVo) {
		// 과제 업로드 메소드
		rDao.insertReport(rVo);	
	}

}
